; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15858 () Bool)

(assert start!15858)

(declare-fun b!80032 () Bool)

(declare-fun e!52576 () Bool)

(declare-datatypes ((array!3470 0))(
  ( (array!3471 (arr!2207 (Array (_ BitVec 32) (_ BitVec 8))) (size!1600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2762 0))(
  ( (BitStream!2763 (buf!1990 array!3470) (currentByte!3882 (_ BitVec 32)) (currentBit!3877 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2762)

(declare-fun array_inv!1446 (array!3470) Bool)

(assert (=> b!80032 (= e!52576 (array_inv!1446 (buf!1990 thiss!1716)))))

(declare-fun b!80033 () Bool)

(declare-datatypes ((Unit!5276 0))(
  ( (Unit!5277) )
))
(declare-datatypes ((tuple3!266 0))(
  ( (tuple3!267 (_1!3718 Unit!5276) (_2!3718 BitStream!2762) (_3!154 array!3470)) )
))
(declare-fun lt!127119 () tuple3!266)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun e!52577 () Bool)

(declare-fun lt!127118 () (_ BitVec 32))

(assert (=> b!80033 (= e!52577 (and (= (size!1600 (_3!154 lt!127119)) lt!127118) (bvsle (currentByte!3882 thiss!1716) (currentByte!3882 (_2!3718 lt!127119))) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516)) (bvsgt nBits!516 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1600 (_3!154 lt!127119)))))))))

(declare-fun b!80034 () Bool)

(declare-fun e!52575 () Bool)

(assert (=> b!80034 (= e!52575 e!52577)))

(declare-fun res!66235 () Bool)

(assert (=> b!80034 (=> (not res!66235) (not e!52577))))

(assert (=> b!80034 (= res!66235 (= (buf!1990 (_2!3718 lt!127119)) (buf!1990 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2762 (_ BitVec 64) array!3470 (_ BitVec 64) (_ BitVec 64)) tuple3!266)

(assert (=> b!80034 (= lt!127119 (readBitsLoop!0 thiss!1716 nBits!516 (array!3471 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127118) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80034 (= lt!127118 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!80035 () Bool)

(declare-fun res!66234 () Bool)

(assert (=> b!80035 (=> (not res!66234) (not e!52577))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80035 (= res!66234 (= (bvadd (bitIndex!0 (size!1600 (buf!1990 thiss!1716)) (currentByte!3882 thiss!1716) (currentBit!3877 thiss!1716)) nBits!516) (bitIndex!0 (size!1600 (buf!1990 (_2!3718 lt!127119))) (currentByte!3882 (_2!3718 lt!127119)) (currentBit!3877 (_2!3718 lt!127119)))))))

(declare-fun b!80037 () Bool)

(declare-fun res!66238 () Bool)

(assert (=> b!80037 (=> (not res!66238) (not e!52577))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80037 (= res!66238 (invariant!0 (currentBit!3877 (_2!3718 lt!127119)) (currentByte!3882 (_2!3718 lt!127119)) (size!1600 (buf!1990 (_2!3718 lt!127119)))))))

(declare-fun b!80036 () Bool)

(declare-fun res!66237 () Bool)

(assert (=> b!80036 (=> (not res!66237) (not e!52575))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80036 (= res!66237 (validate_offset_bits!1 ((_ sign_extend 32) (size!1600 (buf!1990 thiss!1716))) ((_ sign_extend 32) (currentByte!3882 thiss!1716)) ((_ sign_extend 32) (currentBit!3877 thiss!1716)) nBits!516))))

(declare-fun res!66236 () Bool)

(assert (=> start!15858 (=> (not res!66236) (not e!52575))))

(assert (=> start!15858 (= res!66236 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15858 e!52575))

(assert (=> start!15858 true))

(declare-fun inv!12 (BitStream!2762) Bool)

(assert (=> start!15858 (and (inv!12 thiss!1716) e!52576)))

(assert (= (and start!15858 res!66236) b!80036))

(assert (= (and b!80036 res!66237) b!80034))

(assert (= (and b!80034 res!66235) b!80035))

(assert (= (and b!80035 res!66234) b!80037))

(assert (= (and b!80037 res!66238) b!80033))

(assert (= start!15858 b!80032))

(declare-fun m!125563 () Bool)

(assert (=> b!80034 m!125563))

(declare-fun m!125565 () Bool)

(assert (=> start!15858 m!125565))

(declare-fun m!125567 () Bool)

(assert (=> b!80037 m!125567))

(declare-fun m!125569 () Bool)

(assert (=> b!80036 m!125569))

(declare-fun m!125571 () Bool)

(assert (=> b!80032 m!125571))

(declare-fun m!125573 () Bool)

(assert (=> b!80035 m!125573))

(declare-fun m!125575 () Bool)

(assert (=> b!80035 m!125575))

(push 1)

(assert (not b!80035))

(assert (not b!80036))

(assert (not b!80032))

(assert (not b!80037))

(assert (not start!15858))

(assert (not b!80034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

