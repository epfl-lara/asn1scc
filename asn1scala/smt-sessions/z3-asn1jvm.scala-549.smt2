; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15868 () Bool)

(assert start!15868)

(declare-fun b!80122 () Bool)

(declare-fun res!66309 () Bool)

(declare-fun e!52637 () Bool)

(assert (=> b!80122 (=> (not res!66309) (not e!52637))))

(declare-datatypes ((array!3480 0))(
  ( (array!3481 (arr!2212 (Array (_ BitVec 32) (_ BitVec 8))) (size!1605 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2772 0))(
  ( (BitStream!2773 (buf!1995 array!3480) (currentByte!3887 (_ BitVec 32)) (currentBit!3882 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2772)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80122 (= res!66309 (validate_offset_bits!1 ((_ sign_extend 32) (size!1605 (buf!1995 thiss!1716))) ((_ sign_extend 32) (currentByte!3887 thiss!1716)) ((_ sign_extend 32) (currentBit!3882 thiss!1716)) nBits!516))))

(declare-fun b!80123 () Bool)

(assert (=> b!80123 (= e!52637 false)))

(declare-fun lt!127163 () Bool)

(declare-fun e!52638 () Bool)

(assert (=> b!80123 (= lt!127163 e!52638)))

(declare-fun res!66313 () Bool)

(assert (=> b!80123 (=> res!66313 e!52638)))

(declare-datatypes ((Unit!5286 0))(
  ( (Unit!5287) )
))
(declare-datatypes ((tuple3!276 0))(
  ( (tuple3!277 (_1!3723 Unit!5286) (_2!3723 BitStream!2772) (_3!159 array!3480)) )
))
(declare-fun lt!127162 () tuple3!276)

(assert (=> b!80123 (= res!66313 (not (= (buf!1995 (_2!3723 lt!127162)) (buf!1995 thiss!1716))))))

(declare-fun lt!127164 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2772 (_ BitVec 64) array!3480 (_ BitVec 64) (_ BitVec 64)) tuple3!276)

(assert (=> b!80123 (= lt!127162 (readBitsLoop!0 thiss!1716 nBits!516 (array!3481 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127164) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80123 (= lt!127164 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!80124 () Bool)

(assert (=> b!80124 (= e!52638 (or (not (= (size!1605 (_3!159 lt!127162)) lt!127164)) (bvsgt (currentByte!3887 thiss!1716) (currentByte!3887 (_2!3723 lt!127162)))))))

(declare-fun b!80125 () Bool)

(declare-fun res!66310 () Bool)

(assert (=> b!80125 (=> res!66310 e!52638)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80125 (= res!66310 (not (invariant!0 (currentBit!3882 (_2!3723 lt!127162)) (currentByte!3887 (_2!3723 lt!127162)) (size!1605 (buf!1995 (_2!3723 lt!127162))))))))

(declare-fun b!80126 () Bool)

(declare-fun e!52636 () Bool)

(declare-fun array_inv!1451 (array!3480) Bool)

(assert (=> b!80126 (= e!52636 (array_inv!1451 (buf!1995 thiss!1716)))))

(declare-fun b!80127 () Bool)

(declare-fun res!66311 () Bool)

(assert (=> b!80127 (=> res!66311 e!52638)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80127 (= res!66311 (not (= (bvadd (bitIndex!0 (size!1605 (buf!1995 thiss!1716)) (currentByte!3887 thiss!1716) (currentBit!3882 thiss!1716)) nBits!516) (bitIndex!0 (size!1605 (buf!1995 (_2!3723 lt!127162))) (currentByte!3887 (_2!3723 lt!127162)) (currentBit!3882 (_2!3723 lt!127162))))))))

(declare-fun res!66312 () Bool)

(assert (=> start!15868 (=> (not res!66312) (not e!52637))))

(assert (=> start!15868 (= res!66312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15868 e!52637))

(assert (=> start!15868 true))

(declare-fun inv!12 (BitStream!2772) Bool)

(assert (=> start!15868 (and (inv!12 thiss!1716) e!52636)))

(assert (= (and start!15868 res!66312) b!80122))

(assert (= (and b!80122 res!66309) b!80123))

(assert (= (and b!80123 (not res!66313)) b!80127))

(assert (= (and b!80127 (not res!66311)) b!80125))

(assert (= (and b!80125 (not res!66310)) b!80124))

(assert (= start!15868 b!80126))

(declare-fun m!125633 () Bool)

(assert (=> b!80127 m!125633))

(declare-fun m!125635 () Bool)

(assert (=> b!80127 m!125635))

(declare-fun m!125637 () Bool)

(assert (=> b!80125 m!125637))

(declare-fun m!125639 () Bool)

(assert (=> b!80126 m!125639))

(declare-fun m!125641 () Bool)

(assert (=> start!15868 m!125641))

(declare-fun m!125643 () Bool)

(assert (=> b!80123 m!125643))

(declare-fun m!125645 () Bool)

(assert (=> b!80122 m!125645))

(check-sat (not b!80126) (not b!80125) (not b!80122) (not b!80123) (not start!15868) (not b!80127))
