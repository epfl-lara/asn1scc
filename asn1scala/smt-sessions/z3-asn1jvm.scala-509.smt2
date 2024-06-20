; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14974 () Bool)

(assert start!14974)

(declare-fun res!63433 () Bool)

(declare-fun e!50382 () Bool)

(assert (=> start!14974 (=> (not res!63433) (not e!50382))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!14974 (= res!63433 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14974 e!50382))

(assert (=> start!14974 true))

(declare-datatypes ((array!3193 0))(
  ( (array!3194 (arr!2086 (Array (_ BitVec 32) (_ BitVec 8))) (size!1485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2544 0))(
  ( (BitStream!2545 (buf!1872 array!3193) (currentByte!3677 (_ BitVec 32)) (currentBit!3672 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2544)

(declare-fun e!50381 () Bool)

(declare-fun inv!12 (BitStream!2544) Bool)

(assert (=> start!14974 (and (inv!12 thiss!1090) e!50381)))

(declare-fun b!76777 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76777 (= e!50382 (not (invariant!0 (currentBit!3672 thiss!1090) (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090)))))))

(declare-fun e!50379 () Bool)

(assert (=> b!76777 e!50379))

(declare-fun res!63432 () Bool)

(assert (=> b!76777 (=> (not res!63432) (not e!50379))))

(declare-datatypes ((Unit!5058 0))(
  ( (Unit!5059) )
))
(declare-datatypes ((tuple2!6686 0))(
  ( (tuple2!6687 (_1!3477 Unit!5058) (_2!3477 BitStream!2544)) )
))
(declare-fun lt!122972 () tuple2!6686)

(assert (=> b!76777 (= res!63432 (= (size!1485 (buf!1872 thiss!1090)) (size!1485 (buf!1872 (_2!3477 lt!122972)))))))

(declare-fun appendNBits!0 (BitStream!2544 (_ BitVec 64) Bool) tuple2!6686)

(assert (=> b!76777 (= lt!122972 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76778 () Bool)

(declare-datatypes ((tuple2!6688 0))(
  ( (tuple2!6689 (_1!3478 BitStream!2544) (_2!3478 Bool)) )
))
(declare-fun lt!122973 () tuple2!6688)

(declare-datatypes ((tuple2!6690 0))(
  ( (tuple2!6691 (_1!3479 BitStream!2544) (_2!3479 BitStream!2544)) )
))
(declare-fun lt!122970 () tuple2!6690)

(assert (=> b!76778 (= e!50379 (not (or (not (_2!3478 lt!122973)) (not (= (_1!3478 lt!122973) (_2!3479 lt!122970))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2544 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6688)

(assert (=> b!76778 (= lt!122973 (checkBitsLoopPure!0 (_1!3479 lt!122970) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322)))

(declare-fun lt!122971 () Unit!5058)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2544 array!3193 (_ BitVec 64)) Unit!5058)

(assert (=> b!76778 (= lt!122971 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1872 (_2!3477 lt!122972)) nBits!322))))

(declare-fun reader!0 (BitStream!2544 BitStream!2544) tuple2!6690)

(assert (=> b!76778 (= lt!122970 (reader!0 thiss!1090 (_2!3477 lt!122972)))))

(declare-fun b!76779 () Bool)

(declare-fun array_inv!1331 (array!3193) Bool)

(assert (=> b!76779 (= e!50381 (array_inv!1331 (buf!1872 thiss!1090)))))

(declare-fun b!76780 () Bool)

(declare-fun res!63434 () Bool)

(assert (=> b!76780 (=> (not res!63434) (not e!50382))))

(assert (=> b!76780 (= res!63434 (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322))))

(declare-fun b!76781 () Bool)

(declare-fun res!63435 () Bool)

(assert (=> b!76781 (=> (not res!63435) (not e!50379))))

(declare-fun isPrefixOf!0 (BitStream!2544 BitStream!2544) Bool)

(assert (=> b!76781 (= res!63435 (isPrefixOf!0 thiss!1090 (_2!3477 lt!122972)))))

(declare-fun b!76782 () Bool)

(declare-fun res!63436 () Bool)

(assert (=> b!76782 (=> (not res!63436) (not e!50379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76782 (= res!63436 (= (bitIndex!0 (size!1485 (buf!1872 (_2!3477 lt!122972))) (currentByte!3677 (_2!3477 lt!122972)) (currentBit!3672 (_2!3477 lt!122972))) (bvadd (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)) nBits!322)))))

(assert (= (and start!14974 res!63433) b!76780))

(assert (= (and b!76780 res!63434) b!76777))

(assert (= (and b!76777 res!63432) b!76782))

(assert (= (and b!76782 res!63436) b!76781))

(assert (= (and b!76781 res!63435) b!76778))

(assert (= start!14974 b!76779))

(declare-fun m!122081 () Bool)

(assert (=> b!76780 m!122081))

(declare-fun m!122083 () Bool)

(assert (=> b!76779 m!122083))

(declare-fun m!122085 () Bool)

(assert (=> b!76781 m!122085))

(declare-fun m!122087 () Bool)

(assert (=> b!76778 m!122087))

(declare-fun m!122089 () Bool)

(assert (=> b!76778 m!122089))

(declare-fun m!122091 () Bool)

(assert (=> b!76778 m!122091))

(declare-fun m!122093 () Bool)

(assert (=> b!76778 m!122093))

(declare-fun m!122095 () Bool)

(assert (=> b!76782 m!122095))

(declare-fun m!122097 () Bool)

(assert (=> b!76782 m!122097))

(declare-fun m!122099 () Bool)

(assert (=> start!14974 m!122099))

(declare-fun m!122101 () Bool)

(assert (=> b!76777 m!122101))

(declare-fun m!122103 () Bool)

(assert (=> b!76777 m!122103))

(check-sat (not b!76780) (not b!76777) (not b!76778) (not b!76779) (not b!76781) (not start!14974) (not b!76782))
(check-sat)
(get-model)

(declare-fun d!24294 () Bool)

(declare-fun e!50403 () Bool)

(assert (=> d!24294 e!50403))

(declare-fun res!63466 () Bool)

(assert (=> d!24294 (=> (not res!63466) (not e!50403))))

(declare-fun lt!122998 () (_ BitVec 64))

(declare-fun lt!122999 () (_ BitVec 64))

(declare-fun lt!123000 () (_ BitVec 64))

(assert (=> d!24294 (= res!63466 (= lt!123000 (bvsub lt!122999 lt!122998)))))

(assert (=> d!24294 (or (= (bvand lt!122999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122999 lt!122998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24294 (= lt!122998 (remainingBits!0 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))) ((_ sign_extend 32) (currentByte!3677 (_2!3477 lt!122972))) ((_ sign_extend 32) (currentBit!3672 (_2!3477 lt!122972)))))))

(declare-fun lt!123001 () (_ BitVec 64))

(declare-fun lt!123003 () (_ BitVec 64))

(assert (=> d!24294 (= lt!122999 (bvmul lt!123001 lt!123003))))

(assert (=> d!24294 (or (= lt!123001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123003 (bvsdiv (bvmul lt!123001 lt!123003) lt!123001)))))

(assert (=> d!24294 (= lt!123003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24294 (= lt!123001 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))))))

(assert (=> d!24294 (= lt!123000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3677 (_2!3477 lt!122972))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3672 (_2!3477 lt!122972)))))))

(assert (=> d!24294 (invariant!0 (currentBit!3672 (_2!3477 lt!122972)) (currentByte!3677 (_2!3477 lt!122972)) (size!1485 (buf!1872 (_2!3477 lt!122972))))))

(assert (=> d!24294 (= (bitIndex!0 (size!1485 (buf!1872 (_2!3477 lt!122972))) (currentByte!3677 (_2!3477 lt!122972)) (currentBit!3672 (_2!3477 lt!122972))) lt!123000)))

(declare-fun b!76814 () Bool)

(declare-fun res!63465 () Bool)

(assert (=> b!76814 (=> (not res!63465) (not e!50403))))

(assert (=> b!76814 (= res!63465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123000))))

(declare-fun b!76815 () Bool)

(declare-fun lt!123002 () (_ BitVec 64))

(assert (=> b!76815 (= e!50403 (bvsle lt!123000 (bvmul lt!123002 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76815 (or (= lt!123002 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123002 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123002)))))

(assert (=> b!76815 (= lt!123002 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))))))

(assert (= (and d!24294 res!63466) b!76814))

(assert (= (and b!76814 res!63465) b!76815))

(declare-fun m!122135 () Bool)

(assert (=> d!24294 m!122135))

(declare-fun m!122137 () Bool)

(assert (=> d!24294 m!122137))

(assert (=> b!76782 d!24294))

(declare-fun d!24314 () Bool)

(declare-fun e!50404 () Bool)

(assert (=> d!24314 e!50404))

(declare-fun res!63468 () Bool)

(assert (=> d!24314 (=> (not res!63468) (not e!50404))))

(declare-fun lt!123005 () (_ BitVec 64))

(declare-fun lt!123006 () (_ BitVec 64))

(declare-fun lt!123004 () (_ BitVec 64))

(assert (=> d!24314 (= res!63468 (= lt!123006 (bvsub lt!123005 lt!123004)))))

(assert (=> d!24314 (or (= (bvand lt!123005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123004 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123005 lt!123004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24314 (= lt!123004 (remainingBits!0 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090))))))

(declare-fun lt!123007 () (_ BitVec 64))

(declare-fun lt!123009 () (_ BitVec 64))

(assert (=> d!24314 (= lt!123005 (bvmul lt!123007 lt!123009))))

(assert (=> d!24314 (or (= lt!123007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123009 (bvsdiv (bvmul lt!123007 lt!123009) lt!123007)))))

(assert (=> d!24314 (= lt!123009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24314 (= lt!123007 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))))))

(assert (=> d!24314 (= lt!123006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3677 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3672 thiss!1090))))))

