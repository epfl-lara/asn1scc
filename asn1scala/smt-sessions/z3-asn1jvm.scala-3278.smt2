; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74162 () Bool)

(assert start!74162)

(declare-fun b!327195 () Bool)

(declare-fun e!236348 () Bool)

(declare-fun tp_is_empty!1161 () Bool)

(declare-fun mapRes!3486 () Bool)

(assert (=> b!327195 (= e!236348 (and tp_is_empty!1161 mapRes!3486))))

(declare-fun condMapEmpty!3486 () Bool)

(declare-datatypes ((T!66907 0))(
  ( (T!66908 (val!580 Int)) )
))
(declare-datatypes ((array!21385 0))(
  ( (array!21386 (arr!10376 (Array (_ BitVec 32) T!66907)) (size!9284 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21385)

(declare-fun mapDefault!3486 () T!66907)

(assert (=> b!327195 (= condMapEmpty!3486 (= (arr!10376 a2!451) ((as const (Array (_ BitVec 32) T!66907)) mapDefault!3486)))))

(declare-fun mapNonEmpty!3486 () Bool)

(declare-fun tp!3487 () Bool)

(assert (=> mapNonEmpty!3486 (= mapRes!3486 (and tp!3487 tp_is_empty!1161))))

(declare-fun mapValue!3486 () T!66907)

(declare-fun mapRest!3487 () (Array (_ BitVec 32) T!66907))

(declare-fun mapKey!3487 () (_ BitVec 32))

(assert (=> mapNonEmpty!3486 (= (arr!10376 a2!451) (store mapRest!3487 mapKey!3487 mapValue!3486))))

(declare-fun b!327196 () Bool)

(declare-fun e!236349 () Bool)

(declare-fun mapRes!3487 () Bool)

(assert (=> b!327196 (= e!236349 (and tp_is_empty!1161 mapRes!3487))))

(declare-fun condMapEmpty!3487 () Bool)

(declare-fun a1!451 () array!21385)

(declare-fun mapDefault!3487 () T!66907)

(assert (=> b!327196 (= condMapEmpty!3487 (= (arr!10376 a1!451) ((as const (Array (_ BitVec 32) T!66907)) mapDefault!3487)))))

(declare-fun mapIsEmpty!3486 () Bool)

(assert (=> mapIsEmpty!3486 mapRes!3487))

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(assert (=> start!74162 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9284 a1!451) (size!9284 a2!451)) (bvsle to!544 (size!9284 a1!451)) (not (= (bvand to!544 #b10000000000000000000000000000000) (bvand from!577 #b10000000000000000000000000000000))) (not (= (bvand to!544 #b10000000000000000000000000000000) (bvand (bvsub to!544 from!577) #b10000000000000000000000000000000))))))

(assert (=> start!74162 true))

(declare-fun array_inv!8821 (array!21385) Bool)

(assert (=> start!74162 (and (array_inv!8821 a1!451) e!236349)))

(assert (=> start!74162 (and (array_inv!8821 a2!451) e!236348)))

(declare-fun mapNonEmpty!3487 () Bool)

(declare-fun tp!3486 () Bool)

(assert (=> mapNonEmpty!3487 (= mapRes!3487 (and tp!3486 tp_is_empty!1161))))

(declare-fun mapValue!3487 () T!66907)

(declare-fun mapKey!3486 () (_ BitVec 32))

(declare-fun mapRest!3486 () (Array (_ BitVec 32) T!66907))

(assert (=> mapNonEmpty!3487 (= (arr!10376 a1!451) (store mapRest!3486 mapKey!3486 mapValue!3487))))

(declare-fun mapIsEmpty!3487 () Bool)

(assert (=> mapIsEmpty!3487 mapRes!3486))

(assert (= (and b!327196 condMapEmpty!3487) mapIsEmpty!3486))

(assert (= (and b!327196 (not condMapEmpty!3487)) mapNonEmpty!3487))

(assert (= start!74162 b!327196))

(assert (= (and b!327195 condMapEmpty!3486) mapIsEmpty!3487))

(assert (= (and b!327195 (not condMapEmpty!3486)) mapNonEmpty!3486))

(assert (= start!74162 b!327195))

(declare-fun m!464983 () Bool)

(assert (=> mapNonEmpty!3486 m!464983))

(declare-fun m!464985 () Bool)

(assert (=> start!74162 m!464985))

(declare-fun m!464987 () Bool)

(assert (=> start!74162 m!464987))

(declare-fun m!464989 () Bool)

(assert (=> mapNonEmpty!3487 m!464989))

(check-sat (not start!74162) (not mapNonEmpty!3486) (not mapNonEmpty!3487) tp_is_empty!1161)
(check-sat)
