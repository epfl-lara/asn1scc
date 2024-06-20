; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64290 () Bool)

(assert start!64290)

(declare-fun b!288340 () Bool)

(declare-fun e!205083 () Bool)

(declare-fun tp_is_empty!711 () Bool)

(declare-fun mapRes!2290 () Bool)

(assert (=> b!288340 (= e!205083 (and tp_is_empty!711 mapRes!2290))))

(declare-fun condMapEmpty!2289 () Bool)

(declare-datatypes ((T!52557 0))(
  ( (T!52558 (val!355 Int)) )
))
(declare-datatypes ((array!16993 0))(
  ( (array!16994 (arr!8342 (Array (_ BitVec 32) T!52557)) (size!7346 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16993)

(declare-fun mapDefault!2290 () T!52557)

(assert (=> b!288340 (= condMapEmpty!2289 (= (arr!8342 a2!596) ((as const (Array (_ BitVec 32) T!52557)) mapDefault!2290)))))

(declare-fun mapNonEmpty!2289 () Bool)

(declare-fun mapRes!2289 () Bool)

(declare-fun tp!2289 () Bool)

(assert (=> mapNonEmpty!2289 (= mapRes!2289 (and tp!2289 tp_is_empty!711))))

(declare-fun a1!596 () array!16993)

(declare-fun mapKey!2290 () (_ BitVec 32))

(declare-fun mapValue!2289 () T!52557)

(declare-fun mapRest!2290 () (Array (_ BitVec 32) T!52557))

(assert (=> mapNonEmpty!2289 (= (arr!8342 a1!596) (store mapRest!2290 mapKey!2290 mapValue!2289))))

(declare-fun res!238325 () Bool)

(declare-fun e!205084 () Bool)

(assert (=> start!64290 (=> (not res!238325) (not e!205084))))

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64290 (= res!238325 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7346 a1!596) (size!7346 a2!596)) (bvslt to!689 (size!7346 a1!596))))))

(assert (=> start!64290 e!205084))

(declare-fun e!205085 () Bool)

(declare-fun array_inv!6968 (array!16993) Bool)

(assert (=> start!64290 (and (array_inv!6968 a1!596) e!205085)))

(assert (=> start!64290 (and (array_inv!6968 a2!596) e!205083)))

(assert (=> start!64290 true))

(declare-fun b!288341 () Bool)

(declare-fun res!238327 () Bool)

(assert (=> b!288341 (=> (not res!238327) (not e!205084))))

(declare-fun arrayRangesEq!1454 (array!16993 array!16993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288341 (= res!238327 (arrayRangesEq!1454 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288342 () Bool)

(assert (=> b!288342 (= e!205085 (and tp_is_empty!711 mapRes!2289))))

(declare-fun condMapEmpty!2290 () Bool)

(declare-fun mapDefault!2289 () T!52557)

(assert (=> b!288342 (= condMapEmpty!2290 (= (arr!8342 a1!596) ((as const (Array (_ BitVec 32) T!52557)) mapDefault!2289)))))

(declare-fun mapNonEmpty!2290 () Bool)

(declare-fun tp!2290 () Bool)

(assert (=> mapNonEmpty!2290 (= mapRes!2290 (and tp!2290 tp_is_empty!711))))

(declare-fun mapRest!2289 () (Array (_ BitVec 32) T!52557))

(declare-fun mapValue!2290 () T!52557)

(declare-fun mapKey!2289 () (_ BitVec 32))

(assert (=> mapNonEmpty!2290 (= (arr!8342 a2!596) (store mapRest!2289 mapKey!2289 mapValue!2290))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun b!288343 () Bool)

(assert (=> b!288343 (= e!205084 (and (not (= i!953 from!722)) (bvsgt to!689 (size!7346 a1!596))))))

(declare-fun mapIsEmpty!2289 () Bool)

(assert (=> mapIsEmpty!2289 mapRes!2289))

(declare-fun b!288344 () Bool)

(declare-fun res!238324 () Bool)

(assert (=> b!288344 (=> (not res!238324) (not e!205084))))

(assert (=> b!288344 (= res!238324 (arrayRangesEq!1454 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288345 () Bool)

(declare-fun res!238326 () Bool)

(assert (=> b!288345 (=> (not res!238326) (not e!205084))))

(assert (=> b!288345 (= res!238326 (and (= (select (arr!8342 a1!596) to!689) (select (arr!8342 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapIsEmpty!2290 () Bool)

(assert (=> mapIsEmpty!2290 mapRes!2290))

(assert (= (and start!64290 res!238325) b!288341))

(assert (= (and b!288341 res!238327) b!288345))

(assert (= (and b!288345 res!238326) b!288344))

(assert (= (and b!288344 res!238324) b!288343))

(assert (= (and b!288342 condMapEmpty!2290) mapIsEmpty!2289))

(assert (= (and b!288342 (not condMapEmpty!2290)) mapNonEmpty!2289))

(assert (= start!64290 b!288342))

(assert (= (and b!288340 condMapEmpty!2289) mapIsEmpty!2290))

(assert (= (and b!288340 (not condMapEmpty!2289)) mapNonEmpty!2290))

(assert (= start!64290 b!288340))

(declare-fun m!421031 () Bool)

(assert (=> mapNonEmpty!2289 m!421031))

(declare-fun m!421033 () Bool)

(assert (=> b!288345 m!421033))

(declare-fun m!421035 () Bool)

(assert (=> b!288345 m!421035))

(declare-fun m!421037 () Bool)

(assert (=> start!64290 m!421037))

(declare-fun m!421039 () Bool)

(assert (=> start!64290 m!421039))

(declare-fun m!421041 () Bool)

(assert (=> b!288341 m!421041))

(declare-fun m!421043 () Bool)

(assert (=> b!288344 m!421043))

(declare-fun m!421045 () Bool)

(assert (=> mapNonEmpty!2290 m!421045))

(check-sat (not b!288341) tp_is_empty!711 (not start!64290) (not mapNonEmpty!2289) (not mapNonEmpty!2290) (not b!288344))
(check-sat)
