; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15838 () Bool)

(assert start!15838)

(declare-fun b!79852 () Bool)

(declare-fun e!52455 () Bool)

(assert (=> b!79852 (= e!52455 false)))

(declare-fun lt!127046 () Bool)

(declare-fun e!52458 () Bool)

(assert (=> b!79852 (= lt!127046 e!52458)))

(declare-fun res!66087 () Bool)

(assert (=> b!79852 (=> res!66087 e!52458)))

(declare-datatypes ((array!3450 0))(
  ( (array!3451 (arr!2197 (Array (_ BitVec 32) (_ BitVec 8))) (size!1590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2742 0))(
  ( (BitStream!2743 (buf!1980 array!3450) (currentByte!3872 (_ BitVec 32)) (currentBit!3867 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5256 0))(
  ( (Unit!5257) )
))
(declare-datatypes ((tuple3!246 0))(
  ( (tuple3!247 (_1!3708 Unit!5256) (_2!3708 BitStream!2742) (_3!144 array!3450)) )
))
(declare-fun lt!127047 () tuple3!246)

(declare-fun thiss!1716 () BitStream!2742)

(assert (=> b!79852 (= res!66087 (not (= (buf!1980 (_2!3708 lt!127047)) (buf!1980 thiss!1716))))))

(declare-fun lt!127045 () (_ BitVec 32))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2742 (_ BitVec 64) array!3450 (_ BitVec 64) (_ BitVec 64)) tuple3!246)

(assert (=> b!79852 (= lt!127047 (readBitsLoop!0 thiss!1716 nBits!516 (array!3451 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127045) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79852 (= lt!127045 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79853 () Bool)

(assert (=> b!79853 (= e!52458 (or (not (= (size!1590 (_3!144 lt!127047)) lt!127045)) (bvsgt (currentByte!3872 thiss!1716) (currentByte!3872 (_2!3708 lt!127047)))))))

(declare-fun b!79854 () Bool)

(declare-fun res!66084 () Bool)

(assert (=> b!79854 (=> res!66084 e!52458)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79854 (= res!66084 (not (invariant!0 (currentBit!3867 (_2!3708 lt!127047)) (currentByte!3872 (_2!3708 lt!127047)) (size!1590 (buf!1980 (_2!3708 lt!127047))))))))

(declare-fun b!79855 () Bool)

(declare-fun e!52456 () Bool)

(declare-fun array_inv!1436 (array!3450) Bool)

(assert (=> b!79855 (= e!52456 (array_inv!1436 (buf!1980 thiss!1716)))))

(declare-fun b!79856 () Bool)

(declare-fun res!66086 () Bool)

(assert (=> b!79856 (=> res!66086 e!52458)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79856 (= res!66086 (not (= (bvadd (bitIndex!0 (size!1590 (buf!1980 thiss!1716)) (currentByte!3872 thiss!1716) (currentBit!3867 thiss!1716)) nBits!516) (bitIndex!0 (size!1590 (buf!1980 (_2!3708 lt!127047))) (currentByte!3872 (_2!3708 lt!127047)) (currentBit!3867 (_2!3708 lt!127047))))))))

(declare-fun res!66088 () Bool)

(assert (=> start!15838 (=> (not res!66088) (not e!52455))))

(assert (=> start!15838 (= res!66088 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15838 e!52455))

(assert (=> start!15838 true))

(declare-fun inv!12 (BitStream!2742) Bool)

(assert (=> start!15838 (and (inv!12 thiss!1716) e!52456)))

(declare-fun b!79857 () Bool)

(declare-fun res!66085 () Bool)

(assert (=> b!79857 (=> (not res!66085) (not e!52455))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79857 (= res!66085 (validate_offset_bits!1 ((_ sign_extend 32) (size!1590 (buf!1980 thiss!1716))) ((_ sign_extend 32) (currentByte!3872 thiss!1716)) ((_ sign_extend 32) (currentBit!3867 thiss!1716)) nBits!516))))

(assert (= (and start!15838 res!66088) b!79857))

(assert (= (and b!79857 res!66085) b!79852))

(assert (= (and b!79852 (not res!66087)) b!79856))

(assert (= (and b!79856 (not res!66086)) b!79854))

(assert (= (and b!79854 (not res!66084)) b!79853))

(assert (= start!15838 b!79855))

(declare-fun m!125423 () Bool)

(assert (=> b!79854 m!125423))

(declare-fun m!125425 () Bool)

(assert (=> b!79857 m!125425))

(declare-fun m!125427 () Bool)

(assert (=> b!79852 m!125427))

(declare-fun m!125429 () Bool)

(assert (=> b!79855 m!125429))

(declare-fun m!125431 () Bool)

(assert (=> b!79856 m!125431))

(declare-fun m!125433 () Bool)

(assert (=> b!79856 m!125433))

(declare-fun m!125435 () Bool)

(assert (=> start!15838 m!125435))

(check-sat (not b!79854) (not b!79852) (not start!15838) (not b!79855) (not b!79856) (not b!79857))
