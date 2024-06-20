; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74032 () Bool)

(assert start!74032)

(declare-datatypes ((T!66463 0))(
  ( (T!66464 (val!528 Int)) )
))
(declare-datatypes ((array!21275 0))(
  ( (array!21276 (arr!10324 (Array (_ BitVec 32) T!66463)) (size!9232 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21275)

(assert (=> start!74032 (bvsgt #b00000000000000000000000000000000 (size!9232 a!404))))

(declare-fun e!236042 () Bool)

(declare-fun array_inv!8784 (array!21275) Bool)

(assert (=> start!74032 (and (array_inv!8784 a!404) e!236042)))

(declare-fun b!326724 () Bool)

(declare-fun tp_is_empty!1057 () Bool)

(declare-fun mapRes!3298 () Bool)

(assert (=> b!326724 (= e!236042 (and tp_is_empty!1057 mapRes!3298))))

(declare-fun condMapEmpty!3298 () Bool)

(declare-fun mapDefault!3298 () T!66463)

