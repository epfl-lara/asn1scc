; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74142 () Bool)

(assert start!74142)

(declare-fun b!327123 () Bool)

(declare-fun res!268537 () Bool)

(declare-fun e!236296 () Bool)

(assert (=> b!327123 (=> (not res!268537) (not e!236296))))

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!327123 (= res!268537 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3448 () Bool)

(declare-fun mapRes!3448 () Bool)

(declare-fun tp!3448 () Bool)

(declare-fun tp_is_empty!1147 () Bool)

(assert (=> mapNonEmpty!3448 (= mapRes!3448 (and tp!3448 tp_is_empty!1147))))

(declare-datatypes ((T!66853 0))(
  ( (T!66854 (val!573 Int)) )
))
(declare-fun mapRest!3448 () (Array (_ BitVec 32) T!66853))

(declare-datatypes ((array!21370 0))(
  ( (array!21371 (arr!10369 (Array (_ BitVec 32) T!66853)) (size!9277 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21370)

(declare-fun mapKey!3448 () (_ BitVec 32))

(declare-fun mapValue!3448 () T!66853)

(assert (=> mapNonEmpty!3448 (= (arr!10369 a!407) (store mapRest!3448 mapKey!3448 mapValue!3448))))

(declare-fun mapIsEmpty!3448 () Bool)

(assert (=> mapIsEmpty!3448 mapRes!3448))

(declare-fun b!327124 () Bool)

(declare-fun res!268538 () Bool)

(assert (=> b!327124 (=> (not res!268538) (not e!236296))))

(declare-fun arrayRangesEq!1881 (array!21370 array!21370 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327124 (= res!268538 (arrayRangesEq!1881 a!407 a!407 i!907 (size!9277 a!407)))))

(declare-fun res!268536 () Bool)

(assert (=> start!74142 (=> (not res!268536) (not e!236296))))

(assert (=> start!74142 (= res!268536 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9277 a!407))))))

(assert (=> start!74142 e!236296))

(assert (=> start!74142 true))

(declare-fun e!236295 () Bool)

(declare-fun array_inv!8817 (array!21370) Bool)

(assert (=> start!74142 (and (array_inv!8817 a!407) e!236295)))

(declare-fun b!327125 () Bool)

(assert (=> b!327125 (= e!236295 (and tp_is_empty!1147 mapRes!3448))))

(declare-fun condMapEmpty!3448 () Bool)

(declare-fun mapDefault!3448 () T!66853)

