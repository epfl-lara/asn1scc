; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68708 () Bool)

(assert start!68708)

(declare-fun b!310074 () Bool)

(declare-fun e!222875 () Bool)

(declare-fun tp_is_empty!977 () Bool)

(declare-fun mapRes!3103 () Bool)

(assert (=> b!310074 (= e!222875 (and tp_is_empty!977 mapRes!3103))))

(declare-fun condMapEmpty!3103 () Bool)

(declare-datatypes ((T!58423 0))(
  ( (T!58424 (val!488 Int)) )
))
(declare-datatypes ((array!18843 0))(
  ( (array!18844 (arr!9258 (Array (_ BitVec 32) T!58423)) (size!8175 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18843)

(declare-fun mapDefault!3103 () T!58423)

