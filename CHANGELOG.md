# Changelog
1.2.0
-----
* `HashWithIndifferentAccess` and `Hash` do not need different implementations. Same module can be included in both and achieve the correct results. To mixin the methods to any `Hash`-like class just `include Forbidium`

1.1.1
-----
* Relax Ruby version back to >= 2.0.0, since it will work and should be compatible with `ActiveSupport` >= 4.2.0, but only test >= 2.2.2 because of compatibility with Rails 5.x in dummy app testing.

1.1.0
-----
* Respect key types in `Hash`es: filter key types must match hash key types to affect output. Different implementation for `ActionController::Parameters`, since it is `HashWithIndifferentAccess`; symbol key filters will affect string keys in params.
* Require Ruby >= 2.2.0

1.0.1
-----
* Require Ruby >= 2.0.0
* Substantial performance improvement by accessing hash keys directly instead of iterating with `#delete_if`
