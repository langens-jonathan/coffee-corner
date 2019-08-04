import Controller from '@ember/controller';
import { inject as service } from '@ember/service';

export default Controller.extend({
    session: service(),

    showCNI: false,

    actions: {
        showCNI: function() {
            this.set('showCNI', true);
        },

        hideCNI: function() {
            this.set('showCNI', false);
        },

        cniToggleFavorite: function() {
            this.toggleProperty('cniFavorite');
        },

        cniToggleWarn: function() {
            this.toggleProperty('cniWarn');
        },

        cniToggleHighPriority: function() {
            this.toggleProperty('cniHighPriority');
        }

    }
});
