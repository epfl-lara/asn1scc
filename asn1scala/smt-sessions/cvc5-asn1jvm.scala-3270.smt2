; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74106 () Bool)

(assert start!74106)

(declare-fun res!268393 () Bool)

(declare-fun e!236187 () Bool)

(assert (=> start!74106 (=> (not res!268393) (not e!236187))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66697 0))(
  ( (T!66698 (val!555 Int)) )
))
(declare-datatypes ((array!21334 0))(
  ( (array!21335 (arr!10351 (Array (_ BitVec 32) T!66697)) (size!9259 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21334)

(assert (=> start!74106 (= res!268393 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9259 a!407))))))

(assert (=> start!74106 e!236187))

(assert (=> start!74106 true))

(declare-fun e!236188 () Bool)

(declare-fun array_inv!8806 (array!21334) Bool)

(assert (=> start!74106 (and (array_inv!8806 a!407) e!236188)))

(declare-fun mapIsEmpty!3394 () Bool)

(declare-fun mapRes!3394 () Bool)

(assert (=> mapIsEmpty!3394 mapRes!3394))

(declare-fun mapNonEmpty!3394 () Bool)

(declare-fun tp!3394 () Bool)

(declare-fun tp_is_empty!1111 () Bool)

(assert (=> mapNonEmpty!3394 (= mapRes!3394 (and tp!3394 tp_is_empty!1111))))

(declare-fun mapRest!3394 () (Array (_ BitVec 32) T!66697))

(declare-fun mapKey!3394 () (_ BitVec 32))

(declare-fun mapValue!3394 () T!66697)

(assert (=> mapNonEmpty!3394 (= (arr!10351 a!407) (store mapRest!3394 mapKey!3394 mapValue!3394))))

(declare-fun b!326925 () Bool)

(declare-fun res!268394 () Bool)

(assert (=> b!326925 (=> (not res!268394) (not e!236187))))

(assert (=> b!326925 (= res!268394 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun b!326926 () Bool)

(declare-fun res!268392 () Bool)

(assert (=> b!326926 (=> (not res!268392) (not e!236187))))

(declare-fun arrayRangesEq!1869 (array!21334 array!21334 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326926 (= res!268392 (arrayRangesEq!1869 a!407 a!407 i!907 (size!9259 a!407)))))

(declare-fun b!326927 () Bool)

(assert (=> b!326927 (= e!236188 (and tp_is_empty!1111 mapRes!3394))))

(declare-fun condMapEmpty!3394 () Bool)

(declare-fun mapDefault!3394 () T!66697)

