; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39724 () Bool)

(assert start!39724)

(declare-fun b!179855 () Bool)

(declare-fun e!125045 () Bool)

(declare-datatypes ((array!9658 0))(
  ( (array!9659 (arr!5189 (Array (_ BitVec 32) (_ BitVec 8))) (size!4259 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7626 0))(
  ( (BitStream!7627 (buf!4702 array!9658) (currentByte!8912 (_ BitVec 32)) (currentBit!8907 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15500 0))(
  ( (tuple2!15501 (_1!8395 BitStream!7626) (_2!8395 Bool)) )
))
(declare-fun lt!275994 () tuple2!15500)

(declare-fun lt!275988 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179855 (= e!125045 (= (bitIndex!0 (size!4259 (buf!4702 (_1!8395 lt!275994))) (currentByte!8912 (_1!8395 lt!275994)) (currentBit!8907 (_1!8395 lt!275994))) lt!275988))))

(declare-fun b!179856 () Bool)

(declare-fun e!125049 () Bool)

(declare-fun e!125043 () Bool)

(assert (=> b!179856 (= e!125049 (not e!125043))))

(declare-fun res!149277 () Bool)

(assert (=> b!179856 (=> res!149277 e!125043)))

(declare-fun lt!275996 () (_ BitVec 64))

(declare-fun lt!275986 () (_ BitVec 64))

(assert (=> b!179856 (= res!149277 (not (= lt!275996 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275986))))))

(declare-datatypes ((Unit!12937 0))(
  ( (Unit!12938) )
))
(declare-datatypes ((tuple2!15502 0))(
  ( (tuple2!15503 (_1!8396 Unit!12937) (_2!8396 BitStream!7626)) )
))
(declare-fun lt!275998 () tuple2!15502)

(assert (=> b!179856 (= lt!275996 (bitIndex!0 (size!4259 (buf!4702 (_2!8396 lt!275998))) (currentByte!8912 (_2!8396 lt!275998)) (currentBit!8907 (_2!8396 lt!275998))))))

(declare-fun thiss!1204 () BitStream!7626)

(assert (=> b!179856 (= lt!275986 (bitIndex!0 (size!4259 (buf!4702 thiss!1204)) (currentByte!8912 thiss!1204) (currentBit!8907 thiss!1204)))))

(declare-fun e!125042 () Bool)

(assert (=> b!179856 e!125042))

(declare-fun res!149285 () Bool)

(assert (=> b!179856 (=> (not res!149285) (not e!125042))))

(assert (=> b!179856 (= res!149285 (= (size!4259 (buf!4702 thiss!1204)) (size!4259 (buf!4702 (_2!8396 lt!275998)))))))

(declare-fun lt!275990 () Bool)

(declare-fun appendBit!0 (BitStream!7626 Bool) tuple2!15502)

(assert (=> b!179856 (= lt!275998 (appendBit!0 thiss!1204 lt!275990))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!179856 (= lt!275990 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179857 () Bool)

(declare-fun res!149289 () Bool)

(declare-fun e!125048 () Bool)

(assert (=> b!179857 (=> res!149289 e!125048)))

(declare-fun lt!275993 () tuple2!15502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179857 (= res!149289 (not (invariant!0 (currentBit!8907 (_2!8396 lt!275993)) (currentByte!8912 (_2!8396 lt!275993)) (size!4259 (buf!4702 (_2!8396 lt!275993))))))))

(declare-fun res!149279 () Bool)

(assert (=> start!39724 (=> (not res!149279) (not e!125049))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39724 (= res!149279 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39724 e!125049))

(assert (=> start!39724 true))

(declare-fun e!125046 () Bool)

(declare-fun inv!12 (BitStream!7626) Bool)

(assert (=> start!39724 (and (inv!12 thiss!1204) e!125046)))

(declare-fun b!179858 () Bool)

(declare-fun res!149276 () Bool)

(assert (=> b!179858 (=> (not res!149276) (not e!125049))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179858 (= res!149276 (validate_offset_bits!1 ((_ sign_extend 32) (size!4259 (buf!4702 thiss!1204))) ((_ sign_extend 32) (currentByte!8912 thiss!1204)) ((_ sign_extend 32) (currentBit!8907 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179859 () Bool)

(declare-fun res!149286 () Bool)

(assert (=> b!179859 (=> res!149286 e!125048)))

(declare-fun isPrefixOf!0 (BitStream!7626 BitStream!7626) Bool)

(assert (=> b!179859 (= res!149286 (not (isPrefixOf!0 (_2!8396 lt!275998) (_2!8396 lt!275993))))))

(declare-fun b!179860 () Bool)

(declare-fun e!125050 () Bool)

(assert (=> b!179860 (= e!125050 (invariant!0 (currentBit!8907 thiss!1204) (currentByte!8912 thiss!1204) (size!4259 (buf!4702 (_2!8396 lt!275993)))))))

(declare-fun b!179861 () Bool)

(declare-fun e!125041 () Bool)

(assert (=> b!179861 (= e!125041 e!125045)))

(declare-fun res!149283 () Bool)

(assert (=> b!179861 (=> (not res!149283) (not e!125045))))

(assert (=> b!179861 (= res!149283 (and (= (_2!8395 lt!275994) lt!275990) (= (_1!8395 lt!275994) (_2!8396 lt!275998))))))

(declare-fun readBitPure!0 (BitStream!7626) tuple2!15500)

(declare-fun readerFrom!0 (BitStream!7626 (_ BitVec 32) (_ BitVec 32)) BitStream!7626)

(assert (=> b!179861 (= lt!275994 (readBitPure!0 (readerFrom!0 (_2!8396 lt!275998) (currentBit!8907 thiss!1204) (currentByte!8912 thiss!1204))))))

(declare-fun b!179862 () Bool)

(declare-fun res!149287 () Bool)

(assert (=> b!179862 (=> (not res!149287) (not e!125041))))

(assert (=> b!179862 (= res!149287 (isPrefixOf!0 thiss!1204 (_2!8396 lt!275998)))))

(declare-fun b!179863 () Bool)

(declare-fun array_inv!4000 (array!9658) Bool)

(assert (=> b!179863 (= e!125046 (array_inv!4000 (buf!4702 thiss!1204)))))

(declare-fun b!179864 () Bool)

(declare-fun res!149281 () Bool)

(assert (=> b!179864 (=> res!149281 e!125048)))

(declare-fun lt!275987 () (_ BitVec 64))

(assert (=> b!179864 (= res!149281 (or (not (= (size!4259 (buf!4702 (_2!8396 lt!275993))) (size!4259 (buf!4702 thiss!1204)))) (not (= lt!275987 (bvsub (bvadd lt!275986 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179865 () Bool)

(declare-fun res!149275 () Bool)

(assert (=> b!179865 (=> (not res!149275) (not e!125049))))

(assert (=> b!179865 (= res!149275 (not (= i!590 nBits!348)))))

(declare-fun b!179866 () Bool)

(assert (=> b!179866 (= e!125043 e!125048)))

(declare-fun res!149278 () Bool)

(assert (=> b!179866 (=> res!149278 e!125048)))

(assert (=> b!179866 (= res!149278 (not (= lt!275987 (bvsub (bvsub (bvadd lt!275996 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179866 (= lt!275987 (bitIndex!0 (size!4259 (buf!4702 (_2!8396 lt!275993))) (currentByte!8912 (_2!8396 lt!275993)) (currentBit!8907 (_2!8396 lt!275993))))))

(assert (=> b!179866 (isPrefixOf!0 thiss!1204 (_2!8396 lt!275993))))

(declare-fun lt!275999 () Unit!12937)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7626 BitStream!7626 BitStream!7626) Unit!12937)

(assert (=> b!179866 (= lt!275999 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8396 lt!275998) (_2!8396 lt!275993)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15502)

(assert (=> b!179866 (= lt!275993 (appendBitsLSBFirstLoopTR!0 (_2!8396 lt!275998) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179867 () Bool)

(assert (=> b!179867 (= e!125048 true)))

(declare-datatypes ((tuple2!15504 0))(
  ( (tuple2!15505 (_1!8397 BitStream!7626) (_2!8397 BitStream!7626)) )
))
(declare-fun lt!275995 () tuple2!15504)

(assert (=> b!179867 (= (_2!8395 (readBitPure!0 (_1!8397 lt!275995))) lt!275990)))

(declare-fun lt!275984 () tuple2!15504)

(declare-fun reader!0 (BitStream!7626 BitStream!7626) tuple2!15504)

(assert (=> b!179867 (= lt!275984 (reader!0 (_2!8396 lt!275998) (_2!8396 lt!275993)))))

(assert (=> b!179867 (= lt!275995 (reader!0 thiss!1204 (_2!8396 lt!275993)))))

(declare-fun e!125047 () Bool)

(assert (=> b!179867 e!125047))

(declare-fun res!149274 () Bool)

(assert (=> b!179867 (=> (not res!149274) (not e!125047))))

(declare-fun lt!275991 () tuple2!15500)

(declare-fun lt!275997 () tuple2!15500)

(assert (=> b!179867 (= res!149274 (= (bitIndex!0 (size!4259 (buf!4702 (_1!8395 lt!275991))) (currentByte!8912 (_1!8395 lt!275991)) (currentBit!8907 (_1!8395 lt!275991))) (bitIndex!0 (size!4259 (buf!4702 (_1!8395 lt!275997))) (currentByte!8912 (_1!8395 lt!275997)) (currentBit!8907 (_1!8395 lt!275997)))))))

(declare-fun lt!275992 () Unit!12937)

(declare-fun lt!275989 () BitStream!7626)

(declare-fun readBitPrefixLemma!0 (BitStream!7626 BitStream!7626) Unit!12937)

(assert (=> b!179867 (= lt!275992 (readBitPrefixLemma!0 lt!275989 (_2!8396 lt!275993)))))

(assert (=> b!179867 (= lt!275997 (readBitPure!0 (BitStream!7627 (buf!4702 (_2!8396 lt!275993)) (currentByte!8912 thiss!1204) (currentBit!8907 thiss!1204))))))

(assert (=> b!179867 (= lt!275991 (readBitPure!0 lt!275989))))

(assert (=> b!179867 e!125050))

(declare-fun res!149280 () Bool)

(assert (=> b!179867 (=> (not res!149280) (not e!125050))))

(assert (=> b!179867 (= res!149280 (invariant!0 (currentBit!8907 thiss!1204) (currentByte!8912 thiss!1204) (size!4259 (buf!4702 (_2!8396 lt!275998)))))))

(assert (=> b!179867 (= lt!275989 (BitStream!7627 (buf!4702 (_2!8396 lt!275998)) (currentByte!8912 thiss!1204) (currentBit!8907 thiss!1204)))))

(declare-fun b!179868 () Bool)

(declare-fun res!149284 () Bool)

(assert (=> b!179868 (=> (not res!149284) (not e!125049))))

(assert (=> b!179868 (= res!149284 (invariant!0 (currentBit!8907 thiss!1204) (currentByte!8912 thiss!1204) (size!4259 (buf!4702 thiss!1204))))))

(declare-fun b!179869 () Bool)

(declare-fun res!149282 () Bool)

(assert (=> b!179869 (=> res!149282 e!125048)))

(assert (=> b!179869 (= res!149282 (not (isPrefixOf!0 thiss!1204 (_2!8396 lt!275998))))))

(declare-fun b!179870 () Bool)

(assert (=> b!179870 (= e!125042 e!125041)))

(declare-fun res!149288 () Bool)

(assert (=> b!179870 (=> (not res!149288) (not e!125041))))

(declare-fun lt!275985 () (_ BitVec 64))

(assert (=> b!179870 (= res!149288 (= lt!275988 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275985)))))

(assert (=> b!179870 (= lt!275988 (bitIndex!0 (size!4259 (buf!4702 (_2!8396 lt!275998))) (currentByte!8912 (_2!8396 lt!275998)) (currentBit!8907 (_2!8396 lt!275998))))))

(assert (=> b!179870 (= lt!275985 (bitIndex!0 (size!4259 (buf!4702 thiss!1204)) (currentByte!8912 thiss!1204) (currentBit!8907 thiss!1204)))))

(declare-fun b!179871 () Bool)

(assert (=> b!179871 (= e!125047 (= (_2!8395 lt!275991) (_2!8395 lt!275997)))))

(assert (= (and start!39724 res!149279) b!179858))

(assert (= (and b!179858 res!149276) b!179868))

(assert (= (and b!179868 res!149284) b!179865))

(assert (= (and b!179865 res!149275) b!179856))

(assert (= (and b!179856 res!149285) b!179870))

(assert (= (and b!179870 res!149288) b!179862))

(assert (= (and b!179862 res!149287) b!179861))

(assert (= (and b!179861 res!149283) b!179855))

(assert (= (and b!179856 (not res!149277)) b!179866))

(assert (= (and b!179866 (not res!149278)) b!179857))

(assert (= (and b!179857 (not res!149289)) b!179864))

(assert (= (and b!179864 (not res!149281)) b!179859))

(assert (= (and b!179859 (not res!149286)) b!179869))

(assert (= (and b!179869 (not res!149282)) b!179867))

(assert (= (and b!179867 res!149280) b!179860))

(assert (= (and b!179867 res!149274) b!179871))

(assert (= start!39724 b!179863))

(declare-fun m!280219 () Bool)

(assert (=> b!179856 m!280219))

(declare-fun m!280221 () Bool)

(assert (=> b!179856 m!280221))

(declare-fun m!280223 () Bool)

(assert (=> b!179856 m!280223))

(declare-fun m!280225 () Bool)

(assert (=> start!39724 m!280225))

(declare-fun m!280227 () Bool)

(assert (=> b!179860 m!280227))

(declare-fun m!280229 () Bool)

(assert (=> b!179869 m!280229))

(declare-fun m!280231 () Bool)

(assert (=> b!179863 m!280231))

(assert (=> b!179862 m!280229))

(declare-fun m!280233 () Bool)

(assert (=> b!179857 m!280233))

(assert (=> b!179870 m!280219))

(assert (=> b!179870 m!280221))

(declare-fun m!280235 () Bool)

(assert (=> b!179868 m!280235))

(declare-fun m!280237 () Bool)

(assert (=> b!179861 m!280237))

(assert (=> b!179861 m!280237))

(declare-fun m!280239 () Bool)

(assert (=> b!179861 m!280239))

(declare-fun m!280241 () Bool)

(assert (=> b!179866 m!280241))

(declare-fun m!280243 () Bool)

(assert (=> b!179866 m!280243))

(declare-fun m!280245 () Bool)

(assert (=> b!179866 m!280245))

(declare-fun m!280247 () Bool)

(assert (=> b!179866 m!280247))

(declare-fun m!280249 () Bool)

(assert (=> b!179858 m!280249))

(declare-fun m!280251 () Bool)

(assert (=> b!179855 m!280251))

(declare-fun m!280253 () Bool)

(assert (=> b!179867 m!280253))

(declare-fun m!280255 () Bool)

(assert (=> b!179867 m!280255))

(declare-fun m!280257 () Bool)

(assert (=> b!179867 m!280257))

(declare-fun m!280259 () Bool)

(assert (=> b!179867 m!280259))

(declare-fun m!280261 () Bool)

(assert (=> b!179867 m!280261))

(declare-fun m!280263 () Bool)

(assert (=> b!179867 m!280263))

(declare-fun m!280265 () Bool)

(assert (=> b!179867 m!280265))

(declare-fun m!280267 () Bool)

(assert (=> b!179867 m!280267))

(declare-fun m!280269 () Bool)

(assert (=> b!179867 m!280269))

(declare-fun m!280271 () Bool)

(assert (=> b!179859 m!280271))

(check-sat (not start!39724) (not b!179862) (not b!179870) (not b!179867) (not b!179858) (not b!179860) (not b!179861) (not b!179857) (not b!179859) (not b!179866) (not b!179855) (not b!179856) (not b!179868) (not b!179863) (not b!179869))
