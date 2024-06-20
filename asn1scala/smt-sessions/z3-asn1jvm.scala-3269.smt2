; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74098 () Bool)

(assert start!74098)

(declare-fun b!326891 () Bool)

(declare-fun res!268366 () Bool)

(declare-fun e!236167 () Bool)

(assert (=> b!326891 (=> (not res!268366) (not e!236167))))

(declare-datatypes ((T!66673 0))(
  ( (T!66674 (val!553 Int)) )
))
(declare-datatypes ((array!21329 0))(
  ( (array!21330 (arr!10349 (Array (_ BitVec 32) T!66673)) (size!9257 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21329)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1867 (array!21329 array!21329 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326891 (= res!268366 (arrayRangesEq!1867 a!407 a!407 i!907 (size!9257 a!407)))))

(declare-fun b!326892 () Bool)

(declare-fun e!236168 () Bool)

(declare-fun tp_is_empty!1107 () Bool)

(declare-fun mapRes!3385 () Bool)

(assert (=> b!326892 (= e!236168 (and tp_is_empty!1107 mapRes!3385))))

(declare-fun condMapEmpty!3385 () Bool)

(declare-fun mapDefault!3385 () T!66673)

(assert (=> b!326892 (= condMapEmpty!3385 (= (arr!10349 a!407) ((as const (Array (_ BitVec 32) T!66673)) mapDefault!3385)))))

(declare-fun res!268368 () Bool)

(assert (=> start!74098 (=> (not res!268368) (not e!236167))))

(assert (=> start!74098 (= res!268368 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9257 a!407))))))

(assert (=> start!74098 e!236167))

(assert (=> start!74098 true))

(declare-fun array_inv!8804 (array!21329) Bool)

(assert (=> start!74098 (and (array_inv!8804 a!407) e!236168)))

(declare-fun mapNonEmpty!3385 () Bool)

(declare-fun tp!3385 () Bool)

(assert (=> mapNonEmpty!3385 (= mapRes!3385 (and tp!3385 tp_is_empty!1107))))

(declare-fun mapValue!3385 () T!66673)

(declare-fun mapKey!3385 () (_ BitVec 32))

(declare-fun mapRest!3385 () (Array (_ BitVec 32) T!66673))

(assert (=> mapNonEmpty!3385 (= (arr!10349 a!407) (store mapRest!3385 mapKey!3385 mapValue!3385))))

(declare-fun b!326893 () Bool)

(declare-fun res!268367 () Bool)

(assert (=> b!326893 (=> (not res!268367) (not e!236167))))

