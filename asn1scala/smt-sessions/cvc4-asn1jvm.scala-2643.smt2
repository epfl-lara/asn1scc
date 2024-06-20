; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65180 () Bool)

(assert start!65180)

(declare-fun b!292415 () Bool)

(declare-fun e!208578 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun lt!424723 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun lt!424725 () (_ BitVec 64))

(assert (=> b!292415 (= e!208578 (not (or (not (= (bvsub (bvadd lt!424725 to!474) from!505) lt!424725)) (bvsle from!505 lt!424723))))))

(declare-datatypes ((array!17385 0))(
  ( (array!17386 (arr!8553 (Array (_ BitVec 32) (_ BitVec 8))) (size!7527 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13064 0))(
  ( (BitStream!13065 (buf!7593 array!17385) (currentByte!14048 (_ BitVec 32)) (currentBit!14043 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13064)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292415 (= lt!424725 (bitIndex!0 (size!7527 (buf!7593 thiss!1728)) (currentByte!14048 thiss!1728) (currentBit!14043 thiss!1728)))))

(declare-fun arr!273 () array!17385)

(declare-fun arrayBitRangesEq!0 (array!17385 array!17385 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292415 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20343 0))(
  ( (Unit!20344) )
))
(declare-fun lt!424722 () Unit!20343)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17385 array!17385 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20343)

(assert (=> b!292415 (= lt!424722 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424723 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292415 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424723)))

(assert (=> b!292415 (= lt!424723 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7527 arr!273))))))

(declare-fun lt!424724 () Unit!20343)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17385) Unit!20343)

(assert (=> b!292415 (= lt!424724 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292416 () Bool)

(declare-fun e!208580 () Bool)

(declare-fun array_inv!7139 (array!17385) Bool)

(assert (=> b!292416 (= e!208580 (array_inv!7139 (buf!7593 thiss!1728)))))

(declare-fun res!241523 () Bool)

(assert (=> start!65180 (=> (not res!241523) (not e!208578))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65180 (= res!241523 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7527 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65180 e!208578))

(declare-fun inv!12 (BitStream!13064) Bool)

(assert (=> start!65180 (and (inv!12 thiss!1728) e!208580)))

(assert (=> start!65180 true))

(assert (=> start!65180 (array_inv!7139 arr!273)))

(declare-fun b!292413 () Bool)

(declare-fun res!241521 () Bool)

(assert (=> b!292413 (=> (not res!241521) (not e!208578))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292413 (= res!241521 (validate_offset_bits!1 ((_ sign_extend 32) (size!7527 (buf!7593 thiss!1728))) ((_ sign_extend 32) (currentByte!14048 thiss!1728)) ((_ sign_extend 32) (currentBit!14043 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292414 () Bool)

(declare-fun res!241522 () Bool)

(assert (=> b!292414 (=> (not res!241522) (not e!208578))))

(assert (=> b!292414 (= res!241522 (bvsge from!505 to!474))))

(assert (= (and start!65180 res!241523) b!292413))

(assert (= (and b!292413 res!241521) b!292414))

(assert (= (and b!292414 res!241522) b!292415))

(assert (= start!65180 b!292416))

(declare-fun m!427915 () Bool)

(assert (=> b!292415 m!427915))

(declare-fun m!427917 () Bool)

(assert (=> b!292415 m!427917))

(declare-fun m!427919 () Bool)

(assert (=> b!292415 m!427919))

(declare-fun m!427921 () Bool)

(assert (=> b!292415 m!427921))

(declare-fun m!427923 () Bool)

(assert (=> b!292415 m!427923))

(declare-fun m!427925 () Bool)

(assert (=> b!292416 m!427925))

(declare-fun m!427927 () Bool)

(assert (=> start!65180 m!427927))

(declare-fun m!427929 () Bool)

(assert (=> start!65180 m!427929))

(declare-fun m!427931 () Bool)

(assert (=> b!292413 m!427931))

(push 1)

(assert (not start!65180))

(assert (not b!292413))

(assert (not b!292416))

(assert (not b!292415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

