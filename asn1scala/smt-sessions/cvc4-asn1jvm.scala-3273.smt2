; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74128 () Bool)

(assert start!74128)

(declare-fun mapNonEmpty!3427 () Bool)

(declare-fun mapRes!3427 () Bool)

(declare-fun tp!3427 () Bool)

(declare-fun tp_is_empty!1133 () Bool)

(assert (=> mapNonEmpty!3427 (= mapRes!3427 (and tp!3427 tp_is_empty!1133))))

(declare-datatypes ((T!66779 0))(
  ( (T!66780 (val!566 Int)) )
))
(declare-fun mapRest!3427 () (Array (_ BitVec 32) T!66779))

(declare-datatypes ((array!21356 0))(
  ( (array!21357 (arr!10362 (Array (_ BitVec 32) T!66779)) (size!9270 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21356)

(declare-fun mapKey!3427 () (_ BitVec 32))

(declare-fun mapValue!3427 () T!66779)

(assert (=> mapNonEmpty!3427 (= (arr!10362 a!407) (store mapRest!3427 mapKey!3427 mapValue!3427))))

(declare-fun b!327057 () Bool)

(declare-fun res!268493 () Bool)

(declare-fun e!236253 () Bool)

(assert (=> b!327057 (=> (not res!268493) (not e!236253))))

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1876 (array!21356 array!21356 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327057 (= res!268493 (arrayRangesEq!1876 a!407 a!407 i!907 (size!9270 a!407)))))

(declare-fun res!268491 () Bool)

(assert (=> start!74128 (=> (not res!268491) (not e!236253))))

(assert (=> start!74128 (= res!268491 (bvsle i!907 (size!9270 a!407)))))

(assert (=> start!74128 e!236253))

(assert (=> start!74128 true))

(declare-fun e!236254 () Bool)

(declare-fun array_inv!8812 (array!21356) Bool)

(assert (=> start!74128 (and (array_inv!8812 a!407) e!236254)))

(declare-fun b!327058 () Bool)

(assert (=> b!327058 (= e!236253 (not (arrayRangesEq!1876 a!407 a!407 #b00000000000000000000000000000000 (size!9270 a!407))))))

(declare-fun b!327059 () Bool)

(assert (=> b!327059 (= e!236254 (and tp_is_empty!1133 mapRes!3427))))

(declare-fun condMapEmpty!3427 () Bool)

(declare-fun mapDefault!3427 () T!66779)

