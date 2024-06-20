; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65312 () Bool)

(assert start!65312)

(declare-fun b!292966 () Bool)

(declare-fun res!241951 () Bool)

(declare-fun e!209101 () Bool)

(assert (=> b!292966 (=> (not res!241951) (not e!209101))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292966 (= res!241951 (bvslt from!505 to!474))))

(declare-fun b!292965 () Bool)

(declare-fun res!241950 () Bool)

(assert (=> b!292965 (=> (not res!241950) (not e!209101))))

(declare-datatypes ((array!17460 0))(
  ( (array!17461 (arr!8589 (Array (_ BitVec 32) (_ BitVec 8))) (size!7563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13130 0))(
  ( (BitStream!13131 (buf!7626 array!17460) (currentByte!14090 (_ BitVec 32)) (currentBit!14085 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13130)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292965 (= res!241950 (validate_offset_bits!1 ((_ sign_extend 32) (size!7563 (buf!7626 thiss!1728))) ((_ sign_extend 32) (currentByte!14090 thiss!1728)) ((_ sign_extend 32) (currentBit!14085 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292967 () Bool)

(assert (=> b!292967 (= e!209101 false)))

(declare-datatypes ((tuple2!22956 0))(
  ( (tuple2!22957 (_1!12783 Bool) (_2!12783 BitStream!13130)) )
))
(declare-fun lt!425148 () tuple2!22956)

(declare-fun readBit!0 (BitStream!13130) tuple2!22956)

(assert (=> b!292967 (= lt!425148 (readBit!0 thiss!1728))))

(declare-fun b!292968 () Bool)

(declare-fun e!209102 () Bool)

(declare-fun array_inv!7175 (array!17460) Bool)

(assert (=> b!292968 (= e!209102 (array_inv!7175 (buf!7626 thiss!1728)))))

(declare-fun res!241952 () Bool)

(assert (=> start!65312 (=> (not res!241952) (not e!209101))))

(declare-fun arr!273 () array!17460)

(assert (=> start!65312 (= res!241952 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7563 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65312 e!209101))

(declare-fun inv!12 (BitStream!13130) Bool)

(assert (=> start!65312 (and (inv!12 thiss!1728) e!209102)))

(assert (=> start!65312 true))

(assert (=> start!65312 (array_inv!7175 arr!273)))

(assert (= (and start!65312 res!241952) b!292965))

(assert (= (and b!292965 res!241950) b!292966))

(assert (= (and b!292966 res!241951) b!292967))

(assert (= start!65312 b!292968))

(declare-fun m!428565 () Bool)

(assert (=> b!292965 m!428565))

(declare-fun m!428567 () Bool)

(assert (=> b!292967 m!428567))

(declare-fun m!428569 () Bool)

(assert (=> b!292968 m!428569))

(declare-fun m!428571 () Bool)

(assert (=> start!65312 m!428571))

(declare-fun m!428573 () Bool)

(assert (=> start!65312 m!428573))

(push 1)

(assert (not b!292967))

(assert (not b!292968))

(assert (not start!65312))

(assert (not b!292965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

