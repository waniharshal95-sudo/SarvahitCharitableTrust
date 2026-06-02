create table if not exists public.volunteer_registrations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  email text,
  city text not null,
  interest text not null,
  availability text not null,
  created_at timestamptz not null default now()
);

alter table public.volunteer_registrations
drop column if exists address;

alter table public.volunteer_registrations enable row level security;

drop policy if exists "Allow public volunteer registration" on public.volunteer_registrations;
create policy "Allow public volunteer registration"
on public.volunteer_registrations
for insert
to anon
with check (true);

drop policy if exists "Allow owner panel read for static site" on public.volunteer_registrations;
create policy "Allow owner panel read for static site"
on public.volunteer_registrations
for select
to anon
using (true);

drop policy if exists "Allow owner panel delete for static site" on public.volunteer_registrations;
create policy "Allow owner panel delete for static site"
on public.volunteer_registrations
for delete
to anon
using (true);

create table if not exists public.trusted_reviews (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  review text not null,
  created_at timestamptz not null default now()
);

alter table public.trusted_reviews enable row level security;

drop policy if exists "Allow public trusted review submission" on public.trusted_reviews;
create policy "Allow public trusted review submission"
on public.trusted_reviews
for insert
to anon
with check (true);

drop policy if exists "Allow admin panel trusted review read" on public.trusted_reviews;
create policy "Allow admin panel trusted review read"
on public.trusted_reviews
for select
to anon
using (true);

drop policy if exists "Allow admin panel trusted review delete" on public.trusted_reviews;
create policy "Allow admin panel trusted review delete"
on public.trusted_reviews
for delete
to anon
using (true);
