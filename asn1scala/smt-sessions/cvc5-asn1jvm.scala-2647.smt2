; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65200 () Bool)

(assert start!65200)

(declare-fun b!292535 () Bool)

(declare-fun e!208701 () Bool)

(assert (=> b!292535 (= e!208701 (not true))))

(declare-fun lt!424842 () (_ BitVec 64))

(declare-datatypes ((array!17405 0))(
  ( (array!17406 (arr!8563 (Array (_ BitVec 32) (_ BitVec 8))) (size!7537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13084 0))(
  ( (BitStream!13085 (buf!7603 array!17405) (currentByte!14058 (_ BitVec 32)) (currentBit!14053 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13084)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292535 (= lt!424842 (bitIndex!0 (size!7537 (buf!7603 thiss!1728)) (currentByte!14058 thiss!1728) (currentBit!14053 thiss!1728)))))

(declare-fun arr!273 () array!17405)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17405 array!17405 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292535 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20363 0))(
  ( (Unit!20364) )
))
(declare-fun lt!424845 () Unit!20363)

(declare-fun lt!424843 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17405 array!17405 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20363)

(assert (=> b!292535 (= lt!424845 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424843 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292535 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424843)))

(assert (=> b!292535 (= lt!424843 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7537 arr!273))))))

(declare-fun lt!424844 () Unit!20363)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17405) Unit!20363)

(assert (=> b!292535 (= lt!424844 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292533 () Bool)

(declare-fun res!241613 () Bool)

(assert (=> b!292533 (=> (not res!241613) (not e!208701))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292533 (= res!241613 (validate_offset_bits!1 ((_ sign_extend 32) (size!7537 (buf!7603 thiss!1728))) ((_ sign_extend 32) (currentByte!14058 thiss!1728)) ((_ sign_extend 32) (currentBit!14053 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292534 () Bool)

(declare-fun res!241611 () Bool)

(assert (=> b!292534 (=> (not res!241611) (not e!208701))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292534 (= res!241611 (bvsge from!505 to!474))))

(declare-fun res!241612 () Bool)

(assert (=> start!65200 (=> (not res!241612) (not e!208701))))

(assert (=> start!65200 (= res!241612 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7537 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65200 e!208701))

(declare-fun e!208698 () Bool)

(declare-fun inv!12 (BitStream!13084) Bool)

(assert (=> start!65200 (and (inv!12 thiss!1728) e!208698)))

(assert (=> start!65200 true))

(declare-fun array_inv!7149 (array!17405) Bool)

(assert (=> start!65200 (array_inv!7149 arr!273)))

(declare-fun b!292536 () Bool)

(assert (=> b!292536 (= e!208698 (array_inv!7149 (buf!7603 thiss!1728)))))

(assert (= (and start!65200 res!241612) b!292533))

(assert (= (and b!292533 res!241613) b!292534))

(assert (= (and b!292534 res!241611) b!292535))

(assert (= start!65200 b!292536))

(declare-fun m!428095 () Bool)

(assert (=> b!292535 m!428095))

(declare-fun m!428097 () Bool)

(assert (=> b!292535 m!428097))

(declare-fun m!428099 () Bool)

(assert (=> b!292535 m!428099))

(declare-fun m!428101 () Bool)

(assert (=> b!292535 m!428101))

(declare-fun m!428103 () Bool)

(assert (=> b!292535 m!428103))

(declare-fun m!428105 () Bool)

(assert (=> b!292533 m!428105))

(declare-fun m!428107 () Bool)

(assert (=> start!65200 m!428107))

(declare-fun m!428109 () Bool)

(assert (=> start!65200 m!428109))

(declare-fun m!428111 () Bool)

(assert (=> b!292536 m!428111))

(push 1)

(assert (not b!292535))

(assert (not b!292533))

(assert (not start!65200))

(assert (not b!292536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