(assert (=> d!24314 (invariant!0 (currentBit!3672 thiss!1090) (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090)))))

(assert (=> d!24314 (= (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)) lt!123006)))

(declare-fun b!76816 () Bool)

(declare-fun res!63467 () Bool)

(assert (=> b!76816 (=> (not res!63467) (not e!50404))))

(assert (=> b!76816 (= res!63467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123006))))

(declare-fun b!76817 () Bool)

(declare-fun lt!123008 () (_ BitVec 64))

(assert (=> b!76817 (= e!50404 (bvsle lt!123006 (bvmul lt!123008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76817 (or (= lt!123008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123008)))))

(assert (=> b!76817 (= lt!123008 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))))))

(assert (= (and d!24314 res!63468) b!76816))

(assert (= (and b!76816 res!63467) b!76817))

(declare-fun m!122139 () Bool)

(assert (=> d!24314 m!122139))

(assert (=> d!24314 m!122101))

(assert (=> b!76782 d!24314))

(declare-fun d!24316 () Bool)

(assert (=> d!24316 (= (invariant!0 (currentBit!3672 thiss!1090) (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090))) (and (bvsge (currentBit!3672 thiss!1090) #b00000000000000000000000000000000) (bvslt (currentBit!3672 thiss!1090) #b00000000000000000000000000001000) (bvsge (currentByte!3677 thiss!1090) #b00000000000000000000000000000000) (or (bvslt (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090))) (and (= (currentBit!3672 thiss!1090) #b00000000000000000000000000000000) (= (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090)))))))))

(assert (=> b!76777 d!24316))

(declare-fun d!24318 () Bool)

(declare-fun e!50425 () Bool)

(assert (=> d!24318 e!50425))

(declare-fun res!63508 () Bool)

(assert (=> d!24318 (=> (not res!63508) (not e!50425))))

(declare-fun lt!123061 () tuple2!6686)

(assert (=> d!24318 (= res!63508 (= (size!1485 (buf!1872 thiss!1090)) (size!1485 (buf!1872 (_2!3477 lt!123061)))))))

(declare-fun choose!36 (BitStream!2544 (_ BitVec 64) Bool) tuple2!6686)

(assert (=> d!24318 (= lt!123061 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24318 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24318 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!123061)))

(declare-fun b!76857 () Bool)

(declare-fun res!63509 () Bool)

(assert (=> b!76857 (=> (not res!63509) (not e!50425))))

(assert (=> b!76857 (= res!63509 (isPrefixOf!0 thiss!1090 (_2!3477 lt!123061)))))

(declare-fun b!76858 () Bool)

(declare-fun lt!123062 () tuple2!6688)

(declare-fun lt!123064 () tuple2!6690)

(assert (=> b!76858 (= e!50425 (and (_2!3478 lt!123062) (= (_1!3478 lt!123062) (_2!3479 lt!123064))))))

(assert (=> b!76858 (= lt!123062 (checkBitsLoopPure!0 (_1!3479 lt!123064) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!123063 () Unit!5058)

(declare-fun lt!123065 () Unit!5058)

(assert (=> b!76858 (= lt!123063 lt!123065)))

(assert (=> b!76858 (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!123061)))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322)))

(assert (=> b!76858 (= lt!123065 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1872 (_2!3477 lt!123061)) nBits!322))))

(declare-fun e!50426 () Bool)

(assert (=> b!76858 e!50426))

(declare-fun res!63510 () Bool)

(assert (=> b!76858 (=> (not res!63510) (not e!50426))))

(assert (=> b!76858 (= res!63510 (and (= (size!1485 (buf!1872 thiss!1090)) (size!1485 (buf!1872 (_2!3477 lt!123061)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76858 (= lt!123064 (reader!0 thiss!1090 (_2!3477 lt!123061)))))

(declare-fun b!76856 () Bool)

(declare-fun res!63507 () Bool)

(assert (=> b!76856 (=> (not res!63507) (not e!50425))))

(declare-fun lt!123066 () (_ BitVec 64))

(assert (=> b!76856 (= res!63507 (= (bitIndex!0 (size!1485 (buf!1872 (_2!3477 lt!123061))) (currentByte!3677 (_2!3477 lt!123061)) (currentBit!3672 (_2!3477 lt!123061))) (bvadd lt!123066 nBits!322)))))

(assert (=> b!76856 (or (not (= (bvand lt!123066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!123066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!123066 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76856 (= lt!123066 (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)))))

(declare-fun b!76859 () Bool)

(assert (=> b!76859 (= e!50426 (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322))))

(assert (= (and d!24318 res!63508) b!76856))

(assert (= (and b!76856 res!63507) b!76857))

(assert (= (and b!76857 res!63509) b!76858))

(assert (= (and b!76858 res!63510) b!76859))

(declare-fun m!122173 () Bool)

(assert (=> b!76856 m!122173))

(assert (=> b!76856 m!122097))

(declare-fun m!122175 () Bool)

(assert (=> d!24318 m!122175))

(declare-fun m!122177 () Bool)

(assert (=> b!76857 m!122177))

(assert (=> b!76859 m!122081))

(declare-fun m!122179 () Bool)

(assert (=> b!76858 m!122179))

(declare-fun m!122181 () Bool)

(assert (=> b!76858 m!122181))

(declare-fun m!122183 () Bool)

(assert (=> b!76858 m!122183))

(declare-fun m!122185 () Bool)

(assert (=> b!76858 m!122185))

(assert (=> b!76777 d!24318))

(declare-fun d!24330 () Bool)

(assert (=> d!24330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1485 (buf!1872 thiss!1090))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090))) nBits!322))))

(declare-fun bs!5871 () Bool)

(assert (= bs!5871 d!24330))

(assert (=> bs!5871 m!122139))

(assert (=> b!76780 d!24330))

(declare-fun d!24334 () Bool)

(declare-fun res!63520 () Bool)

(declare-fun e!50434 () Bool)

(assert (=> d!24334 (=> (not res!63520) (not e!50434))))

(assert (=> d!24334 (= res!63520 (= (size!1485 (buf!1872 thiss!1090)) (size!1485 (buf!1872 (_2!3477 lt!122972)))))))

(assert (=> d!24334 (= (isPrefixOf!0 thiss!1090 (_2!3477 lt!122972)) e!50434)))

(declare-fun b!76869 () Bool)

(declare-fun res!63521 () Bool)

(assert (=> b!76869 (=> (not res!63521) (not e!50434))))

(assert (=> b!76869 (= res!63521 (bvsle (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)) (bitIndex!0 (size!1485 (buf!1872 (_2!3477 lt!122972))) (currentByte!3677 (_2!3477 lt!122972)) (currentBit!3672 (_2!3477 lt!122972)))))))

(declare-fun b!76870 () Bool)

(declare-fun e!50433 () Bool)

(assert (=> b!76870 (= e!50434 e!50433)))

(declare-fun res!63522 () Bool)

(assert (=> b!76870 (=> res!63522 e!50433)))

(assert (=> b!76870 (= res!63522 (= (size!1485 (buf!1872 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76871 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3193 array!3193 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76871 (= e!50433 (arrayBitRangesEq!0 (buf!1872 thiss!1090) (buf!1872 (_2!3477 lt!122972)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090))))))

(assert (= (and d!24334 res!63520) b!76869))

(assert (= (and b!76869 res!63521) b!76870))

(assert (= (and b!76870 (not res!63522)) b!76871))

(assert (=> b!76869 m!122097))

(assert (=> b!76869 m!122095))

(assert (=> b!76871 m!122097))

(assert (=> b!76871 m!122097))

(declare-fun m!122191 () Bool)

(assert (=> b!76871 m!122191))

(assert (=> b!76781 d!24334))

(declare-fun d!24338 () Bool)

(assert (=> d!24338 (= (array_inv!1331 (buf!1872 thiss!1090)) (bvsge (size!1485 (buf!1872 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76779 d!24338))

(declare-fun d!24340 () Bool)

(declare-datatypes ((tuple2!6700 0))(
  ( (tuple2!6701 (_1!3484 Bool) (_2!3484 BitStream!2544)) )
))
(declare-fun lt!123084 () tuple2!6700)

(declare-fun checkBitsLoop!0 (BitStream!2544 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6700)

(assert (=> d!24340 (= lt!123084 (checkBitsLoop!0 (_1!3479 lt!122970) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24340 (= (checkBitsLoopPure!0 (_1!3479 lt!122970) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6689 (_2!3484 lt!123084) (_1!3484 lt!123084)))))

(declare-fun bs!5873 () Bool)

(assert (= bs!5873 d!24340))

(declare-fun m!122193 () Bool)

(assert (=> bs!5873 m!122193))

(assert (=> b!76778 d!24340))

(declare-fun d!24342 () Bool)

(assert (=> d!24342 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090))) nBits!322))))

(declare-fun bs!5874 () Bool)

(assert (= bs!5874 d!24342))

(declare-fun m!122195 () Bool)

(assert (=> bs!5874 m!122195))

(assert (=> b!76778 d!24342))

(declare-fun d!24344 () Bool)

(assert (=> d!24344 (validate_offset_bits!1 ((_ sign_extend 32) (size!1485 (buf!1872 (_2!3477 lt!122972)))) ((_ sign_extend 32) (currentByte!3677 thiss!1090)) ((_ sign_extend 32) (currentBit!3672 thiss!1090)) nBits!322)))

(declare-fun lt!123099 () Unit!5058)

(declare-fun choose!9 (BitStream!2544 array!3193 (_ BitVec 64) BitStream!2544) Unit!5058)

(assert (=> d!24344 (= lt!123099 (choose!9 thiss!1090 (buf!1872 (_2!3477 lt!122972)) nBits!322 (BitStream!2545 (buf!1872 (_2!3477 lt!122972)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090))))))

(assert (=> d!24344 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1872 (_2!3477 lt!122972)) nBits!322) lt!123099)))

(declare-fun bs!5875 () Bool)

(assert (= bs!5875 d!24344))

(assert (=> bs!5875 m!122089))

(declare-fun m!122201 () Bool)

(assert (=> bs!5875 m!122201))

(assert (=> b!76778 d!24344))

(declare-fun d!24350 () Bool)

(declare-fun e!50452 () Bool)

(assert (=> d!24350 e!50452))

(declare-fun res!63549 () Bool)

(assert (=> d!24350 (=> (not res!63549) (not e!50452))))

(declare-fun lt!123221 () tuple2!6690)

(assert (=> d!24350 (= res!63549 (isPrefixOf!0 (_1!3479 lt!123221) (_2!3479 lt!123221)))))

(declare-fun lt!123231 () BitStream!2544)

(assert (=> d!24350 (= lt!123221 (tuple2!6691 lt!123231 (_2!3477 lt!122972)))))

(declare-fun lt!123225 () Unit!5058)

(declare-fun lt!123230 () Unit!5058)

(assert (=> d!24350 (= lt!123225 lt!123230)))

(assert (=> d!24350 (isPrefixOf!0 lt!123231 (_2!3477 lt!122972))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2544 BitStream!2544 BitStream!2544) Unit!5058)

(assert (=> d!24350 (= lt!123230 (lemmaIsPrefixTransitive!0 lt!123231 (_2!3477 lt!122972) (_2!3477 lt!122972)))))

(declare-fun lt!123215 () Unit!5058)

(declare-fun lt!123227 () Unit!5058)

(assert (=> d!24350 (= lt!123215 lt!123227)))

(assert (=> d!24350 (isPrefixOf!0 lt!123231 (_2!3477 lt!122972))))

(assert (=> d!24350 (= lt!123227 (lemmaIsPrefixTransitive!0 lt!123231 thiss!1090 (_2!3477 lt!122972)))))

(declare-fun lt!123232 () Unit!5058)

(declare-fun e!50451 () Unit!5058)

(assert (=> d!24350 (= lt!123232 e!50451)))

(declare-fun c!5591 () Bool)

(assert (=> d!24350 (= c!5591 (not (= (size!1485 (buf!1872 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!123218 () Unit!5058)

(declare-fun lt!123223 () Unit!5058)

(assert (=> d!24350 (= lt!123218 lt!123223)))

(assert (=> d!24350 (isPrefixOf!0 (_2!3477 lt!122972) (_2!3477 lt!122972))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2544) Unit!5058)

(assert (=> d!24350 (= lt!123223 (lemmaIsPrefixRefl!0 (_2!3477 lt!122972)))))

(declare-fun lt!123228 () Unit!5058)

(declare-fun lt!123219 () Unit!5058)

(assert (=> d!24350 (= lt!123228 lt!123219)))

(assert (=> d!24350 (= lt!123219 (lemmaIsPrefixRefl!0 (_2!3477 lt!122972)))))

(declare-fun lt!123220 () Unit!5058)

(declare-fun lt!123229 () Unit!5058)

(assert (=> d!24350 (= lt!123220 lt!123229)))

(assert (=> d!24350 (isPrefixOf!0 lt!123231 lt!123231)))

(assert (=> d!24350 (= lt!123229 (lemmaIsPrefixRefl!0 lt!123231))))

(declare-fun lt!123226 () Unit!5058)

(declare-fun lt!123233 () Unit!5058)

(assert (=> d!24350 (= lt!123226 lt!123233)))

(assert (=> d!24350 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24350 (= lt!123233 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24350 (= lt!123231 (BitStream!2545 (buf!1872 (_2!3477 lt!122972)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)))))

(assert (=> d!24350 (isPrefixOf!0 thiss!1090 (_2!3477 lt!122972))))

(assert (=> d!24350 (= (reader!0 thiss!1090 (_2!3477 lt!122972)) lt!123221)))

(declare-fun lt!123222 () (_ BitVec 64))

(declare-fun b!76905 () Bool)

(declare-fun lt!123216 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2544 (_ BitVec 64)) BitStream!2544)

(assert (=> b!76905 (= e!50452 (= (_1!3479 lt!123221) (withMovedBitIndex!0 (_2!3479 lt!123221) (bvsub lt!123216 lt!123222))))))

(assert (=> b!76905 (or (= (bvand lt!123216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123216 lt!123222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76905 (= lt!123222 (bitIndex!0 (size!1485 (buf!1872 (_2!3477 lt!122972))) (currentByte!3677 (_2!3477 lt!122972)) (currentBit!3672 (_2!3477 lt!122972))))))

(assert (=> b!76905 (= lt!123216 (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)))))

(declare-fun b!76906 () Bool)

(declare-fun Unit!5063 () Unit!5058)

(assert (=> b!76906 (= e!50451 Unit!5063)))

(declare-fun b!76907 () Bool)

(declare-fun res!63548 () Bool)

(assert (=> b!76907 (=> (not res!63548) (not e!50452))))

(assert (=> b!76907 (= res!63548 (isPrefixOf!0 (_1!3479 lt!123221) thiss!1090))))

(declare-fun b!76908 () Bool)

(declare-fun lt!123214 () Unit!5058)

(assert (=> b!76908 (= e!50451 lt!123214)))

(declare-fun lt!123224 () (_ BitVec 64))

(assert (=> b!76908 (= lt!123224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123217 () (_ BitVec 64))

(assert (=> b!76908 (= lt!123217 (bitIndex!0 (size!1485 (buf!1872 thiss!1090)) (currentByte!3677 thiss!1090) (currentBit!3672 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3193 array!3193 (_ BitVec 64) (_ BitVec 64)) Unit!5058)

(assert (=> b!76908 (= lt!123214 (arrayBitRangesEqSymmetric!0 (buf!1872 thiss!1090) (buf!1872 (_2!3477 lt!122972)) lt!123224 lt!123217))))

(assert (=> b!76908 (arrayBitRangesEq!0 (buf!1872 (_2!3477 lt!122972)) (buf!1872 thiss!1090) lt!123224 lt!123217)))

(declare-fun b!76909 () Bool)

(declare-fun res!63550 () Bool)

(assert (=> b!76909 (=> (not res!63550) (not e!50452))))

(assert (=> b!76909 (= res!63550 (isPrefixOf!0 (_2!3479 lt!123221) (_2!3477 lt!122972)))))

(assert (= (and d!24350 c!5591) b!76908))

(assert (= (and d!24350 (not c!5591)) b!76906))

(assert (= (and d!24350 res!63549) b!76907))

(assert (= (and b!76907 res!63548) b!76909))

(assert (= (and b!76909 res!63550) b!76905))

(assert (=> b!76908 m!122097))

(declare-fun m!122239 () Bool)

(assert (=> b!76908 m!122239))

(declare-fun m!122241 () Bool)

(assert (=> b!76908 m!122241))

(declare-fun m!122243 () Bool)

(assert (=> b!76905 m!122243))

(assert (=> b!76905 m!122095))

(assert (=> b!76905 m!122097))

(declare-fun m!122245 () Bool)

(assert (=> b!76907 m!122245))

(declare-fun m!122247 () Bool)

(assert (=> d!24350 m!122247))

(declare-fun m!122249 () Bool)

(assert (=> d!24350 m!122249))

(declare-fun m!122251 () Bool)

(assert (=> d!24350 m!122251))

(declare-fun m!122253 () Bool)

(assert (=> d!24350 m!122253))

(declare-fun m!122255 () Bool)

(assert (=> d!24350 m!122255))

(declare-fun m!122257 () Bool)

(assert (=> d!24350 m!122257))

(declare-fun m!122259 () Bool)

(assert (=> d!24350 m!122259))

(assert (=> d!24350 m!122085))

(declare-fun m!122261 () Bool)

(assert (=> d!24350 m!122261))

(declare-fun m!122263 () Bool)

(assert (=> d!24350 m!122263))

(declare-fun m!122265 () Bool)

(assert (=> d!24350 m!122265))

(declare-fun m!122267 () Bool)

(assert (=> b!76909 m!122267))

(assert (=> b!76778 d!24350))

(declare-fun d!24360 () Bool)

(assert (=> d!24360 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3672 thiss!1090) (currentByte!3677 thiss!1090) (size!1485 (buf!1872 thiss!1090))))))

(declare-fun bs!5879 () Bool)

(assert (= bs!5879 d!24360))

(assert (=> bs!5879 m!122101))

(assert (=> start!14974 d!24360))

(check-sat (not b!76871) (not b!76907) (not b!76858) (not d!24294) (not d!24350) (not b!76905) (not d!24360) (not b!76909) (not b!76856) (not d!24340) (not d!24344) (not d!24342) (not d!24314) (not b!76857) (not d!24330) (not b!76908) (not b!76859) (not d!24318) (not b!76869))
