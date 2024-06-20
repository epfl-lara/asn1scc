; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74158 () Bool)

(assert start!74158)

(declare-fun mapIsEmpty!3474 () Bool)

(declare-fun mapRes!3474 () Bool)

(assert (=> mapIsEmpty!3474 mapRes!3474))

(declare-fun b!327183 () Bool)

(declare-fun e!236337 () Bool)

(declare-fun tp_is_empty!1157 () Bool)

(declare-fun mapRes!3475 () Bool)

(assert (=> b!327183 (= e!236337 (and tp_is_empty!1157 mapRes!3475))))

(declare-fun condMapEmpty!3475 () Bool)

(declare-datatypes ((T!66883 0))(
  ( (T!66884 (val!578 Int)) )
))
(declare-datatypes ((array!21381 0))(
  ( (array!21382 (arr!10374 (Array (_ BitVec 32) T!66883)) (size!9282 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21381)

(declare-fun mapDefault!3475 () T!66883)

