; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65206 () Bool)

(assert start!65206)

(declare-fun b!292573 () Bool)

(declare-fun e!208739 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292573 (= e!208739 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(declare-fun b!292575 () Bool)

(declare-fun e!208740 () Bool)

(declare-datatypes ((array!17411 0))(
  ( (array!17412 (arr!8566 (Array (_ BitVec 32) (_ BitVec 8))) (size!7540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13090 0))(
  ( (BitStream!13091 (buf!7606 array!17411) (currentByte!14061 (_ BitVec 32)) (currentBit!14056 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13090)

(declare-fun array_inv!7152 (array!17411) Bool)

(assert (=> b!292575 (= e!208740 (array_inv!7152 (buf!7606 thiss!1728)))))

(declare-fun b!292576 () Bool)

(declare-fun res!241642 () Bool)

(assert (=> b!292576 (=> res!241642 e!208739)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292576 (= res!241642 (not (invariant!0 (currentBit!14056 thiss!1728) (currentByte!14061 thiss!1728) (size!7540 (buf!7606 thiss!1728)))))))

(declare-fun b!292577 () Bool)

(declare-fun res!241644 () Bool)

(declare-fun e!208737 () Bool)

(assert (=> b!292577 (=> (not res!241644) (not e!208737))))

(assert (=> b!292577 (= res!241644 (bvsge from!505 to!474))))

(declare-fun b!292578 () Bool)

(assert (=> b!292578 (= e!208737 (not e!208739))))

(declare-fun res!241645 () Bool)

(assert (=> b!292578 (=> res!241645 e!208739)))

(declare-fun lt!424880 () (_ BitVec 64))

(assert (=> b!292578 (= res!241645 (not (= (bvsub (bvadd lt!424880 to!474) from!505) lt!424880)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292578 (= lt!424880 (bitIndex!0 (size!7540 (buf!7606 thiss!1728)) (currentByte!14061 thiss!1728) (currentBit!14056 thiss!1728)))))

(declare-fun arr!273 () array!17411)

(declare-fun arrayBitRangesEq!0 (array!17411 array!17411 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292578 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20369 0))(
  ( (Unit!20370) )
))
(declare-fun lt!424878 () Unit!20369)

(declare-fun lt!424881 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17411 array!17411 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20369)

(assert (=> b!292578 (= lt!424878 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424881 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292578 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424881)))

(assert (=> b!292578 (= lt!424881 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7540 arr!273))))))

(declare-fun lt!424879 () Unit!20369)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17411) Unit!20369)

(assert (=> b!292578 (= lt!424879 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292574 () Bool)

(declare-fun res!241643 () Bool)

(assert (=> b!292574 (=> (not res!241643) (not e!208737))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292574 (= res!241643 (validate_offset_bits!1 ((_ sign_extend 32) (size!7540 (buf!7606 thiss!1728))) ((_ sign_extend 32) (currentByte!14061 thiss!1728)) ((_ sign_extend 32) (currentBit!14056 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241646 () Bool)

(assert (=> start!65206 (=> (not res!241646) (not e!208737))))

(assert (=> start!65206 (= res!241646 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7540 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65206 e!208737))

(declare-fun inv!12 (BitStream!13090) Bool)

(assert (=> start!65206 (and (inv!12 thiss!1728) e!208740)))

(assert (=> start!65206 true))

(assert (=> start!65206 (array_inv!7152 arr!273)))

(assert (= (and start!65206 res!241646) b!292574))

(assert (= (and b!292574 res!241643) b!292577))

(assert (= (and b!292577 res!241644) b!292578))

(assert (= (and b!292578 (not res!241645)) b!292576))

(assert (= (and b!292576 (not res!241642)) b!292573))

(assert (= start!65206 b!292575))

(declare-fun m!428149 () Bool)

(assert (=> b!292574 m!428149))

(declare-fun m!428151 () Bool)

(assert (=> b!292575 m!428151))

(declare-fun m!428153 () Bool)

(assert (=> b!292578 m!428153))

(declare-fun m!428155 () Bool)

(assert (=> b!292578 m!428155))

(declare-fun m!428157 () Bool)

(assert (=> b!292578 m!428157))

(declare-fun m!428159 () Bool)

(assert (=> b!292578 m!428159))

(declare-fun m!428161 () Bool)

(assert (=> b!292578 m!428161))

(declare-fun m!428163 () Bool)

(assert (=> b!292576 m!428163))

(declare-fun m!428165 () Bool)

(assert (=> start!65206 m!428165))

(declare-fun m!428167 () Bool)

(assert (=> start!65206 m!428167))

(push 1)

(assert (not start!65206))

(assert (not b!292578))

(assert (not b!292576))

(assert (not b!292575))

(assert (not b!292574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

