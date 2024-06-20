; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15136 () Bool)

(assert start!15136)

(declare-fun b!77473 () Bool)

(declare-fun e!50800 () Bool)

(declare-datatypes ((array!3247 0))(
  ( (array!3248 (arr!2110 (Array (_ BitVec 32) (_ BitVec 8))) (size!1509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2592 0))(
  ( (BitStream!2593 (buf!1902 array!3247) (currentByte!3716 (_ BitVec 32)) (currentBit!3711 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6842 0))(
  ( (tuple2!6843 (_1!3555 BitStream!2592) (_2!3555 Bool)) )
))
(declare-fun lt!124189 () tuple2!6842)

(declare-datatypes ((tuple2!6844 0))(
  ( (tuple2!6845 (_1!3556 BitStream!2592) (_2!3556 BitStream!2592)) )
))
(declare-fun lt!124188 () tuple2!6844)

(assert (=> b!77473 (= e!50800 (not (or (not (_2!3555 lt!124189)) (not (= (_1!3555 lt!124189) (_2!3556 lt!124188))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2592 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6842)

(assert (=> b!77473 (= lt!124189 (checkBitsLoopPure!0 (_1!3556 lt!124188) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5112 0))(
  ( (Unit!5113) )
))
(declare-datatypes ((tuple2!6846 0))(
  ( (tuple2!6847 (_1!3557 Unit!5112) (_2!3557 BitStream!2592)) )
))
(declare-fun lt!124190 () tuple2!6846)

(declare-fun thiss!1090 () BitStream!2592)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77473 (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322)))

(declare-fun lt!124186 () Unit!5112)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2592 array!3247 (_ BitVec 64)) Unit!5112)

(assert (=> b!77473 (= lt!124186 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1902 (_2!3557 lt!124190)) nBits!322))))

(declare-fun reader!0 (BitStream!2592 BitStream!2592) tuple2!6844)

(assert (=> b!77473 (= lt!124188 (reader!0 thiss!1090 (_2!3557 lt!124190)))))

(declare-fun b!77474 () Bool)

(declare-fun e!50801 () Bool)

(declare-fun array_inv!1355 (array!3247) Bool)

(assert (=> b!77474 (= e!50801 (array_inv!1355 (buf!1902 thiss!1090)))))

(declare-fun b!77475 () Bool)

(declare-fun res!64020 () Bool)

(assert (=> b!77475 (=> (not res!64020) (not e!50800))))

(declare-fun isPrefixOf!0 (BitStream!2592 BitStream!2592) Bool)

(assert (=> b!77475 (= res!64020 (isPrefixOf!0 thiss!1090 (_2!3557 lt!124190)))))

(declare-fun b!77476 () Bool)

(declare-fun res!64024 () Bool)

(assert (=> b!77476 (=> (not res!64024) (not e!50800))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77476 (= res!64024 (= (bitIndex!0 (size!1509 (buf!1902 (_2!3557 lt!124190))) (currentByte!3716 (_2!3557 lt!124190)) (currentBit!3711 (_2!3557 lt!124190))) (bvadd (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)) nBits!322)))))

(declare-fun res!64023 () Bool)

(declare-fun e!50799 () Bool)

(assert (=> start!15136 (=> (not res!64023) (not e!50799))))

(assert (=> start!15136 (= res!64023 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15136 e!50799))

(assert (=> start!15136 true))

(declare-fun inv!12 (BitStream!2592) Bool)

(assert (=> start!15136 (and (inv!12 thiss!1090) e!50801)))

(declare-fun b!77477 () Bool)

(declare-fun res!64021 () Bool)

(assert (=> b!77477 (=> (not res!64021) (not e!50799))))

(assert (=> b!77477 (= res!64021 (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322))))

(declare-fun lt!124191 () (_ BitVec 64))

(declare-fun b!77478 () Bool)

(declare-fun lt!124187 () (_ BitVec 64))

(assert (=> b!77478 (= e!50799 (not (or (not (= lt!124191 (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!124191 (bvand (bvadd lt!124187 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!77478 (= lt!124191 (bvand lt!124187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77478 (= lt!124187 (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)))))

(assert (=> b!77478 e!50800))

(declare-fun res!64022 () Bool)

(assert (=> b!77478 (=> (not res!64022) (not e!50800))))

(assert (=> b!77478 (= res!64022 (= (size!1509 (buf!1902 thiss!1090)) (size!1509 (buf!1902 (_2!3557 lt!124190)))))))

(declare-fun appendNBits!0 (BitStream!2592 (_ BitVec 64) Bool) tuple2!6846)

(assert (=> b!77478 (= lt!124190 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15136 res!64023) b!77477))

(assert (= (and b!77477 res!64021) b!77478))

(assert (= (and b!77478 res!64022) b!77476))

(assert (= (and b!77476 res!64024) b!77475))

(assert (= (and b!77475 res!64020) b!77473))

(assert (= start!15136 b!77474))

(declare-fun m!122979 () Bool)

(assert (=> b!77473 m!122979))

(declare-fun m!122981 () Bool)

(assert (=> b!77473 m!122981))

(declare-fun m!122983 () Bool)

(assert (=> b!77473 m!122983))

(declare-fun m!122985 () Bool)

(assert (=> b!77473 m!122985))

(declare-fun m!122987 () Bool)

(assert (=> start!15136 m!122987))

(declare-fun m!122989 () Bool)

(assert (=> b!77478 m!122989))

(declare-fun m!122991 () Bool)

(assert (=> b!77478 m!122991))

(declare-fun m!122993 () Bool)

(assert (=> b!77476 m!122993))

(assert (=> b!77476 m!122989))

(declare-fun m!122995 () Bool)

(assert (=> b!77477 m!122995))

(declare-fun m!122997 () Bool)

(assert (=> b!77475 m!122997))

(declare-fun m!122999 () Bool)

(assert (=> b!77474 m!122999))

(check-sat (not b!77476) (not b!77474) (not b!77473) (not b!77478) (not b!77475) (not b!77477) (not start!15136))
(check-sat)
(get-model)

(declare-fun d!24454 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24454 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3711 thiss!1090) (currentByte!3716 thiss!1090) (size!1509 (buf!1902 thiss!1090))))))

(declare-fun bs!5923 () Bool)

(assert (= bs!5923 d!24454))

(declare-fun m!123023 () Bool)

(assert (=> bs!5923 m!123023))

(assert (=> start!15136 d!24454))

(declare-fun d!24456 () Bool)

(declare-datatypes ((tuple2!6854 0))(
  ( (tuple2!6855 (_1!3561 Bool) (_2!3561 BitStream!2592)) )
))
(declare-fun lt!124212 () tuple2!6854)

(declare-fun checkBitsLoop!0 (BitStream!2592 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6854)

(assert (=> d!24456 (= lt!124212 (checkBitsLoop!0 (_1!3556 lt!124188) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24456 (= (checkBitsLoopPure!0 (_1!3556 lt!124188) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6843 (_2!3561 lt!124212) (_1!3561 lt!124212)))))

(declare-fun bs!5925 () Bool)

(assert (= bs!5925 d!24456))

(declare-fun m!123027 () Bool)

(assert (=> bs!5925 m!123027))

(assert (=> b!77473 d!24456))

(declare-fun d!24464 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24464 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090))) nBits!322))))

(declare-fun bs!5926 () Bool)

(assert (= bs!5926 d!24464))

(declare-fun m!123029 () Bool)

(assert (=> bs!5926 m!123029))

(assert (=> b!77473 d!24464))

(declare-fun d!24466 () Bool)

(assert (=> d!24466 (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322)))

(declare-fun lt!124218 () Unit!5112)

(declare-fun choose!9 (BitStream!2592 array!3247 (_ BitVec 64) BitStream!2592) Unit!5112)

(assert (=> d!24466 (= lt!124218 (choose!9 thiss!1090 (buf!1902 (_2!3557 lt!124190)) nBits!322 (BitStream!2593 (buf!1902 (_2!3557 lt!124190)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090))))))

(assert (=> d!24466 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1902 (_2!3557 lt!124190)) nBits!322) lt!124218)))

(declare-fun bs!5929 () Bool)

(assert (= bs!5929 d!24466))

(assert (=> bs!5929 m!122981))

(declare-fun m!123035 () Bool)

(assert (=> bs!5929 m!123035))

(assert (=> b!77473 d!24466))

(declare-fun b!77532 () Bool)

(declare-fun res!64068 () Bool)

(declare-fun e!50833 () Bool)

(assert (=> b!77532 (=> (not res!64068) (not e!50833))))

(declare-fun lt!124332 () tuple2!6844)

(assert (=> b!77532 (= res!64068 (isPrefixOf!0 (_1!3556 lt!124332) thiss!1090))))

(declare-fun lt!124337 () (_ BitVec 64))

(declare-fun lt!124325 () (_ BitVec 64))

(declare-fun b!77533 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2592 (_ BitVec 64)) BitStream!2592)

(assert (=> b!77533 (= e!50833 (= (_1!3556 lt!124332) (withMovedBitIndex!0 (_2!3556 lt!124332) (bvsub lt!124337 lt!124325))))))

(assert (=> b!77533 (or (= (bvand lt!124337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124337 lt!124325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77533 (= lt!124325 (bitIndex!0 (size!1509 (buf!1902 (_2!3557 lt!124190))) (currentByte!3716 (_2!3557 lt!124190)) (currentBit!3711 (_2!3557 lt!124190))))))

(assert (=> b!77533 (= lt!124337 (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)))))

(declare-fun b!77534 () Bool)

(declare-fun e!50832 () Unit!5112)

(declare-fun Unit!5116 () Unit!5112)

(assert (=> b!77534 (= e!50832 Unit!5116)))

(declare-fun b!77535 () Bool)

(declare-fun res!64069 () Bool)

(assert (=> b!77535 (=> (not res!64069) (not e!50833))))

(assert (=> b!77535 (= res!64069 (isPrefixOf!0 (_2!3556 lt!124332) (_2!3557 lt!124190)))))

(declare-fun d!24474 () Bool)

(assert (=> d!24474 e!50833))

(declare-fun res!64067 () Bool)

(assert (=> d!24474 (=> (not res!64067) (not e!50833))))

(assert (=> d!24474 (= res!64067 (isPrefixOf!0 (_1!3556 lt!124332) (_2!3556 lt!124332)))))

(declare-fun lt!124320 () BitStream!2592)

(assert (=> d!24474 (= lt!124332 (tuple2!6845 lt!124320 (_2!3557 lt!124190)))))

(declare-fun lt!124335 () Unit!5112)

(declare-fun lt!124338 () Unit!5112)

(assert (=> d!24474 (= lt!124335 lt!124338)))

(assert (=> d!24474 (isPrefixOf!0 lt!124320 (_2!3557 lt!124190))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2592 BitStream!2592 BitStream!2592) Unit!5112)

(assert (=> d!24474 (= lt!124338 (lemmaIsPrefixTransitive!0 lt!124320 (_2!3557 lt!124190) (_2!3557 lt!124190)))))

(declare-fun lt!124334 () Unit!5112)

(declare-fun lt!124324 () Unit!5112)

(assert (=> d!24474 (= lt!124334 lt!124324)))

(assert (=> d!24474 (isPrefixOf!0 lt!124320 (_2!3557 lt!124190))))

(assert (=> d!24474 (= lt!124324 (lemmaIsPrefixTransitive!0 lt!124320 thiss!1090 (_2!3557 lt!124190)))))

(declare-fun lt!124329 () Unit!5112)

(assert (=> d!24474 (= lt!124329 e!50832)))

(declare-fun c!5608 () Bool)

(assert (=> d!24474 (= c!5608 (not (= (size!1509 (buf!1902 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124322 () Unit!5112)

(declare-fun lt!124330 () Unit!5112)

(assert (=> d!24474 (= lt!124322 lt!124330)))

(assert (=> d!24474 (isPrefixOf!0 (_2!3557 lt!124190) (_2!3557 lt!124190))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2592) Unit!5112)

(assert (=> d!24474 (= lt!124330 (lemmaIsPrefixRefl!0 (_2!3557 lt!124190)))))

(declare-fun lt!124321 () Unit!5112)

(declare-fun lt!124339 () Unit!5112)

(assert (=> d!24474 (= lt!124321 lt!124339)))

(assert (=> d!24474 (= lt!124339 (lemmaIsPrefixRefl!0 (_2!3557 lt!124190)))))

(declare-fun lt!124323 () Unit!5112)

(declare-fun lt!124328 () Unit!5112)

(assert (=> d!24474 (= lt!124323 lt!124328)))

(assert (=> d!24474 (isPrefixOf!0 lt!124320 lt!124320)))

(assert (=> d!24474 (= lt!124328 (lemmaIsPrefixRefl!0 lt!124320))))

(declare-fun lt!124333 () Unit!5112)

(declare-fun lt!124327 () Unit!5112)

(assert (=> d!24474 (= lt!124333 lt!124327)))

(assert (=> d!24474 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24474 (= lt!124327 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24474 (= lt!124320 (BitStream!2593 (buf!1902 (_2!3557 lt!124190)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)))))

(assert (=> d!24474 (isPrefixOf!0 thiss!1090 (_2!3557 lt!124190))))

(assert (=> d!24474 (= (reader!0 thiss!1090 (_2!3557 lt!124190)) lt!124332)))

(declare-fun b!77536 () Bool)

(declare-fun lt!124336 () Unit!5112)

(assert (=> b!77536 (= e!50832 lt!124336)))

(declare-fun lt!124326 () (_ BitVec 64))

(assert (=> b!77536 (= lt!124326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124331 () (_ BitVec 64))

(assert (=> b!77536 (= lt!124331 (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3247 array!3247 (_ BitVec 64) (_ BitVec 64)) Unit!5112)

(assert (=> b!77536 (= lt!124336 (arrayBitRangesEqSymmetric!0 (buf!1902 thiss!1090) (buf!1902 (_2!3557 lt!124190)) lt!124326 lt!124331))))

(declare-fun arrayBitRangesEq!0 (array!3247 array!3247 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77536 (arrayBitRangesEq!0 (buf!1902 (_2!3557 lt!124190)) (buf!1902 thiss!1090) lt!124326 lt!124331)))

(assert (= (and d!24474 c!5608) b!77536))

(assert (= (and d!24474 (not c!5608)) b!77534))

(assert (= (and d!24474 res!64067) b!77532))

(assert (= (and b!77532 res!64068) b!77535))

(assert (= (and b!77535 res!64069) b!77533))

(declare-fun m!123045 () Bool)

(assert (=> b!77533 m!123045))

(assert (=> b!77533 m!122993))

(assert (=> b!77533 m!122989))

(assert (=> b!77536 m!122989))

(declare-fun m!123047 () Bool)

(assert (=> b!77536 m!123047))

(declare-fun m!123049 () Bool)

(assert (=> b!77536 m!123049))

(declare-fun m!123051 () Bool)

(assert (=> d!24474 m!123051))

(declare-fun m!123053 () Bool)

(assert (=> d!24474 m!123053))

(declare-fun m!123055 () Bool)

(assert (=> d!24474 m!123055))

(declare-fun m!123057 () Bool)

(assert (=> d!24474 m!123057))

(declare-fun m!123059 () Bool)

(assert (=> d!24474 m!123059))

(declare-fun m!123061 () Bool)

(assert (=> d!24474 m!123061))

(assert (=> d!24474 m!122997))

(declare-fun m!123063 () Bool)

(assert (=> d!24474 m!123063))

(declare-fun m!123065 () Bool)

(assert (=> d!24474 m!123065))

(declare-fun m!123067 () Bool)

(assert (=> d!24474 m!123067))

(declare-fun m!123069 () Bool)

(assert (=> d!24474 m!123069))

(declare-fun m!123071 () Bool)

(assert (=> b!77535 m!123071))

(declare-fun m!123073 () Bool)

(assert (=> b!77532 m!123073))

(assert (=> b!77473 d!24474))

(declare-fun d!24486 () Bool)

(declare-fun e!50844 () Bool)

(assert (=> d!24486 e!50844))

(declare-fun res!64087 () Bool)

(assert (=> d!24486 (=> (not res!64087) (not e!50844))))

(declare-fun lt!124374 () (_ BitVec 64))

(declare-fun lt!124373 () (_ BitVec 64))

(declare-fun lt!124372 () (_ BitVec 64))

(assert (=> d!24486 (= res!64087 (= lt!124374 (bvsub lt!124373 lt!124372)))))

(assert (=> d!24486 (or (= (bvand lt!124373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124373 lt!124372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24486 (= lt!124372 (remainingBits!0 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090))))))

(declare-fun lt!124377 () (_ BitVec 64))

(declare-fun lt!124376 () (_ BitVec 64))

(assert (=> d!24486 (= lt!124373 (bvmul lt!124377 lt!124376))))

(assert (=> d!24486 (or (= lt!124377 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124376 (bvsdiv (bvmul lt!124377 lt!124376) lt!124377)))))

(assert (=> d!24486 (= lt!124376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24486 (= lt!124377 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))))))

(assert (=> d!24486 (= lt!124374 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3716 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3711 thiss!1090))))))

(assert (=> d!24486 (invariant!0 (currentBit!3711 thiss!1090) (currentByte!3716 thiss!1090) (size!1509 (buf!1902 thiss!1090)))))

(assert (=> d!24486 (= (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)) lt!124374)))

(declare-fun b!77555 () Bool)

(declare-fun res!64086 () Bool)

(assert (=> b!77555 (=> (not res!64086) (not e!50844))))

(assert (=> b!77555 (= res!64086 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124374))))

(declare-fun b!77556 () Bool)

(declare-fun lt!124375 () (_ BitVec 64))

(assert (=> b!77556 (= e!50844 (bvsle lt!124374 (bvmul lt!124375 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77556 (or (= lt!124375 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124375 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124375)))))

(assert (=> b!77556 (= lt!124375 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))))))

(assert (= (and d!24486 res!64087) b!77555))

(assert (= (and b!77555 res!64086) b!77556))

(declare-fun m!123107 () Bool)

(assert (=> d!24486 m!123107))

(assert (=> d!24486 m!123023))

(assert (=> b!77478 d!24486))

(declare-fun b!77586 () Bool)

(declare-fun res!64117 () Bool)

(declare-fun e!50859 () Bool)

(assert (=> b!77586 (=> (not res!64117) (not e!50859))))

(declare-fun lt!124443 () tuple2!6846)

(assert (=> b!77586 (= res!64117 (isPrefixOf!0 thiss!1090 (_2!3557 lt!124443)))))

(declare-fun b!77588 () Bool)

(declare-fun e!50860 () Bool)

(assert (=> b!77588 (= e!50860 (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322))))

(declare-fun b!77587 () Bool)

(declare-fun lt!124440 () tuple2!6842)

(declare-fun lt!124438 () tuple2!6844)

(assert (=> b!77587 (= e!50859 (and (_2!3555 lt!124440) (= (_1!3555 lt!124440) (_2!3556 lt!124438))))))

(assert (=> b!77587 (= lt!124440 (checkBitsLoopPure!0 (_1!3556 lt!124438) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124441 () Unit!5112)

(declare-fun lt!124439 () Unit!5112)

(assert (=> b!77587 (= lt!124441 lt!124439)))

(assert (=> b!77587 (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124443)))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322)))

(assert (=> b!77587 (= lt!124439 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1902 (_2!3557 lt!124443)) nBits!322))))

(assert (=> b!77587 e!50860))

(declare-fun res!64116 () Bool)

(assert (=> b!77587 (=> (not res!64116) (not e!50860))))

(assert (=> b!77587 (= res!64116 (and (= (size!1509 (buf!1902 thiss!1090)) (size!1509 (buf!1902 (_2!3557 lt!124443)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77587 (= lt!124438 (reader!0 thiss!1090 (_2!3557 lt!124443)))))

(declare-fun b!77585 () Bool)

(declare-fun res!64119 () Bool)

(assert (=> b!77585 (=> (not res!64119) (not e!50859))))

(declare-fun lt!124442 () (_ BitVec 64))

(assert (=> b!77585 (= res!64119 (= (bitIndex!0 (size!1509 (buf!1902 (_2!3557 lt!124443))) (currentByte!3716 (_2!3557 lt!124443)) (currentBit!3711 (_2!3557 lt!124443))) (bvadd lt!124442 nBits!322)))))

(assert (=> b!77585 (or (not (= (bvand lt!124442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124442 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77585 (= lt!124442 (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)))))

(declare-fun d!24492 () Bool)

(assert (=> d!24492 e!50859))

(declare-fun res!64118 () Bool)

(assert (=> d!24492 (=> (not res!64118) (not e!50859))))

(assert (=> d!24492 (= res!64118 (= (size!1509 (buf!1902 thiss!1090)) (size!1509 (buf!1902 (_2!3557 lt!124443)))))))

(declare-fun choose!36 (BitStream!2592 (_ BitVec 64) Bool) tuple2!6846)

(assert (=> d!24492 (= lt!124443 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24492 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124443)))

(assert (= (and d!24492 res!64118) b!77585))

(assert (= (and b!77585 res!64119) b!77586))

(assert (= (and b!77586 res!64117) b!77587))

(assert (= (and b!77587 res!64116) b!77588))

(declare-fun m!123135 () Bool)

(assert (=> d!24492 m!123135))

(assert (=> b!77588 m!122995))

(declare-fun m!123137 () Bool)

(assert (=> b!77585 m!123137))

(assert (=> b!77585 m!122989))

(declare-fun m!123139 () Bool)

(assert (=> b!77587 m!123139))

(declare-fun m!123141 () Bool)

(assert (=> b!77587 m!123141))

(declare-fun m!123143 () Bool)

(assert (=> b!77587 m!123143))

(declare-fun m!123145 () Bool)

(assert (=> b!77587 m!123145))

(declare-fun m!123147 () Bool)

(assert (=> b!77586 m!123147))

(assert (=> b!77478 d!24492))

(declare-fun d!24506 () Bool)

(assert (=> d!24506 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1509 (buf!1902 thiss!1090))) ((_ sign_extend 32) (currentByte!3716 thiss!1090)) ((_ sign_extend 32) (currentBit!3711 thiss!1090))) nBits!322))))

(declare-fun bs!5936 () Bool)

(assert (= bs!5936 d!24506))

(assert (=> bs!5936 m!123107))

(assert (=> b!77477 d!24506))

(declare-fun d!24508 () Bool)

(declare-fun e!50861 () Bool)

(assert (=> d!24508 e!50861))

(declare-fun res!64121 () Bool)

(assert (=> d!24508 (=> (not res!64121) (not e!50861))))

(declare-fun lt!124445 () (_ BitVec 64))

(declare-fun lt!124444 () (_ BitVec 64))

(declare-fun lt!124446 () (_ BitVec 64))

(assert (=> d!24508 (= res!64121 (= lt!124446 (bvsub lt!124445 lt!124444)))))

(assert (=> d!24508 (or (= (bvand lt!124445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124445 lt!124444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24508 (= lt!124444 (remainingBits!0 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))) ((_ sign_extend 32) (currentByte!3716 (_2!3557 lt!124190))) ((_ sign_extend 32) (currentBit!3711 (_2!3557 lt!124190)))))))

(declare-fun lt!124449 () (_ BitVec 64))

(declare-fun lt!124448 () (_ BitVec 64))

(assert (=> d!24508 (= lt!124445 (bvmul lt!124449 lt!124448))))

(assert (=> d!24508 (or (= lt!124449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124448 (bvsdiv (bvmul lt!124449 lt!124448) lt!124449)))))

(assert (=> d!24508 (= lt!124448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24508 (= lt!124449 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))))))

(assert (=> d!24508 (= lt!124446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3716 (_2!3557 lt!124190))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3711 (_2!3557 lt!124190)))))))

(assert (=> d!24508 (invariant!0 (currentBit!3711 (_2!3557 lt!124190)) (currentByte!3716 (_2!3557 lt!124190)) (size!1509 (buf!1902 (_2!3557 lt!124190))))))

(assert (=> d!24508 (= (bitIndex!0 (size!1509 (buf!1902 (_2!3557 lt!124190))) (currentByte!3716 (_2!3557 lt!124190)) (currentBit!3711 (_2!3557 lt!124190))) lt!124446)))

(declare-fun b!77589 () Bool)

(declare-fun res!64120 () Bool)

(assert (=> b!77589 (=> (not res!64120) (not e!50861))))

(assert (=> b!77589 (= res!64120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124446))))

(declare-fun b!77590 () Bool)

(declare-fun lt!124447 () (_ BitVec 64))

(assert (=> b!77590 (= e!50861 (bvsle lt!124446 (bvmul lt!124447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77590 (or (= lt!124447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124447)))))

(assert (=> b!77590 (= lt!124447 ((_ sign_extend 32) (size!1509 (buf!1902 (_2!3557 lt!124190)))))))

(assert (= (and d!24508 res!64121) b!77589))

(assert (= (and b!77589 res!64120) b!77590))

(declare-fun m!123149 () Bool)

(assert (=> d!24508 m!123149))

(declare-fun m!123151 () Bool)

(assert (=> d!24508 m!123151))

(assert (=> b!77476 d!24508))

(assert (=> b!77476 d!24486))

(declare-fun d!24510 () Bool)

(declare-fun res!64141 () Bool)

(declare-fun e!50873 () Bool)

(assert (=> d!24510 (=> (not res!64141) (not e!50873))))

(assert (=> d!24510 (= res!64141 (= (size!1509 (buf!1902 thiss!1090)) (size!1509 (buf!1902 (_2!3557 lt!124190)))))))

(assert (=> d!24510 (= (isPrefixOf!0 thiss!1090 (_2!3557 lt!124190)) e!50873)))

(declare-fun b!77609 () Bool)

(declare-fun res!64142 () Bool)

(assert (=> b!77609 (=> (not res!64142) (not e!50873))))

(assert (=> b!77609 (= res!64142 (bvsle (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090)) (bitIndex!0 (size!1509 (buf!1902 (_2!3557 lt!124190))) (currentByte!3716 (_2!3557 lt!124190)) (currentBit!3711 (_2!3557 lt!124190)))))))

(declare-fun b!77610 () Bool)

(declare-fun e!50872 () Bool)

(assert (=> b!77610 (= e!50873 e!50872)))

(declare-fun res!64140 () Bool)

(assert (=> b!77610 (=> res!64140 e!50872)))

(assert (=> b!77610 (= res!64140 (= (size!1509 (buf!1902 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77611 () Bool)

(assert (=> b!77611 (= e!50872 (arrayBitRangesEq!0 (buf!1902 thiss!1090) (buf!1902 (_2!3557 lt!124190)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1509 (buf!1902 thiss!1090)) (currentByte!3716 thiss!1090) (currentBit!3711 thiss!1090))))))

(assert (= (and d!24510 res!64141) b!77609))

(assert (= (and b!77609 res!64142) b!77610))

(assert (= (and b!77610 (not res!64140)) b!77611))

(assert (=> b!77609 m!122989))

(assert (=> b!77609 m!122993))

(assert (=> b!77611 m!122989))

(assert (=> b!77611 m!122989))

(declare-fun m!123153 () Bool)

(assert (=> b!77611 m!123153))

(assert (=> b!77475 d!24510))

(declare-fun d!24512 () Bool)

(assert (=> d!24512 (= (array_inv!1355 (buf!1902 thiss!1090)) (bvsge (size!1509 (buf!1902 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77474 d!24512))

(check-sat (not d!24486) (not d!24454) (not d!24508) (not d!24456) (not b!77586) (not d!24506) (not b!77535) (not b!77588) (not b!77533) (not b!77536) (not d!24466) (not d!24474) (not d!24464) (not b!77611) (not b!77587) (not b!77609) (not d!24492) (not b!77532) (not b!77585))
