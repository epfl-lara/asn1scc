; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74156 () Bool)

(assert start!74156)

(declare-datatypes ((T!66881 0))(
  ( (T!66882 (val!577 Int)) )
))
(declare-datatypes ((array!21379 0))(
  ( (array!21380 (arr!10373 (Array (_ BitVec 32) T!66881)) (size!9281 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21379)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(declare-fun a2!451 () array!21379)

(assert (=> start!74156 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9281 a1!451) (size!9281 a2!451)) (bvsle to!544 (size!9281 a1!451)) (not (= from!577 to!544)) (= (select (arr!10373 a1!451) from!577) (select (arr!10373 a2!451) from!577)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!577)) (bvsgt (bvadd #b00000000000000000000000000000001 from!577) to!544)))))

(assert (=> start!74156 true))

(declare-fun e!236330 () Bool)

(declare-fun array_inv!8820 (array!21379) Bool)

(assert (=> start!74156 (and (array_inv!8820 a1!451) e!236330)))

(declare-fun e!236331 () Bool)

(assert (=> start!74156 (and (array_inv!8820 a2!451) e!236331)))

(declare-fun mapIsEmpty!3468 () Bool)

(declare-fun mapRes!3469 () Bool)

(assert (=> mapIsEmpty!3468 mapRes!3469))

(declare-fun b!327177 () Bool)

(declare-fun tp_is_empty!1155 () Bool)

(declare-fun mapRes!3468 () Bool)

(assert (=> b!327177 (= e!236330 (and tp_is_empty!1155 mapRes!3468))))

(declare-fun condMapEmpty!3468 () Bool)

(declare-fun mapDefault!3469 () T!66881)

(assert (=> b!327177 (= condMapEmpty!3468 (= (arr!10373 a1!451) ((as const (Array (_ BitVec 32) T!66881)) mapDefault!3469)))))

(declare-fun b!327178 () Bool)

(assert (=> b!327178 (= e!236331 (and tp_is_empty!1155 mapRes!3469))))

(declare-fun condMapEmpty!3469 () Bool)

(declare-fun mapDefault!3468 () T!66881)

(assert (=> b!327178 (= condMapEmpty!3469 (= (arr!10373 a2!451) ((as const (Array (_ BitVec 32) T!66881)) mapDefault!3468)))))

(declare-fun mapNonEmpty!3468 () Bool)

(declare-fun tp!3468 () Bool)

(assert (=> mapNonEmpty!3468 (= mapRes!3469 (and tp!3468 tp_is_empty!1155))))

(declare-fun mapKey!3468 () (_ BitVec 32))

(declare-fun mapValue!3469 () T!66881)

(declare-fun mapRest!3468 () (Array (_ BitVec 32) T!66881))

(assert (=> mapNonEmpty!3468 (= (arr!10373 a2!451) (store mapRest!3468 mapKey!3468 mapValue!3469))))

(declare-fun mapNonEmpty!3469 () Bool)

(declare-fun tp!3469 () Bool)

(assert (=> mapNonEmpty!3469 (= mapRes!3468 (and tp!3469 tp_is_empty!1155))))

(declare-fun mapRest!3469 () (Array (_ BitVec 32) T!66881))

(declare-fun mapKey!3469 () (_ BitVec 32))

(declare-fun mapValue!3468 () T!66881)

(assert (=> mapNonEmpty!3469 (= (arr!10373 a1!451) (store mapRest!3469 mapKey!3469 mapValue!3468))))

(declare-fun mapIsEmpty!3469 () Bool)

(assert (=> mapIsEmpty!3469 mapRes!3468))

(assert (= (and b!327177 condMapEmpty!3468) mapIsEmpty!3469))

(assert (= (and b!327177 (not condMapEmpty!3468)) mapNonEmpty!3469))

(assert (= start!74156 b!327177))

(assert (= (and b!327178 condMapEmpty!3469) mapIsEmpty!3468))

(assert (= (and b!327178 (not condMapEmpty!3469)) mapNonEmpty!3468))

(assert (= start!74156 b!327178))

(declare-fun m!464951 () Bool)

(assert (=> start!74156 m!464951))

(declare-fun m!464953 () Bool)

(assert (=> start!74156 m!464953))

(declare-fun m!464955 () Bool)

(assert (=> start!74156 m!464955))

(declare-fun m!464957 () Bool)

(assert (=> start!74156 m!464957))

(declare-fun m!464959 () Bool)

(assert (=> mapNonEmpty!3468 m!464959))

(declare-fun m!464961 () Bool)

(assert (=> mapNonEmpty!3469 m!464961))

(check-sat (not start!74156) (not mapNonEmpty!3469) (not mapNonEmpty!3468) tp_is_empty!1155)
(check-sat)
