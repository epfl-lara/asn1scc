; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15214 () Bool)

(assert start!15214)

(declare-fun b!77821 () Bool)

(declare-fun res!64318 () Bool)

(declare-fun e!51009 () Bool)

(assert (=> b!77821 (=> (not res!64318) (not e!51009))))

(declare-datatypes ((array!3274 0))(
  ( (array!3275 (arr!2122 (Array (_ BitVec 32) (_ BitVec 8))) (size!1521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2616 0))(
  ( (BitStream!2617 (buf!1917 array!3274) (currentByte!3734 (_ BitVec 32)) (currentBit!3729 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2616)

(declare-datatypes ((Unit!5139 0))(
  ( (Unit!5140) )
))
(declare-datatypes ((tuple2!6920 0))(
  ( (tuple2!6921 (_1!3594 Unit!5139) (_2!3594 BitStream!2616)) )
))
(declare-fun lt!124804 () tuple2!6920)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77821 (= res!64318 (= (bitIndex!0 (size!1521 (buf!1917 (_2!3594 lt!124804))) (currentByte!3734 (_2!3594 lt!124804)) (currentBit!3729 (_2!3594 lt!124804))) (bvadd (bitIndex!0 (size!1521 (buf!1917 thiss!1090)) (currentByte!3734 thiss!1090) (currentBit!3729 thiss!1090)) nBits!322)))))

(declare-fun b!77822 () Bool)

(declare-fun e!51012 () Bool)

(declare-fun array_inv!1367 (array!3274) Bool)

(assert (=> b!77822 (= e!51012 (array_inv!1367 (buf!1917 thiss!1090)))))

(declare-fun b!77823 () Bool)

(declare-fun res!64317 () Bool)

(assert (=> b!77823 (=> (not res!64317) (not e!51009))))

(declare-fun isPrefixOf!0 (BitStream!2616 BitStream!2616) Bool)

(assert (=> b!77823 (= res!64317 (isPrefixOf!0 thiss!1090 (_2!3594 lt!124804)))))

(declare-fun b!77824 () Bool)

(declare-datatypes ((tuple2!6922 0))(
  ( (tuple2!6923 (_1!3595 BitStream!2616) (_2!3595 Bool)) )
))
(declare-fun lt!124800 () tuple2!6922)

(declare-datatypes ((tuple2!6924 0))(
  ( (tuple2!6925 (_1!3596 BitStream!2616) (_2!3596 BitStream!2616)) )
))
(declare-fun lt!124803 () tuple2!6924)

(assert (=> b!77824 (= e!51009 (not (or (not (_2!3595 lt!124800)) (not (= (_1!3595 lt!124800) (_2!3596 lt!124803))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2616 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6922)

(assert (=> b!77824 (= lt!124800 (checkBitsLoopPure!0 (_1!3596 lt!124803) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77824 (validate_offset_bits!1 ((_ sign_extend 32) (size!1521 (buf!1917 (_2!3594 lt!124804)))) ((_ sign_extend 32) (currentByte!3734 thiss!1090)) ((_ sign_extend 32) (currentBit!3729 thiss!1090)) nBits!322)))

(declare-fun lt!124807 () Unit!5139)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2616 array!3274 (_ BitVec 64)) Unit!5139)

(assert (=> b!77824 (= lt!124807 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1917 (_2!3594 lt!124804)) nBits!322))))

(declare-fun reader!0 (BitStream!2616 BitStream!2616) tuple2!6924)

(assert (=> b!77824 (= lt!124803 (reader!0 thiss!1090 (_2!3594 lt!124804)))))

(declare-fun b!77825 () Bool)

(declare-fun e!51011 () Bool)

(declare-fun lt!124809 () tuple2!6922)

(declare-fun lt!124806 () tuple2!6924)

(assert (=> b!77825 (= e!51011 (not (and (_2!3595 lt!124809) (= (_1!3595 lt!124809) (_2!3596 lt!124806)))))))

(assert (=> b!77825 (= lt!124809 (checkBitsLoopPure!0 (_1!3596 lt!124806) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77825 (validate_offset_bits!1 ((_ sign_extend 32) (size!1521 (buf!1917 (_2!3594 lt!124804)))) ((_ sign_extend 32) (currentByte!3734 thiss!1090)) ((_ sign_extend 32) (currentBit!3729 thiss!1090)) nBits!322)))

(declare-fun lt!124805 () Unit!5139)

(assert (=> b!77825 (= lt!124805 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1917 (_2!3594 lt!124804)) nBits!322))))

(assert (=> b!77825 (= lt!124806 (reader!0 thiss!1090 (_2!3594 lt!124804)))))

(declare-fun lt!124802 () Bool)

(assert (=> b!77825 (= lt!124802 (isPrefixOf!0 thiss!1090 (_2!3594 lt!124804)))))

(declare-fun lt!124808 () (_ BitVec 64))

(assert (=> b!77825 (= lt!124808 (bitIndex!0 (size!1521 (buf!1917 (_2!3594 lt!124804))) (currentByte!3734 (_2!3594 lt!124804)) (currentBit!3729 (_2!3594 lt!124804))))))

(declare-fun lt!124801 () (_ BitVec 64))

(assert (=> b!77825 (= lt!124801 (bitIndex!0 (size!1521 (buf!1917 thiss!1090)) (currentByte!3734 thiss!1090) (currentBit!3729 thiss!1090)))))

(assert (=> b!77825 e!51009))

(declare-fun res!64315 () Bool)

(assert (=> b!77825 (=> (not res!64315) (not e!51009))))

(assert (=> b!77825 (= res!64315 (= (size!1521 (buf!1917 thiss!1090)) (size!1521 (buf!1917 (_2!3594 lt!124804)))))))

(declare-fun appendNBits!0 (BitStream!2616 (_ BitVec 64) Bool) tuple2!6920)

(assert (=> b!77825 (= lt!124804 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun res!64314 () Bool)

(assert (=> start!15214 (=> (not res!64314) (not e!51011))))

(assert (=> start!15214 (= res!64314 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15214 e!51011))

(assert (=> start!15214 true))

(declare-fun inv!12 (BitStream!2616) Bool)

(assert (=> start!15214 (and (inv!12 thiss!1090) e!51012)))

(declare-fun b!77826 () Bool)

(declare-fun res!64316 () Bool)

(assert (=> b!77826 (=> (not res!64316) (not e!51011))))

(assert (=> b!77826 (= res!64316 (validate_offset_bits!1 ((_ sign_extend 32) (size!1521 (buf!1917 thiss!1090))) ((_ sign_extend 32) (currentByte!3734 thiss!1090)) ((_ sign_extend 32) (currentBit!3729 thiss!1090)) nBits!322))))

(assert (= (and start!15214 res!64314) b!77826))

(assert (= (and b!77826 res!64316) b!77825))

(assert (= (and b!77825 res!64315) b!77821))

(assert (= (and b!77821 res!64318) b!77823))

(assert (= (and b!77823 res!64317) b!77824))

(assert (= start!15214 b!77822))

(declare-fun m!123425 () Bool)

(assert (=> b!77826 m!123425))

(declare-fun m!123427 () Bool)

(assert (=> b!77824 m!123427))

(declare-fun m!123429 () Bool)

(assert (=> b!77824 m!123429))

(declare-fun m!123431 () Bool)

(assert (=> b!77824 m!123431))

(declare-fun m!123433 () Bool)

(assert (=> b!77824 m!123433))

(declare-fun m!123435 () Bool)

(assert (=> b!77825 m!123435))

(declare-fun m!123437 () Bool)

(assert (=> b!77825 m!123437))

(declare-fun m!123439 () Bool)

(assert (=> b!77825 m!123439))

(assert (=> b!77825 m!123429))

(assert (=> b!77825 m!123431))

(declare-fun m!123441 () Bool)

(assert (=> b!77825 m!123441))

(declare-fun m!123443 () Bool)

(assert (=> b!77825 m!123443))

(assert (=> b!77825 m!123433))

(declare-fun m!123445 () Bool)

(assert (=> b!77822 m!123445))

(assert (=> b!77823 m!123435))

(declare-fun m!123447 () Bool)

(assert (=> start!15214 m!123447))

(assert (=> b!77821 m!123441))

(assert (=> b!77821 m!123437))

(check-sat (not b!77823) (not b!77826) (not start!15214) (not b!77821) (not b!77822) (not b!77824) (not b!77825))
