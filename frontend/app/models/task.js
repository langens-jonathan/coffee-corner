import DS from 'ember-data';

export default DS.Model.extend({
    title: DS.attr('string'),
    description: DS.attr('string'),
    done: DS.attr('boolean'),
    due:  DS.attr('date'),
    priority: DS.attr('number'),
    author: DS.hasMany('user'),
    tag: DS.hasMany('tag')
});
