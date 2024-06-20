; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52462 () Bool)

(assert start!52462)

(declare-fun res!201819 () Bool)

(declare-fun e!167581 () Bool)

(assert (=> start!52462 (=> (not res!201819) (not e!167581))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52462 (= res!201819 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52462 e!167581))

(assert (=> start!52462 true))

(declare-datatypes ((array!13273 0))(
  ( (array!13274 (arr!6803 (Array (_ BitVec 32) (_ BitVec 8))) (size!5816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10554 0))(
  ( (BitStream!10555 (buf!6282 array!13273) (currentByte!11645 (_ BitVec 32)) (currentBit!11640 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10554)

(declare-fun e!167579 () Bool)

(declare-fun inv!12 (BitStream!10554) Bool)

(assert (=> start!52462 (and (inv!12 thiss!1005) e!167579)))

(declare-fun b!241743 () Bool)

(declare-fun res!201818 () Bool)

(declare-fun e!167577 () Bool)

(assert (=> b!241743 (=> (not res!201818) (not e!167577))))

(declare-datatypes ((Unit!17715 0))(
  ( (Unit!17716) )
))
(declare-datatypes ((tuple2!20646 0))(
  ( (tuple2!20647 (_1!11245 Unit!17715) (_2!11245 BitStream!10554)) )
))
(declare-fun lt!377192 () tuple2!20646)

(declare-fun isPrefixOf!0 (BitStream!10554 BitStream!10554) Bool)

(assert (=> b!241743 (= res!201818 (isPrefixOf!0 thiss!1005 (_2!11245 lt!377192)))))

(declare-fun b!241744 () Bool)

(declare-fun e!167580 () Bool)

(declare-fun e!167578 () Bool)

(assert (=> b!241744 (= e!167580 e!167578)))

(declare-fun res!201825 () Bool)

(assert (=> b!241744 (=> (not res!201825) (not e!167578))))

(declare-fun lt!377191 () (_ BitVec 64))

(declare-fun lt!377199 () tuple2!20646)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241744 (= res!201825 (= (bitIndex!0 (size!5816 (buf!6282 (_2!11245 lt!377199))) (currentByte!11645 (_2!11245 lt!377199)) (currentBit!11640 (_2!11245 lt!377199))) (bvadd (bitIndex!0 (size!5816 (buf!6282 (_2!11245 lt!377192))) (currentByte!11645 (_2!11245 lt!377192)) (currentBit!11640 (_2!11245 lt!377192))) lt!377191)))))

(assert (=> b!241744 (= lt!377191 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241745 () Bool)

(declare-fun e!167582 () Bool)

(declare-datatypes ((tuple2!20648 0))(
  ( (tuple2!20649 (_1!11246 BitStream!10554) (_2!11246 Bool)) )
))
(declare-fun lt!377190 () tuple2!20648)

(declare-fun lt!377198 () (_ BitVec 64))

(assert (=> b!241745 (= e!167582 (= (bitIndex!0 (size!5816 (buf!6282 (_1!11246 lt!377190))) (currentByte!11645 (_1!11246 lt!377190)) (currentBit!11640 (_1!11246 lt!377190))) lt!377198))))

(declare-fun b!241746 () Bool)

(declare-fun res!201816 () Bool)

(assert (=> b!241746 (=> (not res!201816) (not e!167581))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241746 (= res!201816 (validate_offset_bits!1 ((_ sign_extend 32) (size!5816 (buf!6282 thiss!1005))) ((_ sign_extend 32) (currentByte!11645 thiss!1005)) ((_ sign_extend 32) (currentBit!11640 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241747 () Bool)

(assert (=> b!241747 (= e!167577 e!167582)))

(declare-fun res!201822 () Bool)

(assert (=> b!241747 (=> (not res!201822) (not e!167582))))

(declare-fun bit!26 () Bool)

(assert (=> b!241747 (= res!201822 (and (= (_2!11246 lt!377190) bit!26) (= (_1!11246 lt!377190) (_2!11245 lt!377192))))))

(declare-fun readBitPure!0 (BitStream!10554) tuple2!20648)

(declare-fun readerFrom!0 (BitStream!10554 (_ BitVec 32) (_ BitVec 32)) BitStream!10554)

(assert (=> b!241747 (= lt!377190 (readBitPure!0 (readerFrom!0 (_2!11245 lt!377192) (currentBit!11640 thiss!1005) (currentByte!11645 thiss!1005))))))

(declare-fun b!241748 () Bool)

(declare-fun e!167574 () Bool)

(assert (=> b!241748 (= e!167574 true)))

(declare-fun lt!377193 () Bool)

(assert (=> b!241748 (= lt!377193 (isPrefixOf!0 (_2!11245 lt!377192) (_2!11245 lt!377199)))))

(declare-fun b!241749 () Bool)

(declare-fun res!201821 () Bool)

(assert (=> b!241749 (=> (not res!201821) (not e!167581))))

(assert (=> b!241749 (= res!201821 (bvslt from!289 nBits!297))))

(declare-fun b!241750 () Bool)

(declare-fun array_inv!5557 (array!13273) Bool)

(assert (=> b!241750 (= e!167579 (array_inv!5557 (buf!6282 thiss!1005)))))

(declare-fun b!241751 () Bool)

(declare-fun res!201820 () Bool)

(assert (=> b!241751 (=> (not res!201820) (not e!167578))))

(assert (=> b!241751 (= res!201820 (isPrefixOf!0 (_2!11245 lt!377192) (_2!11245 lt!377199)))))

(declare-fun b!241752 () Bool)

(declare-fun e!167576 () Bool)

(assert (=> b!241752 (= e!167576 e!167577)))

(declare-fun res!201823 () Bool)

(assert (=> b!241752 (=> (not res!201823) (not e!167577))))

(declare-fun lt!377197 () (_ BitVec 64))

(assert (=> b!241752 (= res!201823 (= lt!377198 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377197)))))

(assert (=> b!241752 (= lt!377198 (bitIndex!0 (size!5816 (buf!6282 (_2!11245 lt!377192))) (currentByte!11645 (_2!11245 lt!377192)) (currentBit!11640 (_2!11245 lt!377192))))))

(assert (=> b!241752 (= lt!377197 (bitIndex!0 (size!5816 (buf!6282 thiss!1005)) (currentByte!11645 thiss!1005) (currentBit!11640 thiss!1005)))))

(declare-fun b!241753 () Bool)

(assert (=> b!241753 (= e!167581 (not e!167574))))

(declare-fun res!201815 () Bool)

(assert (=> b!241753 (=> res!201815 e!167574)))

(assert (=> b!241753 (= res!201815 (not (isPrefixOf!0 thiss!1005 (_2!11245 lt!377192))))))

(assert (=> b!241753 e!167580))

(declare-fun res!201817 () Bool)

(assert (=> b!241753 (=> (not res!201817) (not e!167580))))

(assert (=> b!241753 (= res!201817 (= (size!5816 (buf!6282 (_2!11245 lt!377192))) (size!5816 (buf!6282 (_2!11245 lt!377199)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10554 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20646)

(assert (=> b!241753 (= lt!377199 (appendNBitsLoop!0 (_2!11245 lt!377192) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241753 (validate_offset_bits!1 ((_ sign_extend 32) (size!5816 (buf!6282 (_2!11245 lt!377192)))) ((_ sign_extend 32) (currentByte!11645 (_2!11245 lt!377192))) ((_ sign_extend 32) (currentBit!11640 (_2!11245 lt!377192))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377196 () Unit!17715)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10554 BitStream!10554 (_ BitVec 64) (_ BitVec 64)) Unit!17715)

(assert (=> b!241753 (= lt!377196 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11245 lt!377192) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241753 e!167576))

(declare-fun res!201824 () Bool)

(assert (=> b!241753 (=> (not res!201824) (not e!167576))))

(assert (=> b!241753 (= res!201824 (= (size!5816 (buf!6282 thiss!1005)) (size!5816 (buf!6282 (_2!11245 lt!377192)))))))

(declare-fun appendBit!0 (BitStream!10554 Bool) tuple2!20646)

(assert (=> b!241753 (= lt!377192 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241754 () Bool)

(declare-fun lt!377195 () tuple2!20648)

(declare-datatypes ((tuple2!20650 0))(
  ( (tuple2!20651 (_1!11247 BitStream!10554) (_2!11247 BitStream!10554)) )
))
(declare-fun lt!377194 () tuple2!20650)

(assert (=> b!241754 (= e!167578 (not (or (not (_2!11246 lt!377195)) (not (= (_1!11246 lt!377195) (_2!11247 lt!377194))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10554 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20648)

(assert (=> b!241754 (= lt!377195 (checkBitsLoopPure!0 (_1!11247 lt!377194) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241754 (validate_offset_bits!1 ((_ sign_extend 32) (size!5816 (buf!6282 (_2!11245 lt!377199)))) ((_ sign_extend 32) (currentByte!11645 (_2!11245 lt!377192))) ((_ sign_extend 32) (currentBit!11640 (_2!11245 lt!377192))) lt!377191)))

(declare-fun lt!377189 () Unit!17715)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10554 array!13273 (_ BitVec 64)) Unit!17715)

(assert (=> b!241754 (= lt!377189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11245 lt!377192) (buf!6282 (_2!11245 lt!377199)) lt!377191))))

(declare-fun reader!0 (BitStream!10554 BitStream!10554) tuple2!20650)

(assert (=> b!241754 (= lt!377194 (reader!0 (_2!11245 lt!377192) (_2!11245 lt!377199)))))

(assert (= (and start!52462 res!201819) b!241746))

(assert (= (and b!241746 res!201816) b!241749))

(assert (= (and b!241749 res!201821) b!241753))

(assert (= (and b!241753 res!201824) b!241752))

(assert (= (and b!241752 res!201823) b!241743))

(assert (= (and b!241743 res!201818) b!241747))

(assert (= (and b!241747 res!201822) b!241745))

(assert (= (and b!241753 res!201817) b!241744))

(assert (= (and b!241744 res!201825) b!241751))

(assert (= (and b!241751 res!201820) b!241754))

(assert (= (and b!241753 (not res!201815)) b!241748))

(assert (= start!52462 b!241750))

(declare-fun m!364405 () Bool)

(assert (=> b!241753 m!364405))

(declare-fun m!364407 () Bool)

(assert (=> b!241753 m!364407))

(declare-fun m!364409 () Bool)

(assert (=> b!241753 m!364409))

(declare-fun m!364411 () Bool)

(assert (=> b!241753 m!364411))

(declare-fun m!364413 () Bool)

(assert (=> b!241753 m!364413))

(declare-fun m!364415 () Bool)

(assert (=> b!241747 m!364415))

(assert (=> b!241747 m!364415))

(declare-fun m!364417 () Bool)

(assert (=> b!241747 m!364417))

(assert (=> b!241743 m!364405))

(declare-fun m!364419 () Bool)

(assert (=> b!241754 m!364419))

(declare-fun m!364421 () Bool)

(assert (=> b!241754 m!364421))

(declare-fun m!364423 () Bool)

(assert (=> b!241754 m!364423))

(declare-fun m!364425 () Bool)

(assert (=> b!241754 m!364425))

(declare-fun m!364427 () Bool)

(assert (=> b!241751 m!364427))

(declare-fun m!364429 () Bool)

(assert (=> b!241745 m!364429))

(declare-fun m!364431 () Bool)

(assert (=> start!52462 m!364431))

(declare-fun m!364433 () Bool)

(assert (=> b!241746 m!364433))

(assert (=> b!241748 m!364427))

(declare-fun m!364435 () Bool)

(assert (=> b!241752 m!364435))

(declare-fun m!364437 () Bool)

(assert (=> b!241752 m!364437))

(declare-fun m!364439 () Bool)

(assert (=> b!241750 m!364439))

(declare-fun m!364441 () Bool)

(assert (=> b!241744 m!364441))

(assert (=> b!241744 m!364435))

(check-sat (not b!241751) (not start!52462) (not b!241743) (not b!241744) (not b!241750) (not b!241753) (not b!241748) (not b!241747) (not b!241745) (not b!241746) (not b!241752) (not b!241754))
