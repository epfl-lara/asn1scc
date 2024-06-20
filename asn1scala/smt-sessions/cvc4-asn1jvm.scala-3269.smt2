; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74100 () Bool)

(assert start!74100)

(declare-fun b!326903 () Bool)

(declare-fun res!268376 () Bool)

(declare-fun e!236174 () Bool)

(assert (=> b!326903 (=> (not res!268376) (not e!236174))))

(declare-datatypes ((T!66675 0))(
  ( (T!66676 (val!554 Int)) )
))
(declare-datatypes ((array!21331 0))(
  ( (array!21332 (arr!10350 (Array (_ BitVec 32) T!66675)) (size!9258 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21331)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1868 (array!21331 array!21331 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326903 (= res!268376 (arrayRangesEq!1868 a!407 a!407 i!907 (size!9258 a!407)))))

(declare-fun res!268377 () Bool)

(assert (=> start!74100 (=> (not res!268377) (not e!236174))))

(assert (=> start!74100 (= res!268377 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9258 a!407))))))

(assert (=> start!74100 e!236174))

(assert (=> start!74100 true))

(declare-fun e!236173 () Bool)

(declare-fun array_inv!8805 (array!21331) Bool)

(assert (=> start!74100 (and (array_inv!8805 a!407) e!236173)))

(declare-fun b!326904 () Bool)

(assert (=> b!326904 (= e!236174 (not (arrayRangesEq!1868 a!407 a!407 (bvsub i!907 #b00000000000000000000000000000001) (size!9258 a!407))))))

(declare-fun b!326905 () Bool)

(declare-fun res!268375 () Bool)

(assert (=> b!326905 (=> (not res!268375) (not e!236174))))

(assert (=> b!326905 (= res!268375 (and (bvsle #b00000000000000000000000000000000 (bvsub i!907 #b00000000000000000000000000000001)) (bvsle (bvsub i!907 #b00000000000000000000000000000001) (size!9258 a!407))))))

(declare-fun mapIsEmpty!3388 () Bool)

(declare-fun mapRes!3388 () Bool)

(assert (=> mapIsEmpty!3388 mapRes!3388))

(declare-fun mapNonEmpty!3388 () Bool)

(declare-fun tp!3388 () Bool)

(declare-fun tp_is_empty!1109 () Bool)

(assert (=> mapNonEmpty!3388 (= mapRes!3388 (and tp!3388 tp_is_empty!1109))))

(declare-fun mapKey!3388 () (_ BitVec 32))

(declare-fun mapValue!3388 () T!66675)

(declare-fun mapRest!3388 () (Array (_ BitVec 32) T!66675))

(assert (=> mapNonEmpty!3388 (= (arr!10350 a!407) (store mapRest!3388 mapKey!3388 mapValue!3388))))

(declare-fun b!326906 () Bool)

(assert (=> b!326906 (= e!236173 (and tp_is_empty!1109 mapRes!3388))))

(declare-fun condMapEmpty!3388 () Bool)

(declare-fun mapDefault!3388 () T!66675)

