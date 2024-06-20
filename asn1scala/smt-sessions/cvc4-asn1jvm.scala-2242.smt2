; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57098 () Bool)

(assert start!57098)

(declare-fun b!261840 () Bool)

(declare-fun e!182254 () Bool)

(assert (=> b!261840 (= e!182254 (not true))))

(declare-datatypes ((T!45199 0))(
  ( (T!45200 (val!86 Int)) )
))
(declare-datatypes ((array!14515 0))(
  ( (array!14516 (arr!7320 (Array (_ BitVec 32) T!45199)) (size!6333 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14515)

(declare-fun lt!403897 () array!14515)

(declare-fun at!213 () (_ BitVec 32))

(declare-fun arrayRangesEq!957 (array!14515 array!14515 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261840 (arrayRangesEq!957 a!411 lt!403897 #b00000000000000000000000000000000 at!213)))

(declare-fun v!328 () T!45199)

(declare-datatypes ((Unit!18677 0))(
  ( (Unit!18678) )
))
(declare-fun lt!403898 () Unit!18677)

(declare-fun rec!26 (array!14515 (_ BitVec 32) T!45199 (_ BitVec 32)) Unit!18677)

(assert (=> b!261840 (= lt!403898 (rec!26 a!411 at!213 v!328 at!213))))

(declare-fun mapIsEmpty!502 () Bool)

(declare-fun mapRes!502 () Bool)

(assert (=> mapIsEmpty!502 mapRes!502))

(declare-fun b!261841 () Bool)

(declare-fun e!182252 () Bool)

(assert (=> b!261841 (= e!182252 e!182254)))

(declare-fun res!219184 () Bool)

(assert (=> b!261841 (=> (not res!219184) (not e!182254))))

(assert (=> b!261841 (= res!219184 (arrayRangesEq!957 a!411 lt!403897 at!213 at!213))))

(assert (=> b!261841 (= lt!403897 (array!14516 (store (arr!7320 a!411) at!213 v!328) (size!6333 a!411)))))

(declare-fun b!261842 () Bool)

(declare-fun e!182253 () Bool)

(declare-fun tp_is_empty!173 () Bool)

(assert (=> b!261842 (= e!182253 (and tp_is_empty!173 mapRes!502))))

(declare-fun condMapEmpty!502 () Bool)

(declare-fun mapDefault!502 () T!45199)

