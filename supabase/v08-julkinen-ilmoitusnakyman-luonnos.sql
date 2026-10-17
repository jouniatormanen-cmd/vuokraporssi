-- Vuokrapörssi v0.8: public listing projection. REVIEW BEFORE EXECUTION.
-- This script creates a narrow public view. It does NOT revoke access to base tables.
-- Do not execute until the frontend has been migrated and all existing policies audited.
create or replace view public.vp_public_listings
with (security_invoker = true)
as
select id,title,category,description,price,city,postal_code,
       price_unit,available_from,available_to,reserved_dates,images,
       contact_name,contact_email,contact_phone,status,created_at
from public.listings
where status = 'active';

-- security_invoker makes underlying listings RLS apply to callers.
-- Granting SELECT to anon/authenticated makes this view queryable.
grant select on public.vp_public_listings to anon,authenticated;

-- IMPORTANT: this view alone does NOT prevent select=* from the base table.
-- Follow-up migration must narrow base table grants / RLS and preserve
-- owner edit/delete/paused listing access. Do not revoke base SELECT
-- without a complete migration plan and a rollback.
