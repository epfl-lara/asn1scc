; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74040 () Bool)

(assert start!74040)

(declare-fun b!326737 () Bool)

(declare-fun e!236053 () Bool)

(declare-datatypes ((T!66489 0))(
  ( (T!66490 (val!531 Int)) )
))
(declare-datatypes ((array!21282 0))(
  ( (array!21283 (arr!10327 (Array (_ BitVec 32) T!66489)) (size!9235 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21282)

(declare-fun arrayRangesEq!1856 (array!21282 array!21282 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326737 (= e!236053 (not (arrayRangesEq!1856 a!404 a!404 (size!9235 a!404) (size!9235 a!404))))))

(declare-fun mapNonEmpty!3310 () Bool)

(declare-fun mapRes!3310 () Bool)

(declare-fun tp!3310 () Bool)

(declare-fun tp_is_empty!1063 () Bool)

(assert (=> mapNonEmpty!3310 (= mapRes!3310 (and tp!3310 tp_is_empty!1063))))

(declare-fun mapValue!3310 () T!66489)

(declare-fun mapKey!3310 () (_ BitVec 32))

(declare-fun mapRest!3310 () (Array (_ BitVec 32) T!66489))

(assert (=> mapNonEmpty!3310 (= (arr!10327 a!404) (store mapRest!3310 mapKey!3310 mapValue!3310))))

(declare-fun res!268296 () Bool)

(assert (=> start!74040 (=> (not res!268296) (not e!236053))))

(assert (=> start!74040 (= res!268296 (bvsle #b00000000000000000000000000000000 (size!9235 a!404)))))

(assert (=> start!74040 e!236053))

(declare-fun e!236054 () Bool)

(declare-fun array_inv!8787 (array!21282) Bool)

(assert (=> start!74040 (and (array_inv!8787 a!404) e!236054)))

(declare-fun mapIsEmpty!3310 () Bool)

(assert (=> mapIsEmpty!3310 mapRes!3310))

(declare-fun b!326738 () Bool)

(assert (=> b!326738 (= e!236054 (and tp_is_empty!1063 mapRes!3310))))

(declare-fun condMapEmpty!3310 () Bool)

(declare-fun mapDefault!3310 () T!66489)

