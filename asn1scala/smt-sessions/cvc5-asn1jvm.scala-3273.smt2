; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74124 () Bool)

(assert start!74124)

(declare-fun mapIsEmpty!3421 () Bool)

(declare-fun mapRes!3421 () Bool)

(assert (=> mapIsEmpty!3421 mapRes!3421))

(declare-fun mapNonEmpty!3421 () Bool)

(declare-fun tp!3421 () Bool)

(declare-fun tp_is_empty!1129 () Bool)

(assert (=> mapNonEmpty!3421 (= mapRes!3421 (and tp!3421 tp_is_empty!1129))))

(declare-datatypes ((T!66775 0))(
  ( (T!66776 (val!564 Int)) )
))
(declare-fun mapRest!3421 () (Array (_ BitVec 32) T!66775))

(declare-fun mapValue!3421 () T!66775)

(declare-fun mapKey!3421 () (_ BitVec 32))

(declare-datatypes ((array!21352 0))(
  ( (array!21353 (arr!10360 (Array (_ BitVec 32) T!66775)) (size!9268 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21352)

(assert (=> mapNonEmpty!3421 (= (arr!10360 a!407) (store mapRest!3421 mapKey!3421 mapValue!3421))))

(declare-fun b!327034 () Bool)

(declare-fun res!268475 () Bool)

(declare-fun e!236242 () Bool)

(assert (=> b!327034 (=> (not res!268475) (not e!236242))))

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!327034 (= res!268475 (= i!907 #b00000000000000000000000000000000))))

(declare-fun b!327035 () Bool)

(declare-fun e!236241 () Bool)

(assert (=> b!327035 (= e!236241 (and tp_is_empty!1129 mapRes!3421))))

(declare-fun condMapEmpty!3421 () Bool)

(declare-fun mapDefault!3421 () T!66775)

