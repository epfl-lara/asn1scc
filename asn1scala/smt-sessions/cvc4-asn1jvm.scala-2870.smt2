; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68758 () Bool)

(assert start!68758)

(declare-fun b!310553 () Bool)

(declare-fun e!223081 () Bool)

(declare-fun tp_is_empty!1019 () Bool)

(declare-fun mapRes!3237 () Bool)

(assert (=> b!310553 (= e!223081 (and tp_is_empty!1019 mapRes!3237))))

(declare-fun condMapEmpty!3238 () Bool)

(declare-datatypes ((T!58605 0))(
  ( (T!58606 (val!509 Int)) )
))
(declare-datatypes ((array!18887 0))(
  ( (array!18888 (arr!9279 (Array (_ BitVec 32) T!58605)) (size!8196 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18887)

(declare-fun mapDefault!3237 () T!58605)

