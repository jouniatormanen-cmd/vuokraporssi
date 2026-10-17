-- Suorita tämä ennen viestitoiminnon testausta Supabasen SQL Editorissa.
-- Vahvistaa aiemmin luodun viestitaulun lähetysoikeudet.
ALTER TABLE public.vp_messages ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Send own messages" ON public.vp_messages;
CREATE POLICY "Send own messages" ON public.vp_messages
FOR INSERT TO authenticated
WITH CHECK (
 auth.uid() = sender_id
 AND sender_id <> receiver_id
 AND char_length(btrim(message)) BETWEEN 1 AND 3000
 AND (
  EXISTS (
   SELECT 1 FROM public.listings l
   WHERE l.id = listing_id AND l.owner_id = receiver_id AND l.status = 'active'
  )
  OR EXISTS (
   SELECT 1 FROM public.listings l
   WHERE l.id = listing_id AND l.owner_id = sender_id
   AND EXISTS (
    SELECT 1 FROM public.vp_messages previous
    WHERE previous.listing_id = listing_id
      AND previous.sender_id = receiver_id
      AND previous.receiver_id = sender_id
   )
  )
 )
);
-- Rajoita viestien luku vain osapuoliin.
DROP POLICY IF EXISTS "Read own messages" ON public.vp_messages;
CREATE POLICY "Read own messages" ON public.vp_messages
FOR SELECT TO authenticated
USING (auth.uid() = sender_id OR auth.uid() = receiver_id);
