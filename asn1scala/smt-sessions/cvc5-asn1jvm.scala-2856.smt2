; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68662 () Bool)

(assert start!68662)

(declare-fun b!309710 () Bool)

(declare-fun e!222666 () Bool)

(declare-fun tp_is_empty!931 () Bool)

(declare-fun mapRes!2966 () Bool)

(assert (=> b!309710 (= e!222666 (and tp_is_empty!931 mapRes!2966))))

(declare-fun condMapEmpty!2965 () Bool)

(declare-datatypes ((T!58237 0))(
  ( (T!58238 (val!465 Int)) )
))
(declare-datatypes ((array!18797 0))(
  ( (array!18798 (arr!9235 (Array (_ BitVec 32) T!58237)) (size!8152 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18797)

(declare-fun mapDefault!2966 () T!58237)

