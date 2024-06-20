; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68680 () Bool)

(assert start!68680)

(declare-fun b!309822 () Bool)

(declare-fun e!222748 () Bool)

(declare-fun tp_is_empty!949 () Bool)

(declare-fun mapRes!3019 () Bool)

(assert (=> b!309822 (= e!222748 (and tp_is_empty!949 mapRes!3019))))

(declare-fun condMapEmpty!3020 () Bool)

(declare-datatypes ((T!58315 0))(
  ( (T!58316 (val!474 Int)) )
))
(declare-datatypes ((array!18815 0))(
  ( (array!18816 (arr!9244 (Array (_ BitVec 32) T!58315)) (size!8161 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18815)

(declare-fun mapDefault!3020 () T!58315)

