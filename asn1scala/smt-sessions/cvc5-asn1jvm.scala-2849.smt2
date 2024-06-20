; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68608 () Bool)

(assert start!68608)

(declare-fun mapIsEmpty!2831 () Bool)

(declare-fun mapRes!2831 () Bool)

(assert (=> mapIsEmpty!2831 mapRes!2831))

(declare-fun b!309060 () Bool)

(declare-fun e!222346 () Bool)

(declare-fun tp_is_empty!889 () Bool)

(declare-fun mapRes!2832 () Bool)

(assert (=> b!309060 (= e!222346 (and tp_is_empty!889 mapRes!2832))))

(declare-fun condMapEmpty!2832 () Bool)

(declare-datatypes ((T!58055 0))(
  ( (T!58056 (val!444 Int)) )
))
(declare-datatypes ((array!18753 0))(
  ( (array!18754 (arr!9214 (Array (_ BitVec 32) T!58055)) (size!8131 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18753)

(declare-fun mapDefault!2832 () T!58055)