(assert (=> b!326893 (= res!268367 (and (bvsle #b00000000000000000000000000000000 (bvsub i!907 #b00000000000000000000000000000001)) (bvsle (bvsub i!907 #b00000000000000000000000000000001) (size!9257 a!407))))))

(declare-fun b!326894 () Bool)

(assert (=> b!326894 (= e!236167 (not (arrayRangesEq!1867 a!407 a!407 (bvsub i!907 #b00000000000000000000000000000001) (size!9257 a!407))))))

(declare-fun mapIsEmpty!3385 () Bool)

(assert (=> mapIsEmpty!3385 mapRes!3385))

(assert (= (and start!74098 res!268368) b!326891))

(assert (= (and b!326891 res!268366) b!326893))

(assert (= (and b!326893 res!268367) b!326894))

(assert (= (and b!326892 condMapEmpty!3385) mapIsEmpty!3385))

(assert (= (and b!326892 (not condMapEmpty!3385)) mapNonEmpty!3385))

(assert (= start!74098 b!326892))

(declare-fun m!464739 () Bool)

(assert (=> b!326891 m!464739))

(declare-fun m!464741 () Bool)

(assert (=> start!74098 m!464741))

(declare-fun m!464743 () Bool)

(assert (=> mapNonEmpty!3385 m!464743))

(declare-fun m!464745 () Bool)

(assert (=> b!326894 m!464745))

(check-sat (not b!326891) tp_is_empty!1107 (not mapNonEmpty!3385) (not b!326894) (not start!74098))
(check-sat)
(get-model)

(declare-fun d!107848 () Bool)

(declare-fun res!268382 () Bool)

(declare-fun e!236179 () Bool)

(assert (=> d!107848 (=> res!268382 e!236179)))

(assert (=> d!107848 (= res!268382 (= i!907 (size!9257 a!407)))))

(assert (=> d!107848 (= (arrayRangesEq!1867 a!407 a!407 i!907 (size!9257 a!407)) e!236179)))

(declare-fun b!326911 () Bool)

(declare-fun e!236180 () Bool)

(assert (=> b!326911 (= e!236179 e!236180)))

(declare-fun res!268383 () Bool)

(assert (=> b!326911 (=> (not res!268383) (not e!236180))))

(assert (=> b!326911 (= res!268383 (= (select (arr!10349 a!407) i!907) (select (arr!10349 a!407) i!907)))))

(declare-fun b!326912 () Bool)

(assert (=> b!326912 (= e!236180 (arrayRangesEq!1867 a!407 a!407 (bvadd i!907 #b00000000000000000000000000000001) (size!9257 a!407)))))

(assert (= (and d!107848 (not res!268382)) b!326911))

(assert (= (and b!326911 res!268383) b!326912))

(declare-fun m!464755 () Bool)

(assert (=> b!326911 m!464755))

(assert (=> b!326911 m!464755))

(declare-fun m!464757 () Bool)

(assert (=> b!326912 m!464757))

(assert (=> b!326891 d!107848))

(declare-fun d!107850 () Bool)

(assert (=> d!107850 (= (array_inv!8804 a!407) (bvsge (size!9257 a!407) #b00000000000000000000000000000000))))

(assert (=> start!74098 d!107850))

(declare-fun d!107852 () Bool)

(declare-fun res!268384 () Bool)

(declare-fun e!236181 () Bool)

(assert (=> d!107852 (=> res!268384 e!236181)))

(assert (=> d!107852 (= res!268384 (= (bvsub i!907 #b00000000000000000000000000000001) (size!9257 a!407)))))

(assert (=> d!107852 (= (arrayRangesEq!1867 a!407 a!407 (bvsub i!907 #b00000000000000000000000000000001) (size!9257 a!407)) e!236181)))

(declare-fun b!326913 () Bool)

(declare-fun e!236182 () Bool)

(assert (=> b!326913 (= e!236181 e!236182)))

(declare-fun res!268385 () Bool)

(assert (=> b!326913 (=> (not res!268385) (not e!236182))))

(assert (=> b!326913 (= res!268385 (= (select (arr!10349 a!407) (bvsub i!907 #b00000000000000000000000000000001)) (select (arr!10349 a!407) (bvsub i!907 #b00000000000000000000000000000001))))))

(declare-fun b!326914 () Bool)

(assert (=> b!326914 (= e!236182 (arrayRangesEq!1867 a!407 a!407 (bvadd (bvsub i!907 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!9257 a!407)))))

(assert (= (and d!107852 (not res!268384)) b!326913))

(assert (= (and b!326913 res!268385) b!326914))

(declare-fun m!464759 () Bool)

(assert (=> b!326913 m!464759))

(assert (=> b!326913 m!464759))

(declare-fun m!464761 () Bool)

(assert (=> b!326914 m!464761))

(assert (=> b!326894 d!107852))

(declare-fun condMapEmpty!3391 () Bool)

(declare-fun mapDefault!3391 () T!66673)

(assert (=> mapNonEmpty!3385 (= condMapEmpty!3391 (= mapRest!3385 ((as const (Array (_ BitVec 32) T!66673)) mapDefault!3391)))))

(declare-fun mapRes!3391 () Bool)

(assert (=> mapNonEmpty!3385 (= tp!3385 (and tp_is_empty!1107 mapRes!3391))))

(declare-fun mapIsEmpty!3391 () Bool)

(assert (=> mapIsEmpty!3391 mapRes!3391))

(declare-fun mapNonEmpty!3391 () Bool)

(declare-fun tp!3391 () Bool)

(assert (=> mapNonEmpty!3391 (= mapRes!3391 (and tp!3391 tp_is_empty!1107))))

(declare-fun mapValue!3391 () T!66673)

(declare-fun mapRest!3391 () (Array (_ BitVec 32) T!66673))

(declare-fun mapKey!3391 () (_ BitVec 32))

(assert (=> mapNonEmpty!3391 (= mapRest!3385 (store mapRest!3391 mapKey!3391 mapValue!3391))))

(assert (= (and mapNonEmpty!3385 condMapEmpty!3391) mapIsEmpty!3391))

(assert (= (and mapNonEmpty!3385 (not condMapEmpty!3391)) mapNonEmpty!3391))

(declare-fun m!464763 () Bool)

(assert (=> mapNonEmpty!3391 m!464763))

(check-sat (not b!326912) (not b!326914) (not mapNonEmpty!3391) tp_is_empty!1107)
(check-sat)
