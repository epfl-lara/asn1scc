; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64160 () Bool)

(assert start!64160)

(declare-fun mapNonEmpty!1905 () Bool)

(declare-fun mapRes!1906 () Bool)

(declare-fun tp!1906 () Bool)

(declare-fun tp_is_empty!585 () Bool)

(assert (=> mapNonEmpty!1905 (= mapRes!1906 (and tp!1906 tp_is_empty!585))))

(declare-datatypes ((T!52011 0))(
  ( (T!52012 (val!292 Int)) )
))
(declare-fun mapValue!1905 () T!52011)

(declare-datatypes ((array!16866 0))(
  ( (array!16867 (arr!8279 (Array (_ BitVec 32) T!52011)) (size!7283 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16866)

(declare-fun mapRest!1906 () (Array (_ BitVec 32) T!52011))

(declare-fun mapKey!1905 () (_ BitVec 32))

(assert (=> mapNonEmpty!1905 (= (arr!8279 a2!580) (store mapRest!1906 mapKey!1905 mapValue!1905))))

(declare-fun mapNonEmpty!1906 () Bool)

(declare-fun mapRes!1905 () Bool)

(declare-fun tp!1905 () Bool)

(assert (=> mapNonEmpty!1906 (= mapRes!1905 (and tp!1905 tp_is_empty!585))))

(declare-fun mapValue!1906 () T!52011)

(declare-fun mapKey!1906 () (_ BitVec 32))

(declare-fun mapRest!1905 () (Array (_ BitVec 32) T!52011))

(declare-fun a1!580 () array!16866)

(assert (=> mapNonEmpty!1906 (= (arr!8279 a1!580) (store mapRest!1905 mapKey!1906 mapValue!1906))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(assert (=> start!64160 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7283 a1!580) (size!7283 a2!580)) (bvslt to!673 (size!7283 a1!580)) (bvsgt to!673 (size!7283 a1!580)))))

(assert (=> start!64160 true))

(declare-fun e!204482 () Bool)

(declare-fun array_inv!6931 (array!16866) Bool)

(assert (=> start!64160 (and (array_inv!6931 a1!580) e!204482)))

(declare-fun e!204481 () Bool)

(assert (=> start!64160 (and (array_inv!6931 a2!580) e!204481)))

(declare-fun mapIsEmpty!1905 () Bool)

(assert (=> mapIsEmpty!1905 mapRes!1906))

(declare-fun b!287181 () Bool)

(assert (=> b!287181 (= e!204481 (and tp_is_empty!585 mapRes!1906))))

(declare-fun condMapEmpty!1906 () Bool)

(declare-fun mapDefault!1906 () T!52011)

(assert (=> b!287181 (= condMapEmpty!1906 (= (arr!8279 a2!580) ((as const (Array (_ BitVec 32) T!52011)) mapDefault!1906)))))

(declare-fun b!287182 () Bool)

(assert (=> b!287182 (= e!204482 (and tp_is_empty!585 mapRes!1905))))

(declare-fun condMapEmpty!1905 () Bool)

(declare-fun mapDefault!1905 () T!52011)

(assert (=> b!287182 (= condMapEmpty!1905 (= (arr!8279 a1!580) ((as const (Array (_ BitVec 32) T!52011)) mapDefault!1905)))))

(declare-fun mapIsEmpty!1906 () Bool)

(assert (=> mapIsEmpty!1906 mapRes!1905))

(assert (= (and b!287182 condMapEmpty!1905) mapIsEmpty!1906))

(assert (= (and b!287182 (not condMapEmpty!1905)) mapNonEmpty!1906))

(assert (= start!64160 b!287182))

(assert (= (and b!287181 condMapEmpty!1906) mapIsEmpty!1905))

(assert (= (and b!287181 (not condMapEmpty!1906)) mapNonEmpty!1905))

(assert (= start!64160 b!287181))

(declare-fun m!419849 () Bool)

(assert (=> mapNonEmpty!1905 m!419849))

(declare-fun m!419851 () Bool)

(assert (=> mapNonEmpty!1906 m!419851))

(declare-fun m!419853 () Bool)

(assert (=> start!64160 m!419853))

(declare-fun m!419855 () Bool)

(assert (=> start!64160 m!419855))

(check-sat (not start!64160) (not mapNonEmpty!1905) (not mapNonEmpty!1906) tp_is_empty!585)
(check-sat)
