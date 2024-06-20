; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40658 () Bool)

(assert start!40658)

(declare-fun b!186964 () Bool)

(declare-fun res!155688 () Bool)

(declare-fun e!129327 () Bool)

(assert (=> b!186964 (=> (not res!155688) (not e!129327))))

(declare-datatypes ((array!9834 0))(
  ( (array!9835 (arr!5266 (Array (_ BitVec 32) (_ BitVec 8))) (size!4336 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7780 0))(
  ( (BitStream!7781 (buf!4802 array!9834) (currentByte!9058 (_ BitVec 32)) (currentBit!9053 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16164 0))(
  ( (tuple2!16165 (_1!8727 BitStream!7780) (_2!8727 BitStream!7780)) )
))
(declare-fun lt!289308 () tuple2!16164)

(declare-fun lt!289298 () (_ BitVec 64))

(declare-fun lt!289292 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7780 (_ BitVec 64)) BitStream!7780)

(assert (=> b!186964 (= res!155688 (= (_1!8727 lt!289308) (withMovedBitIndex!0 (_2!8727 lt!289308) (bvsub lt!289298 lt!289292))))))

(declare-fun b!186965 () Bool)

(declare-fun e!129323 () Bool)

(declare-fun e!129316 () Bool)

(assert (=> b!186965 (= e!129323 e!129316)))

(declare-fun res!155701 () Bool)

(assert (=> b!186965 (=> (not res!155701) (not e!129316))))

(declare-fun thiss!1204 () BitStream!7780)

(declare-fun lt!289309 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186965 (= res!155701 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)) lt!289309))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!186965 (= lt!289309 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!155697 () Bool)

(assert (=> start!40658 (=> (not res!155697) (not e!129323))))

(assert (=> start!40658 (= res!155697 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40658 e!129323))

(assert (=> start!40658 true))

(declare-fun e!129320 () Bool)

(declare-fun inv!12 (BitStream!7780) Bool)

(assert (=> start!40658 (and (inv!12 thiss!1204) e!129320)))

(declare-fun b!186966 () Bool)

(declare-fun e!129321 () Bool)

(declare-fun lt!289287 () tuple2!16164)

(declare-fun moveBitIndexPrecond!0 (BitStream!7780 (_ BitVec 64)) Bool)

(assert (=> b!186966 (= e!129321 (moveBitIndexPrecond!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!186966 e!129327))

(declare-fun res!155703 () Bool)

(assert (=> b!186966 (=> (not res!155703) (not e!129327))))

(declare-datatypes ((tuple2!16166 0))(
  ( (tuple2!16167 (_1!8728 BitStream!7780) (_2!8728 (_ BitVec 64))) )
))
(declare-fun lt!289303 () tuple2!16166)

(declare-fun lt!289311 () tuple2!16166)

(assert (=> b!186966 (= res!155703 (and (= (_2!8728 lt!289303) (_2!8728 lt!289311)) (= (_1!8728 lt!289303) (_1!8728 lt!289311))))))

(declare-fun lt!289299 () (_ BitVec 64))

(declare-datatypes ((Unit!13367 0))(
  ( (Unit!13368) )
))
(declare-fun lt!289300 () Unit!13367)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13367)

(assert (=> b!186966 (= lt!289300 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299))))

(declare-fun lt!289290 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16166)

(assert (=> b!186966 (= lt!289311 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290))))

(declare-fun b!186967 () Bool)

(declare-fun e!129317 () Bool)

(assert (=> b!186967 (= e!129316 (not e!129317))))

(declare-fun res!155687 () Bool)

(assert (=> b!186967 (=> res!155687 e!129317)))

(declare-fun lt!289301 () (_ BitVec 64))

(assert (=> b!186967 (= res!155687 (not (= lt!289298 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289301))))))

(declare-datatypes ((tuple2!16168 0))(
  ( (tuple2!16169 (_1!8729 Unit!13367) (_2!8729 BitStream!7780)) )
))
(declare-fun lt!289289 () tuple2!16168)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186967 (= lt!289298 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(assert (=> b!186967 (= lt!289301 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun e!129322 () Bool)

(assert (=> b!186967 e!129322))

(declare-fun res!155689 () Bool)

(assert (=> b!186967 (=> (not res!155689) (not e!129322))))

(assert (=> b!186967 (= res!155689 (= (size!4336 (buf!4802 thiss!1204)) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(declare-fun lt!289306 () Bool)

(declare-fun appendBit!0 (BitStream!7780 Bool) tuple2!16168)

(assert (=> b!186967 (= lt!289289 (appendBit!0 thiss!1204 lt!289306))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!289312 () (_ BitVec 64))

(assert (=> b!186967 (= lt!289306 (not (= (bvand v!189 lt!289312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186967 (= lt!289312 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186968 () Bool)

(declare-fun res!155704 () Bool)

(assert (=> b!186968 (=> (not res!155704) (not e!129316))))

(assert (=> b!186968 (= res!155704 (not (= i!590 nBits!348)))))

(declare-fun b!186969 () Bool)

(declare-fun res!155702 () Bool)

(declare-fun e!129324 () Bool)

(assert (=> b!186969 (=> res!155702 e!129324)))

(declare-fun lt!289297 () tuple2!16168)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186969 (= res!155702 (not (invariant!0 (currentBit!9053 (_2!8729 lt!289297)) (currentByte!9058 (_2!8729 lt!289297)) (size!4336 (buf!4802 (_2!8729 lt!289297))))))))

(declare-fun b!186970 () Bool)

(assert (=> b!186970 (= e!129324 e!129321)))

(declare-fun res!155692 () Bool)

(assert (=> b!186970 (=> res!155692 e!129321)))

(assert (=> b!186970 (= res!155692 (not (= (_1!8728 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289308) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290)) (_2!8727 lt!289308))))))

(declare-fun lt!289302 () (_ BitVec 64))

(assert (=> b!186970 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!289302)))

(declare-fun lt!289307 () Unit!13367)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7780 array!9834 (_ BitVec 64)) Unit!13367)

(assert (=> b!186970 (= lt!289307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!289297)) lt!289302))))

(assert (=> b!186970 (= lt!289302 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16170 0))(
  ( (tuple2!16171 (_1!8730 BitStream!7780) (_2!8730 Bool)) )
))
(declare-fun lt!289295 () tuple2!16170)

(assert (=> b!186970 (= lt!289290 (bvor lt!289299 (ite (_2!8730 lt!289295) lt!289312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186970 (= lt!289303 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299))))

(assert (=> b!186970 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)) lt!289309)))

(declare-fun lt!289305 () Unit!13367)

(assert (=> b!186970 (= lt!289305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4802 (_2!8729 lt!289297)) lt!289309))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186970 (= lt!289299 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!186970 (= (_2!8730 lt!289295) lt!289306)))

(declare-fun readBitPure!0 (BitStream!7780) tuple2!16170)

(assert (=> b!186970 (= lt!289295 (readBitPure!0 (_1!8727 lt!289287)))))

(declare-fun reader!0 (BitStream!7780 BitStream!7780) tuple2!16164)

(assert (=> b!186970 (= lt!289308 (reader!0 (_2!8729 lt!289289) (_2!8729 lt!289297)))))

(assert (=> b!186970 (= lt!289287 (reader!0 thiss!1204 (_2!8729 lt!289297)))))

(declare-fun e!129318 () Bool)

(assert (=> b!186970 e!129318))

(declare-fun res!155686 () Bool)

(assert (=> b!186970 (=> (not res!155686) (not e!129318))))

(declare-fun lt!289296 () tuple2!16170)

(declare-fun lt!289310 () tuple2!16170)

(assert (=> b!186970 (= res!155686 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289296))) (currentByte!9058 (_1!8730 lt!289296)) (currentBit!9053 (_1!8730 lt!289296))) (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289310))) (currentByte!9058 (_1!8730 lt!289310)) (currentBit!9053 (_1!8730 lt!289310)))))))

(declare-fun lt!289293 () Unit!13367)

(declare-fun lt!289286 () BitStream!7780)

(declare-fun readBitPrefixLemma!0 (BitStream!7780 BitStream!7780) Unit!13367)

(assert (=> b!186970 (= lt!289293 (readBitPrefixLemma!0 lt!289286 (_2!8729 lt!289297)))))

(assert (=> b!186970 (= lt!289310 (readBitPure!0 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))))))

(assert (=> b!186970 (= lt!289296 (readBitPure!0 lt!289286))))

(declare-fun e!129325 () Bool)

(assert (=> b!186970 e!129325))

(declare-fun res!155700 () Bool)

(assert (=> b!186970 (=> (not res!155700) (not e!129325))))

(assert (=> b!186970 (= res!155700 (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (=> b!186970 (= lt!289286 (BitStream!7781 (buf!4802 (_2!8729 lt!289289)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun b!186971 () Bool)

(declare-fun res!155695 () Bool)

(assert (=> b!186971 (=> (not res!155695) (not e!129327))))

(assert (=> b!186971 (= res!155695 (= (_1!8727 lt!289287) (withMovedBitIndex!0 (_2!8727 lt!289287) (bvsub lt!289301 lt!289292))))))

(declare-fun b!186972 () Bool)

(assert (=> b!186972 (= e!129317 e!129324)))

(declare-fun res!155693 () Bool)

(assert (=> b!186972 (=> res!155693 e!129324)))

(assert (=> b!186972 (= res!155693 (not (= lt!289292 (bvsub (bvsub (bvadd lt!289298 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186972 (= lt!289292 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297))))))

(declare-fun isPrefixOf!0 (BitStream!7780 BitStream!7780) Bool)

(assert (=> b!186972 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289297))))

(declare-fun lt!289304 () Unit!13367)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7780 BitStream!7780 BitStream!7780) Unit!13367)

(assert (=> b!186972 (= lt!289304 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8729 lt!289289) (_2!8729 lt!289297)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7780 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16168)

(assert (=> b!186972 (= lt!289297 (appendBitsLSBFirstLoopTR!0 (_2!8729 lt!289289) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186973 () Bool)

(declare-fun e!129326 () Bool)

(declare-fun lt!289294 () tuple2!16170)

(declare-fun lt!289288 () (_ BitVec 64))

(assert (=> b!186973 (= e!129326 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289294))) (currentByte!9058 (_1!8730 lt!289294)) (currentBit!9053 (_1!8730 lt!289294))) lt!289288))))

(declare-fun b!186974 () Bool)

(declare-fun array_inv!4077 (array!9834) Bool)

(assert (=> b!186974 (= e!129320 (array_inv!4077 (buf!4802 thiss!1204)))))

(declare-fun b!186975 () Bool)

(assert (=> b!186975 (= e!129325 (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289297)))))))

(declare-fun b!186976 () Bool)

(assert (=> b!186976 (= e!129318 (= (_2!8730 lt!289296) (_2!8730 lt!289310)))))

(declare-fun b!186977 () Bool)

(declare-fun res!155696 () Bool)

(assert (=> b!186977 (=> res!155696 e!129324)))

(assert (=> b!186977 (= res!155696 (not (isPrefixOf!0 thiss!1204 (_2!8729 lt!289289))))))

(declare-fun b!186978 () Bool)

(declare-fun res!155694 () Bool)

(declare-fun e!129315 () Bool)

(assert (=> b!186978 (=> (not res!155694) (not e!129315))))

(assert (=> b!186978 (= res!155694 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289289)))))

(declare-fun b!186979 () Bool)

(assert (=> b!186979 (= e!129315 e!129326)))

(declare-fun res!155685 () Bool)

(assert (=> b!186979 (=> (not res!155685) (not e!129326))))

(assert (=> b!186979 (= res!155685 (and (= (_2!8730 lt!289294) lt!289306) (= (_1!8730 lt!289294) (_2!8729 lt!289289))))))

(declare-fun readerFrom!0 (BitStream!7780 (_ BitVec 32) (_ BitVec 32)) BitStream!7780)

(assert (=> b!186979 (= lt!289294 (readBitPure!0 (readerFrom!0 (_2!8729 lt!289289) (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204))))))

(declare-fun b!186980 () Bool)

(declare-fun res!155698 () Bool)

(assert (=> b!186980 (=> res!155698 e!129324)))

(assert (=> b!186980 (= res!155698 (or (not (= (size!4336 (buf!4802 (_2!8729 lt!289297))) (size!4336 (buf!4802 thiss!1204)))) (not (= lt!289292 (bvsub (bvadd lt!289301 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186981 () Bool)

(declare-fun res!155690 () Bool)

(assert (=> b!186981 (=> (not res!155690) (not e!129316))))

(assert (=> b!186981 (= res!155690 (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204))))))

(declare-fun b!186982 () Bool)

(declare-fun res!155699 () Bool)

(assert (=> b!186982 (=> res!155699 e!129324)))

(assert (=> b!186982 (= res!155699 (not (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!289297))))))

(declare-fun b!186983 () Bool)

(assert (=> b!186983 (= e!129327 (= lt!289301 (bvsub lt!289298 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!186984 () Bool)

(assert (=> b!186984 (= e!129322 e!129315)))

(declare-fun res!155691 () Bool)

(assert (=> b!186984 (=> (not res!155691) (not e!129315))))

(declare-fun lt!289291 () (_ BitVec 64))

(assert (=> b!186984 (= res!155691 (= lt!289288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289291)))))

(assert (=> b!186984 (= lt!289288 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(assert (=> b!186984 (= lt!289291 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(assert (= (and start!40658 res!155697) b!186965))

(assert (= (and b!186965 res!155701) b!186981))

(assert (= (and b!186981 res!155690) b!186968))

(assert (= (and b!186968 res!155704) b!186967))

(assert (= (and b!186967 res!155689) b!186984))

(assert (= (and b!186984 res!155691) b!186978))

(assert (= (and b!186978 res!155694) b!186979))

(assert (= (and b!186979 res!155685) b!186973))

(assert (= (and b!186967 (not res!155687)) b!186972))

(assert (= (and b!186972 (not res!155693)) b!186969))

(assert (= (and b!186969 (not res!155702)) b!186980))

(assert (= (and b!186980 (not res!155698)) b!186982))

(assert (= (and b!186982 (not res!155699)) b!186977))

(assert (= (and b!186977 (not res!155696)) b!186970))

(assert (= (and b!186970 res!155700) b!186975))

(assert (= (and b!186970 res!155686) b!186976))

(assert (= (and b!186970 (not res!155692)) b!186966))

(assert (= (and b!186966 res!155703) b!186971))

(assert (= (and b!186971 res!155695) b!186964))

(assert (= (and b!186964 res!155688) b!186983))

(assert (= start!40658 b!186974))

(declare-fun m!290689 () Bool)

(assert (=> b!186966 m!290689))

(declare-fun m!290691 () Bool)

(assert (=> b!186966 m!290691))

(declare-fun m!290693 () Bool)

(assert (=> b!186966 m!290693))

(assert (=> b!186966 m!290693))

(declare-fun m!290695 () Bool)

(assert (=> b!186966 m!290695))

(declare-fun m!290697 () Bool)

(assert (=> b!186978 m!290697))

(declare-fun m!290699 () Bool)

(assert (=> b!186965 m!290699))

(declare-fun m!290701 () Bool)

(assert (=> b!186972 m!290701))

(declare-fun m!290703 () Bool)

(assert (=> b!186972 m!290703))

(declare-fun m!290705 () Bool)

(assert (=> b!186972 m!290705))

(declare-fun m!290707 () Bool)

(assert (=> b!186972 m!290707))

(assert (=> b!186977 m!290697))

(declare-fun m!290709 () Bool)

(assert (=> b!186981 m!290709))

(declare-fun m!290711 () Bool)

(assert (=> b!186975 m!290711))

(declare-fun m!290713 () Bool)

(assert (=> b!186982 m!290713))

(declare-fun m!290715 () Bool)

(assert (=> b!186971 m!290715))

(declare-fun m!290717 () Bool)

(assert (=> b!186979 m!290717))

(assert (=> b!186979 m!290717))

(declare-fun m!290719 () Bool)

(assert (=> b!186979 m!290719))

(declare-fun m!290721 () Bool)

(assert (=> b!186967 m!290721))

(declare-fun m!290723 () Bool)

(assert (=> b!186967 m!290723))

(declare-fun m!290725 () Bool)

(assert (=> b!186967 m!290725))

(declare-fun m!290727 () Bool)

(assert (=> start!40658 m!290727))

(declare-fun m!290729 () Bool)

(assert (=> b!186973 m!290729))

(declare-fun m!290731 () Bool)

(assert (=> b!186970 m!290731))

(declare-fun m!290733 () Bool)

(assert (=> b!186970 m!290733))

(declare-fun m!290735 () Bool)

(assert (=> b!186970 m!290735))

(declare-fun m!290737 () Bool)

(assert (=> b!186970 m!290737))

(declare-fun m!290739 () Bool)

(assert (=> b!186970 m!290739))

(declare-fun m!290741 () Bool)

(assert (=> b!186970 m!290741))

(declare-fun m!290743 () Bool)

(assert (=> b!186970 m!290743))

(declare-fun m!290745 () Bool)

(assert (=> b!186970 m!290745))

(declare-fun m!290747 () Bool)

(assert (=> b!186970 m!290747))

(declare-fun m!290749 () Bool)

(assert (=> b!186970 m!290749))

(declare-fun m!290751 () Bool)

(assert (=> b!186970 m!290751))

(declare-fun m!290753 () Bool)

(assert (=> b!186970 m!290753))

(declare-fun m!290755 () Bool)

(assert (=> b!186970 m!290755))

(declare-fun m!290757 () Bool)

(assert (=> b!186970 m!290757))

(declare-fun m!290759 () Bool)

(assert (=> b!186970 m!290759))

(declare-fun m!290761 () Bool)

(assert (=> b!186970 m!290761))

(declare-fun m!290763 () Bool)

(assert (=> b!186969 m!290763))

(assert (=> b!186984 m!290721))

(assert (=> b!186984 m!290723))

(declare-fun m!290765 () Bool)

(assert (=> b!186964 m!290765))

(declare-fun m!290767 () Bool)

(assert (=> b!186974 m!290767))

(push 1)

(assert (not b!186977))

(assert (not b!186978))

(assert (not b!186981))

(assert (not b!186967))

(assert (not b!186975))

(assert (not b!186973))

(assert (not b!186979))

(assert (not b!186982))

(assert (not b!186974))

(assert (not b!186964))

(assert (not b!186969))

(assert (not b!186972))

(assert (not b!186971))

(assert (not b!186966))

(assert (not b!186970))

(assert (not b!186965))

(assert (not b!186984))

(assert (not start!40658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64491 () Bool)

(assert (=> d!64491 (= (array_inv!4077 (buf!4802 thiss!1204)) (bvsge (size!4336 (buf!4802 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!186974 d!64491))

(declare-fun d!64493 () Bool)

(declare-fun e!129408 () Bool)

(assert (=> d!64493 e!129408))

(declare-fun res!155829 () Bool)

(assert (=> d!64493 (=> (not res!155829) (not e!129408))))

(declare-fun lt!289489 () (_ BitVec 64))

(declare-fun lt!289488 () (_ BitVec 64))

(declare-fun lt!289492 () (_ BitVec 64))

(assert (=> d!64493 (= res!155829 (= lt!289488 (bvsub lt!289489 lt!289492)))))

(assert (=> d!64493 (or (= (bvand lt!289489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289489 lt!289492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64493 (= lt!289492 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289289)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289)))))))

(declare-fun lt!289487 () (_ BitVec 64))

(declare-fun lt!289491 () (_ BitVec 64))

(assert (=> d!64493 (= lt!289489 (bvmul lt!289487 lt!289491))))

(assert (=> d!64493 (or (= lt!289487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289491 (bvsdiv (bvmul lt!289487 lt!289491) lt!289487)))))

(assert (=> d!64493 (= lt!289491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64493 (= lt!289487 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (=> d!64493 (= lt!289488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289)))))))

(assert (=> d!64493 (invariant!0 (currentBit!9053 (_2!8729 lt!289289)) (currentByte!9058 (_2!8729 lt!289289)) (size!4336 (buf!4802 (_2!8729 lt!289289))))))

(assert (=> d!64493 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) lt!289488)))

(declare-fun b!187115 () Bool)

(declare-fun res!155830 () Bool)

(assert (=> b!187115 (=> (not res!155830) (not e!129408))))

(assert (=> b!187115 (= res!155830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289488))))

(declare-fun b!187116 () Bool)

(declare-fun lt!289490 () (_ BitVec 64))

(assert (=> b!187116 (= e!129408 (bvsle lt!289488 (bvmul lt!289490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187116 (or (= lt!289490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289490)))))

(assert (=> b!187116 (= lt!289490 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (= (and d!64493 res!155829) b!187115))

(assert (= (and b!187115 res!155830) b!187116))

(declare-fun m!290929 () Bool)

(assert (=> d!64493 m!290929))

(declare-fun m!290931 () Bool)

(assert (=> d!64493 m!290931))

(assert (=> b!186984 d!64493))

(declare-fun d!64495 () Bool)

(declare-fun e!129409 () Bool)

(assert (=> d!64495 e!129409))

(declare-fun res!155831 () Bool)

(assert (=> d!64495 (=> (not res!155831) (not e!129409))))

(declare-fun lt!289498 () (_ BitVec 64))

(declare-fun lt!289494 () (_ BitVec 64))

(declare-fun lt!289495 () (_ BitVec 64))

(assert (=> d!64495 (= res!155831 (= lt!289494 (bvsub lt!289495 lt!289498)))))

(assert (=> d!64495 (or (= (bvand lt!289495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289495 lt!289498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64495 (= lt!289498 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204))))))

(declare-fun lt!289493 () (_ BitVec 64))

(declare-fun lt!289497 () (_ BitVec 64))

(assert (=> d!64495 (= lt!289495 (bvmul lt!289493 lt!289497))))

(assert (=> d!64495 (or (= lt!289493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289497 (bvsdiv (bvmul lt!289493 lt!289497) lt!289493)))))

(assert (=> d!64495 (= lt!289497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64495 (= lt!289493 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))))))

(assert (=> d!64495 (= lt!289494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 thiss!1204))))))

(assert (=> d!64495 (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204)))))

(assert (=> d!64495 (= (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)) lt!289494)))

(declare-fun b!187117 () Bool)

(declare-fun res!155832 () Bool)

(assert (=> b!187117 (=> (not res!155832) (not e!129409))))

(assert (=> b!187117 (= res!155832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289494))))

(declare-fun b!187118 () Bool)

(declare-fun lt!289496 () (_ BitVec 64))

(assert (=> b!187118 (= e!129409 (bvsle lt!289494 (bvmul lt!289496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187118 (or (= lt!289496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289496)))))

(assert (=> b!187118 (= lt!289496 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))))))

(assert (= (and d!64495 res!155831) b!187117))

(assert (= (and b!187117 res!155832) b!187118))

(declare-fun m!290933 () Bool)

(assert (=> d!64495 m!290933))

(assert (=> d!64495 m!290709))

(assert (=> b!186984 d!64495))

(declare-fun d!64497 () Bool)

(declare-fun e!129410 () Bool)

(assert (=> d!64497 e!129410))

(declare-fun res!155833 () Bool)

(assert (=> d!64497 (=> (not res!155833) (not e!129410))))

(declare-fun lt!289501 () (_ BitVec 64))

(declare-fun lt!289504 () (_ BitVec 64))

(declare-fun lt!289500 () (_ BitVec 64))

(assert (=> d!64497 (= res!155833 (= lt!289500 (bvsub lt!289501 lt!289504)))))

(assert (=> d!64497 (or (= (bvand lt!289501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289501 lt!289504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64497 (= lt!289504 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289294)))) ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289294))) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289294)))))))

(declare-fun lt!289499 () (_ BitVec 64))

(declare-fun lt!289503 () (_ BitVec 64))

(assert (=> d!64497 (= lt!289501 (bvmul lt!289499 lt!289503))))

(assert (=> d!64497 (or (= lt!289499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289503 (bvsdiv (bvmul lt!289499 lt!289503) lt!289499)))))

(assert (=> d!64497 (= lt!289503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64497 (= lt!289499 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289294)))))))

(assert (=> d!64497 (= lt!289500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289294))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289294)))))))

(assert (=> d!64497 (invariant!0 (currentBit!9053 (_1!8730 lt!289294)) (currentByte!9058 (_1!8730 lt!289294)) (size!4336 (buf!4802 (_1!8730 lt!289294))))))

(assert (=> d!64497 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289294))) (currentByte!9058 (_1!8730 lt!289294)) (currentBit!9053 (_1!8730 lt!289294))) lt!289500)))

(declare-fun b!187119 () Bool)

(declare-fun res!155834 () Bool)

(assert (=> b!187119 (=> (not res!155834) (not e!129410))))

(assert (=> b!187119 (= res!155834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289500))))

(declare-fun b!187120 () Bool)

(declare-fun lt!289502 () (_ BitVec 64))

(assert (=> b!187120 (= e!129410 (bvsle lt!289500 (bvmul lt!289502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187120 (or (= lt!289502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289502)))))

(assert (=> b!187120 (= lt!289502 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289294)))))))

(assert (= (and d!64497 res!155833) b!187119))

(assert (= (and b!187119 res!155834) b!187120))

(declare-fun m!290935 () Bool)

(assert (=> d!64497 m!290935))

(declare-fun m!290937 () Bool)

(assert (=> d!64497 m!290937))

(assert (=> b!186973 d!64497))

(declare-fun d!64499 () Bool)

(assert (=> d!64499 (= (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289297)))) (and (bvsge (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9053 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9058 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289297)))) (and (= (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289297))))))))))

(assert (=> b!186975 d!64499))

(declare-fun d!64501 () Bool)

(declare-fun e!129413 () Bool)

(assert (=> d!64501 e!129413))

(declare-fun res!155837 () Bool)

(assert (=> d!64501 (=> (not res!155837) (not e!129413))))

(declare-fun lt!289510 () (_ BitVec 64))

(declare-fun lt!289509 () BitStream!7780)

(assert (=> d!64501 (= res!155837 (= (bvadd lt!289510 (bvsub lt!289298 lt!289292)) (bitIndex!0 (size!4336 (buf!4802 lt!289509)) (currentByte!9058 lt!289509) (currentBit!9053 lt!289509))))))

(assert (=> d!64501 (or (not (= (bvand lt!289510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289298 lt!289292) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289510 (bvsub lt!289298 lt!289292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64501 (= lt!289510 (bitIndex!0 (size!4336 (buf!4802 (_2!8727 lt!289308))) (currentByte!9058 (_2!8727 lt!289308)) (currentBit!9053 (_2!8727 lt!289308))))))

(declare-fun moveBitIndex!0 (BitStream!7780 (_ BitVec 64)) tuple2!16168)

(assert (=> d!64501 (= lt!289509 (_2!8729 (moveBitIndex!0 (_2!8727 lt!289308) (bvsub lt!289298 lt!289292))))))

(assert (=> d!64501 (moveBitIndexPrecond!0 (_2!8727 lt!289308) (bvsub lt!289298 lt!289292))))

(assert (=> d!64501 (= (withMovedBitIndex!0 (_2!8727 lt!289308) (bvsub lt!289298 lt!289292)) lt!289509)))

(declare-fun b!187123 () Bool)

(assert (=> b!187123 (= e!129413 (= (size!4336 (buf!4802 (_2!8727 lt!289308))) (size!4336 (buf!4802 lt!289509))))))

(assert (= (and d!64501 res!155837) b!187123))

(declare-fun m!290939 () Bool)

(assert (=> d!64501 m!290939))

(declare-fun m!290941 () Bool)

(assert (=> d!64501 m!290941))

(declare-fun m!290943 () Bool)

(assert (=> d!64501 m!290943))

(declare-fun m!290945 () Bool)

(assert (=> d!64501 m!290945))

(assert (=> b!186964 d!64501))

(declare-fun d!64503 () Bool)

(declare-fun res!155840 () Bool)

(declare-fun e!129416 () Bool)

(assert (=> d!64503 (=> (not res!155840) (not e!129416))))

(assert (=> d!64503 (= res!155840 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8727 lt!289287))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8727 lt!289287))))))))))

(assert (=> d!64503 (= (moveBitIndexPrecond!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001) e!129416)))

(declare-fun b!187127 () Bool)

(declare-fun lt!289513 () (_ BitVec 64))

(assert (=> b!187127 (= e!129416 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289513) (bvsle lt!289513 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8727 lt!289287))))))))))

(assert (=> b!187127 (= lt!289513 (bvadd (bitIndex!0 (size!4336 (buf!4802 (_1!8727 lt!289287))) (currentByte!9058 (_1!8727 lt!289287)) (currentBit!9053 (_1!8727 lt!289287))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!64503 res!155840) b!187127))

(declare-fun m!290947 () Bool)

(assert (=> b!187127 m!290947))

(assert (=> b!186966 d!64503))

(declare-fun d!64505 () Bool)

(declare-fun lt!289531 () tuple2!16166)

(declare-fun lt!289528 () tuple2!16166)

(assert (=> d!64505 (and (= (_2!8728 lt!289531) (_2!8728 lt!289528)) (= (_1!8728 lt!289531) (_1!8728 lt!289528)))))

(declare-fun lt!289526 () Bool)

(declare-fun lt!289527 () (_ BitVec 64))

(declare-fun lt!289529 () Unit!13367)

(declare-fun lt!289530 () BitStream!7780)

(declare-fun choose!56 (BitStream!7780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16166 tuple2!16166 BitStream!7780 (_ BitVec 64) Bool BitStream!7780 (_ BitVec 64) tuple2!16166 tuple2!16166 BitStream!7780 (_ BitVec 64)) Unit!13367)

(assert (=> d!64505 (= lt!289529 (choose!56 (_1!8727 lt!289287) nBits!348 i!590 lt!289299 lt!289531 (tuple2!16167 (_1!8728 lt!289531) (_2!8728 lt!289531)) (_1!8728 lt!289531) (_2!8728 lt!289531) lt!289526 lt!289530 lt!289527 lt!289528 (tuple2!16167 (_1!8728 lt!289528) (_2!8728 lt!289528)) (_1!8728 lt!289528) (_2!8728 lt!289528)))))

(assert (=> d!64505 (= lt!289528 (readNBitsLSBFirstsLoopPure!0 lt!289530 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!289527))))

(assert (=> d!64505 (= lt!289527 (bvor lt!289299 (ite lt!289526 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64505 (= lt!289530 (withMovedBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64505 (= lt!289526 (_2!8730 (readBitPure!0 (_1!8727 lt!289287))))))

(assert (=> d!64505 (= lt!289531 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299))))

(assert (=> d!64505 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299) lt!289529)))

(declare-fun bs!16046 () Bool)

(assert (= bs!16046 d!64505))

(assert (=> bs!16046 m!290693))

(declare-fun m!290949 () Bool)

(assert (=> bs!16046 m!290949))

(assert (=> bs!16046 m!290745))

(assert (=> bs!16046 m!290761))

(declare-fun m!290951 () Bool)

(assert (=> bs!16046 m!290951))

(assert (=> b!186966 d!64505))

(declare-fun d!64507 () Bool)

(declare-datatypes ((tuple2!16188 0))(
  ( (tuple2!16189 (_1!8739 (_ BitVec 64)) (_2!8739 BitStream!7780)) )
))
(declare-fun lt!289534 () tuple2!16188)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16188)

(assert (=> d!64507 (= lt!289534 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290))))

(assert (=> d!64507 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290) (tuple2!16167 (_2!8739 lt!289534) (_1!8739 lt!289534)))))

(declare-fun bs!16047 () Bool)

(assert (= bs!16047 d!64507))

(assert (=> bs!16047 m!290693))

(declare-fun m!290953 () Bool)

(assert (=> bs!16047 m!290953))

(assert (=> b!186966 d!64507))

(declare-fun d!64509 () Bool)

(declare-fun e!129417 () Bool)

(assert (=> d!64509 e!129417))

(declare-fun res!155841 () Bool)

(assert (=> d!64509 (=> (not res!155841) (not e!129417))))

(declare-fun lt!289536 () (_ BitVec 64))

(declare-fun lt!289535 () BitStream!7780)

(assert (=> d!64509 (= res!155841 (= (bvadd lt!289536 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4336 (buf!4802 lt!289535)) (currentByte!9058 lt!289535) (currentBit!9053 lt!289535))))))

(assert (=> d!64509 (or (not (= (bvand lt!289536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289536 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64509 (= lt!289536 (bitIndex!0 (size!4336 (buf!4802 (_1!8727 lt!289287))) (currentByte!9058 (_1!8727 lt!289287)) (currentBit!9053 (_1!8727 lt!289287))))))

(assert (=> d!64509 (= lt!289535 (_2!8729 (moveBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64509 (moveBitIndexPrecond!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64509 (= (withMovedBitIndex!0 (_1!8727 lt!289287) #b0000000000000000000000000000000000000000000000000000000000000001) lt!289535)))

(declare-fun b!187128 () Bool)

(assert (=> b!187128 (= e!129417 (= (size!4336 (buf!4802 (_1!8727 lt!289287))) (size!4336 (buf!4802 lt!289535))))))

(assert (= (and d!64509 res!155841) b!187128))

(declare-fun m!290955 () Bool)

(assert (=> d!64509 m!290955))

(assert (=> d!64509 m!290947))

(declare-fun m!290957 () Bool)

(assert (=> d!64509 m!290957))

(assert (=> d!64509 m!290689))

(assert (=> b!186966 d!64509))

(declare-fun d!64511 () Bool)

(assert (=> d!64511 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)) lt!289309) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204))) lt!289309))))

(declare-fun bs!16048 () Bool)

(assert (= bs!16048 d!64511))

(assert (=> bs!16048 m!290933))

(assert (=> b!186965 d!64511))

(declare-fun d!64513 () Bool)

(assert (=> d!64513 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204))))))

(declare-fun bs!16049 () Bool)

(assert (= bs!16049 d!64513))

(assert (=> bs!16049 m!290709))

(assert (=> start!40658 d!64513))

(declare-fun d!64515 () Bool)

(declare-fun res!155849 () Bool)

(declare-fun e!129423 () Bool)

(assert (=> d!64515 (=> (not res!155849) (not e!129423))))

(assert (=> d!64515 (= res!155849 (= (size!4336 (buf!4802 thiss!1204)) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (=> d!64515 (= (isPrefixOf!0 thiss!1204 (_2!8729 lt!289289)) e!129423)))

(declare-fun b!187135 () Bool)

(declare-fun res!155850 () Bool)

(assert (=> b!187135 (=> (not res!155850) (not e!129423))))

(assert (=> b!187135 (= res!155850 (bvsle (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289)))))))

(declare-fun b!187136 () Bool)

(declare-fun e!129422 () Bool)

(assert (=> b!187136 (= e!129423 e!129422)))

(declare-fun res!155848 () Bool)

(assert (=> b!187136 (=> res!155848 e!129422)))

(assert (=> b!187136 (= res!155848 (= (size!4336 (buf!4802 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187137 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9834 array!9834 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187137 (= e!129422 (arrayBitRangesEq!0 (buf!4802 thiss!1204) (buf!4802 (_2!8729 lt!289289)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))))))

(assert (= (and d!64515 res!155849) b!187135))

(assert (= (and b!187135 res!155850) b!187136))

(assert (= (and b!187136 (not res!155848)) b!187137))

(assert (=> b!187135 m!290723))

(assert (=> b!187135 m!290721))

(assert (=> b!187137 m!290723))

(assert (=> b!187137 m!290723))

(declare-fun m!290959 () Bool)

(assert (=> b!187137 m!290959))

(assert (=> b!186978 d!64515))

(assert (=> b!186967 d!64493))

(assert (=> b!186967 d!64495))

(declare-fun b!187150 () Bool)

(declare-fun e!129428 () Bool)

(declare-fun lt!289548 () tuple2!16170)

(declare-fun lt!289547 () tuple2!16168)

(assert (=> b!187150 (= e!129428 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289548))) (currentByte!9058 (_1!8730 lt!289548)) (currentBit!9053 (_1!8730 lt!289548))) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289547))) (currentByte!9058 (_2!8729 lt!289547)) (currentBit!9053 (_2!8729 lt!289547)))))))

(declare-fun d!64517 () Bool)

(declare-fun e!129429 () Bool)

(assert (=> d!64517 e!129429))

(declare-fun res!155860 () Bool)

(assert (=> d!64517 (=> (not res!155860) (not e!129429))))

(assert (=> d!64517 (= res!155860 (= (size!4336 (buf!4802 thiss!1204)) (size!4336 (buf!4802 (_2!8729 lt!289547)))))))

(declare-fun choose!16 (BitStream!7780 Bool) tuple2!16168)

(assert (=> d!64517 (= lt!289547 (choose!16 thiss!1204 lt!289306))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64517 (validate_offset_bit!0 ((_ sign_extend 32) (size!4336 (buf!4802 thiss!1204))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)))))

(assert (=> d!64517 (= (appendBit!0 thiss!1204 lt!289306) lt!289547)))

(declare-fun b!187149 () Bool)

(assert (=> b!187149 (= e!129429 e!129428)))

(declare-fun res!155859 () Bool)

(assert (=> b!187149 (=> (not res!155859) (not e!129428))))

(assert (=> b!187149 (= res!155859 (and (= (_2!8730 lt!289548) lt!289306) (= (_1!8730 lt!289548) (_2!8729 lt!289547))))))

(assert (=> b!187149 (= lt!289548 (readBitPure!0 (readerFrom!0 (_2!8729 lt!289547) (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204))))))

(declare-fun b!187147 () Bool)

(declare-fun res!155861 () Bool)

(assert (=> b!187147 (=> (not res!155861) (not e!129429))))

(declare-fun lt!289545 () (_ BitVec 64))

(declare-fun lt!289546 () (_ BitVec 64))

(assert (=> b!187147 (= res!155861 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289547))) (currentByte!9058 (_2!8729 lt!289547)) (currentBit!9053 (_2!8729 lt!289547))) (bvadd lt!289546 lt!289545)))))

(assert (=> b!187147 (or (not (= (bvand lt!289546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289545 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289546 lt!289545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187147 (= lt!289545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!187147 (= lt!289546 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun b!187148 () Bool)

(declare-fun res!155862 () Bool)

(assert (=> b!187148 (=> (not res!155862) (not e!129429))))

(assert (=> b!187148 (= res!155862 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289547)))))

(assert (= (and d!64517 res!155860) b!187147))

(assert (= (and b!187147 res!155861) b!187148))

(assert (= (and b!187148 res!155862) b!187149))

(assert (= (and b!187149 res!155859) b!187150))

(declare-fun m!290961 () Bool)

(assert (=> b!187150 m!290961))

(declare-fun m!290963 () Bool)

(assert (=> b!187150 m!290963))

(declare-fun m!290965 () Bool)

(assert (=> b!187149 m!290965))

(assert (=> b!187149 m!290965))

(declare-fun m!290967 () Bool)

(assert (=> b!187149 m!290967))

(declare-fun m!290969 () Bool)

(assert (=> b!187148 m!290969))

(declare-fun m!290971 () Bool)

(assert (=> d!64517 m!290971))

(declare-fun m!290973 () Bool)

(assert (=> d!64517 m!290973))

(assert (=> b!187147 m!290963))

(assert (=> b!187147 m!290723))

(assert (=> b!186967 d!64517))

(assert (=> b!186977 d!64515))

(declare-fun d!64523 () Bool)

(declare-datatypes ((tuple2!16190 0))(
  ( (tuple2!16191 (_1!8740 Bool) (_2!8740 BitStream!7780)) )
))
(declare-fun lt!289551 () tuple2!16190)

(declare-fun readBit!0 (BitStream!7780) tuple2!16190)

(assert (=> d!64523 (= lt!289551 (readBit!0 (readerFrom!0 (_2!8729 lt!289289) (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204))))))

(assert (=> d!64523 (= (readBitPure!0 (readerFrom!0 (_2!8729 lt!289289) (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204))) (tuple2!16171 (_2!8740 lt!289551) (_1!8740 lt!289551)))))

(declare-fun bs!16050 () Bool)

(assert (= bs!16050 d!64523))

(assert (=> bs!16050 m!290717))

(declare-fun m!290975 () Bool)

(assert (=> bs!16050 m!290975))

(assert (=> b!186979 d!64523))

(declare-fun d!64525 () Bool)

(declare-fun e!129435 () Bool)

(assert (=> d!64525 e!129435))

(declare-fun res!155869 () Bool)

(assert (=> d!64525 (=> (not res!155869) (not e!129435))))

(assert (=> d!64525 (= res!155869 (invariant!0 (currentBit!9053 (_2!8729 lt!289289)) (currentByte!9058 (_2!8729 lt!289289)) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (=> d!64525 (= (readerFrom!0 (_2!8729 lt!289289) (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204)) (BitStream!7781 (buf!4802 (_2!8729 lt!289289)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun b!187157 () Bool)

(assert (=> b!187157 (= e!129435 (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289289)))))))

(assert (= (and d!64525 res!155869) b!187157))

(assert (=> d!64525 m!290931))

(assert (=> b!187157 m!290739))

(assert (=> b!186979 d!64525))

(declare-fun d!64529 () Bool)

(declare-fun lt!289555 () tuple2!16190)

(assert (=> d!64529 (= lt!289555 (readBit!0 lt!289286))))

(assert (=> d!64529 (= (readBitPure!0 lt!289286) (tuple2!16171 (_2!8740 lt!289555) (_1!8740 lt!289555)))))

(declare-fun bs!16051 () Bool)

(assert (= bs!16051 d!64529))

(declare-fun m!290979 () Bool)

(assert (=> bs!16051 m!290979))

(assert (=> b!186970 d!64529))

(declare-fun d!64531 () Bool)

(assert (=> d!64531 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!186970 d!64531))

(declare-fun d!64533 () Bool)

(declare-fun lt!289556 () tuple2!16190)

(assert (=> d!64533 (= lt!289556 (readBit!0 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))))))

(assert (=> d!64533 (= (readBitPure!0 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))) (tuple2!16171 (_2!8740 lt!289556) (_1!8740 lt!289556)))))

(declare-fun bs!16052 () Bool)

(assert (= bs!16052 d!64533))

(declare-fun m!290981 () Bool)

(assert (=> bs!16052 m!290981))

(assert (=> b!186970 d!64533))

(declare-fun d!64535 () Bool)

(declare-fun e!129446 () Bool)

(assert (=> d!64535 e!129446))

(declare-fun res!155881 () Bool)

(assert (=> d!64535 (=> (not res!155881) (not e!129446))))

(declare-fun lt!289656 () tuple2!16164)

(assert (=> d!64535 (= res!155881 (isPrefixOf!0 (_1!8727 lt!289656) (_2!8727 lt!289656)))))

(declare-fun lt!289640 () BitStream!7780)

(assert (=> d!64535 (= lt!289656 (tuple2!16165 lt!289640 (_2!8729 lt!289297)))))

(declare-fun lt!289645 () Unit!13367)

(declare-fun lt!289646 () Unit!13367)

(assert (=> d!64535 (= lt!289645 lt!289646)))

(assert (=> d!64535 (isPrefixOf!0 lt!289640 (_2!8729 lt!289297))))

(assert (=> d!64535 (= lt!289646 (lemmaIsPrefixTransitive!0 lt!289640 (_2!8729 lt!289297) (_2!8729 lt!289297)))))

(declare-fun lt!289655 () Unit!13367)

(declare-fun lt!289651 () Unit!13367)

(assert (=> d!64535 (= lt!289655 lt!289651)))

(assert (=> d!64535 (isPrefixOf!0 lt!289640 (_2!8729 lt!289297))))

(assert (=> d!64535 (= lt!289651 (lemmaIsPrefixTransitive!0 lt!289640 thiss!1204 (_2!8729 lt!289297)))))

(declare-fun lt!289654 () Unit!13367)

(declare-fun e!129445 () Unit!13367)

(assert (=> d!64535 (= lt!289654 e!129445)))

(declare-fun c!9539 () Bool)

(assert (=> d!64535 (= c!9539 (not (= (size!4336 (buf!4802 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!289641 () Unit!13367)

(declare-fun lt!289649 () Unit!13367)

(assert (=> d!64535 (= lt!289641 lt!289649)))

(assert (=> d!64535 (isPrefixOf!0 (_2!8729 lt!289297) (_2!8729 lt!289297))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7780) Unit!13367)

(assert (=> d!64535 (= lt!289649 (lemmaIsPrefixRefl!0 (_2!8729 lt!289297)))))

(declare-fun lt!289644 () Unit!13367)

(declare-fun lt!289643 () Unit!13367)

(assert (=> d!64535 (= lt!289644 lt!289643)))

(assert (=> d!64535 (= lt!289643 (lemmaIsPrefixRefl!0 (_2!8729 lt!289297)))))

(declare-fun lt!289648 () Unit!13367)

(declare-fun lt!289647 () Unit!13367)

(assert (=> d!64535 (= lt!289648 lt!289647)))

(assert (=> d!64535 (isPrefixOf!0 lt!289640 lt!289640)))

(assert (=> d!64535 (= lt!289647 (lemmaIsPrefixRefl!0 lt!289640))))

(declare-fun lt!289642 () Unit!13367)

(declare-fun lt!289650 () Unit!13367)

(assert (=> d!64535 (= lt!289642 lt!289650)))

(assert (=> d!64535 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64535 (= lt!289650 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64535 (= lt!289640 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(assert (=> d!64535 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289297))))

(assert (=> d!64535 (= (reader!0 thiss!1204 (_2!8729 lt!289297)) lt!289656)))

(declare-fun b!187171 () Bool)

(declare-fun Unit!13373 () Unit!13367)

(assert (=> b!187171 (= e!129445 Unit!13373)))

(declare-fun lt!289653 () (_ BitVec 64))

(declare-fun lt!289639 () (_ BitVec 64))

(declare-fun b!187172 () Bool)

(assert (=> b!187172 (= e!129446 (= (_1!8727 lt!289656) (withMovedBitIndex!0 (_2!8727 lt!289656) (bvsub lt!289653 lt!289639))))))

(assert (=> b!187172 (or (= (bvand lt!289653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289653 lt!289639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187172 (= lt!289639 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297))))))

(assert (=> b!187172 (= lt!289653 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun b!187173 () Bool)

(declare-fun res!155883 () Bool)

(assert (=> b!187173 (=> (not res!155883) (not e!129446))))

(assert (=> b!187173 (= res!155883 (isPrefixOf!0 (_2!8727 lt!289656) (_2!8729 lt!289297)))))

(declare-fun b!187174 () Bool)

(declare-fun res!155882 () Bool)

(assert (=> b!187174 (=> (not res!155882) (not e!129446))))

(assert (=> b!187174 (= res!155882 (isPrefixOf!0 (_1!8727 lt!289656) thiss!1204))))

(declare-fun b!187175 () Bool)

(declare-fun lt!289652 () Unit!13367)

(assert (=> b!187175 (= e!129445 lt!289652)))

(declare-fun lt!289637 () (_ BitVec 64))

(assert (=> b!187175 (= lt!289637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!289638 () (_ BitVec 64))

(assert (=> b!187175 (= lt!289638 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9834 array!9834 (_ BitVec 64) (_ BitVec 64)) Unit!13367)

(assert (=> b!187175 (= lt!289652 (arrayBitRangesEqSymmetric!0 (buf!4802 thiss!1204) (buf!4802 (_2!8729 lt!289297)) lt!289637 lt!289638))))

(assert (=> b!187175 (arrayBitRangesEq!0 (buf!4802 (_2!8729 lt!289297)) (buf!4802 thiss!1204) lt!289637 lt!289638)))

(assert (= (and d!64535 c!9539) b!187175))

(assert (= (and d!64535 (not c!9539)) b!187171))

(assert (= (and d!64535 res!155881) b!187174))

(assert (= (and b!187174 res!155882) b!187173))

(assert (= (and b!187173 res!155883) b!187172))

(assert (=> b!187175 m!290723))

(declare-fun m!290995 () Bool)

(assert (=> b!187175 m!290995))

(declare-fun m!290997 () Bool)

(assert (=> b!187175 m!290997))

(declare-fun m!290999 () Bool)

(assert (=> b!187172 m!290999))

(assert (=> b!187172 m!290701))

(assert (=> b!187172 m!290723))

(declare-fun m!291001 () Bool)

(assert (=> b!187173 m!291001))

(declare-fun m!291003 () Bool)

(assert (=> b!187174 m!291003))

(declare-fun m!291005 () Bool)

(assert (=> d!64535 m!291005))

(assert (=> d!64535 m!290703))

(declare-fun m!291007 () Bool)

(assert (=> d!64535 m!291007))

(declare-fun m!291009 () Bool)

(assert (=> d!64535 m!291009))

(declare-fun m!291011 () Bool)

(assert (=> d!64535 m!291011))

(declare-fun m!291013 () Bool)

(assert (=> d!64535 m!291013))

(declare-fun m!291015 () Bool)

(assert (=> d!64535 m!291015))

(declare-fun m!291017 () Bool)

(assert (=> d!64535 m!291017))

(declare-fun m!291019 () Bool)

(assert (=> d!64535 m!291019))

(declare-fun m!291021 () Bool)

(assert (=> d!64535 m!291021))

(declare-fun m!291023 () Bool)

(assert (=> d!64535 m!291023))

(assert (=> b!186970 d!64535))

(declare-fun d!64549 () Bool)

(declare-fun e!129448 () Bool)

(assert (=> d!64549 e!129448))

(declare-fun res!155888 () Bool)

(assert (=> d!64549 (=> (not res!155888) (not e!129448))))

(declare-fun lt!289667 () (_ BitVec 64))

(declare-fun lt!289670 () (_ BitVec 64))

(declare-fun lt!289666 () (_ BitVec 64))

(assert (=> d!64549 (= res!155888 (= lt!289666 (bvsub lt!289667 lt!289670)))))

(assert (=> d!64549 (or (= (bvand lt!289667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289667 lt!289670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64549 (= lt!289670 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289310)))) ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289310))) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289310)))))))

(declare-fun lt!289665 () (_ BitVec 64))

(declare-fun lt!289669 () (_ BitVec 64))

(assert (=> d!64549 (= lt!289667 (bvmul lt!289665 lt!289669))))

(assert (=> d!64549 (or (= lt!289665 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289669 (bvsdiv (bvmul lt!289665 lt!289669) lt!289665)))))

(assert (=> d!64549 (= lt!289669 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64549 (= lt!289665 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289310)))))))

(assert (=> d!64549 (= lt!289666 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289310))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289310)))))))

(assert (=> d!64549 (invariant!0 (currentBit!9053 (_1!8730 lt!289310)) (currentByte!9058 (_1!8730 lt!289310)) (size!4336 (buf!4802 (_1!8730 lt!289310))))))

(assert (=> d!64549 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289310))) (currentByte!9058 (_1!8730 lt!289310)) (currentBit!9053 (_1!8730 lt!289310))) lt!289666)))

(declare-fun b!187182 () Bool)

(declare-fun res!155889 () Bool)

(assert (=> b!187182 (=> (not res!155889) (not e!129448))))

(assert (=> b!187182 (= res!155889 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289666))))

(declare-fun b!187183 () Bool)

(declare-fun lt!289668 () (_ BitVec 64))

(assert (=> b!187183 (= e!129448 (bvsle lt!289666 (bvmul lt!289668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187183 (or (= lt!289668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289668)))))

(assert (=> b!187183 (= lt!289668 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289310)))))))

(assert (= (and d!64549 res!155888) b!187182))

(assert (= (and b!187182 res!155889) b!187183))

(declare-fun m!291029 () Bool)

(assert (=> d!64549 m!291029))

(declare-fun m!291031 () Bool)

(assert (=> d!64549 m!291031))

(assert (=> b!186970 d!64549))

(declare-fun lt!289672 () tuple2!16188)

(declare-fun d!64553 () Bool)

(assert (=> d!64553 (= lt!289672 (readNBitsLSBFirstsLoop!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299))))

(assert (=> d!64553 (= (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289287) nBits!348 i!590 lt!289299) (tuple2!16167 (_2!8739 lt!289672) (_1!8739 lt!289672)))))

(declare-fun bs!16058 () Bool)

(assert (= bs!16058 d!64553))

(declare-fun m!291035 () Bool)

(assert (=> bs!16058 m!291035))

(assert (=> b!186970 d!64553))

(declare-fun d!64557 () Bool)

(assert (=> d!64557 (= (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289289)))) (and (bvsge (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9053 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9058 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289289)))) (and (= (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9058 thiss!1204) (size!4336 (buf!4802 (_2!8729 lt!289289))))))))))

(assert (=> b!186970 d!64557))

(declare-fun d!64559 () Bool)

(declare-fun e!129449 () Bool)

(assert (=> d!64559 e!129449))

(declare-fun res!155890 () Bool)

(assert (=> d!64559 (=> (not res!155890) (not e!129449))))

(declare-fun lt!289675 () (_ BitVec 64))

(declare-fun lt!289678 () (_ BitVec 64))

(declare-fun lt!289674 () (_ BitVec 64))

(assert (=> d!64559 (= res!155890 (= lt!289674 (bvsub lt!289675 lt!289678)))))

(assert (=> d!64559 (or (= (bvand lt!289675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289675 lt!289678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64559 (= lt!289678 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289296)))) ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289296))) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289296)))))))

(declare-fun lt!289673 () (_ BitVec 64))

(declare-fun lt!289677 () (_ BitVec 64))

(assert (=> d!64559 (= lt!289675 (bvmul lt!289673 lt!289677))))

(assert (=> d!64559 (or (= lt!289673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289677 (bvsdiv (bvmul lt!289673 lt!289677) lt!289673)))))

(assert (=> d!64559 (= lt!289677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64559 (= lt!289673 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289296)))))))

(assert (=> d!64559 (= lt!289674 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 (_1!8730 lt!289296))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 (_1!8730 lt!289296)))))))

(assert (=> d!64559 (invariant!0 (currentBit!9053 (_1!8730 lt!289296)) (currentByte!9058 (_1!8730 lt!289296)) (size!4336 (buf!4802 (_1!8730 lt!289296))))))

(assert (=> d!64559 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289296))) (currentByte!9058 (_1!8730 lt!289296)) (currentBit!9053 (_1!8730 lt!289296))) lt!289674)))

(declare-fun b!187184 () Bool)

(declare-fun res!155891 () Bool)

(assert (=> b!187184 (=> (not res!155891) (not e!129449))))

(assert (=> b!187184 (= res!155891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289674))))

(declare-fun b!187185 () Bool)

(declare-fun lt!289676 () (_ BitVec 64))

(assert (=> b!187185 (= e!129449 (bvsle lt!289674 (bvmul lt!289676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187185 (or (= lt!289676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289676)))))

(assert (=> b!187185 (= lt!289676 ((_ sign_extend 32) (size!4336 (buf!4802 (_1!8730 lt!289296)))))))

(assert (= (and d!64559 res!155890) b!187184))

(assert (= (and b!187184 res!155891) b!187185))

(declare-fun m!291037 () Bool)

(assert (=> d!64559 m!291037))

(declare-fun m!291039 () Bool)

(assert (=> d!64559 m!291039))

(assert (=> b!186970 d!64559))

(declare-fun d!64561 () Bool)

(assert (=> d!64561 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!289302) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289)))) lt!289302))))

(declare-fun bs!16059 () Bool)

(assert (= bs!16059 d!64561))

(declare-fun m!291041 () Bool)

(assert (=> bs!16059 m!291041))

(assert (=> b!186970 d!64561))

(declare-fun d!64563 () Bool)

(assert (=> d!64563 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)) lt!289309) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204))) lt!289309))))

(declare-fun bs!16060 () Bool)

(assert (= bs!16060 d!64563))

(declare-fun m!291043 () Bool)

(assert (=> bs!16060 m!291043))

(assert (=> b!186970 d!64563))

(declare-fun d!64565 () Bool)

(declare-fun lt!289679 () tuple2!16190)

(assert (=> d!64565 (= lt!289679 (readBit!0 (_1!8727 lt!289287)))))

(assert (=> d!64565 (= (readBitPure!0 (_1!8727 lt!289287)) (tuple2!16171 (_2!8740 lt!289679) (_1!8740 lt!289679)))))

(declare-fun bs!16061 () Bool)

(assert (= bs!16061 d!64565))

(declare-fun m!291045 () Bool)

(assert (=> bs!16061 m!291045))

(assert (=> b!186970 d!64565))

(declare-fun d!64567 () Bool)

(declare-fun e!129455 () Bool)

(assert (=> d!64567 e!129455))

(declare-fun res!155897 () Bool)

(assert (=> d!64567 (=> (not res!155897) (not e!129455))))

(declare-fun lt!289704 () tuple2!16170)

(declare-fun lt!289703 () tuple2!16170)

(assert (=> d!64567 (= res!155897 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289704))) (currentByte!9058 (_1!8730 lt!289704)) (currentBit!9053 (_1!8730 lt!289704))) (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289703))) (currentByte!9058 (_1!8730 lt!289703)) (currentBit!9053 (_1!8730 lt!289703)))))))

(declare-fun lt!289702 () Unit!13367)

(declare-fun lt!289701 () BitStream!7780)

(declare-fun choose!50 (BitStream!7780 BitStream!7780 BitStream!7780 tuple2!16170 tuple2!16170 BitStream!7780 Bool tuple2!16170 tuple2!16170 BitStream!7780 Bool) Unit!13367)

(assert (=> d!64567 (= lt!289702 (choose!50 lt!289286 (_2!8729 lt!289297) lt!289701 lt!289704 (tuple2!16171 (_1!8730 lt!289704) (_2!8730 lt!289704)) (_1!8730 lt!289704) (_2!8730 lt!289704) lt!289703 (tuple2!16171 (_1!8730 lt!289703) (_2!8730 lt!289703)) (_1!8730 lt!289703) (_2!8730 lt!289703)))))

(assert (=> d!64567 (= lt!289703 (readBitPure!0 lt!289701))))

(assert (=> d!64567 (= lt!289704 (readBitPure!0 lt!289286))))

(assert (=> d!64567 (= lt!289701 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 lt!289286) (currentBit!9053 lt!289286)))))

(assert (=> d!64567 (invariant!0 (currentBit!9053 lt!289286) (currentByte!9058 lt!289286) (size!4336 (buf!4802 (_2!8729 lt!289297))))))

(assert (=> d!64567 (= (readBitPrefixLemma!0 lt!289286 (_2!8729 lt!289297)) lt!289702)))

(declare-fun b!187191 () Bool)

(assert (=> b!187191 (= e!129455 (= (_2!8730 lt!289704) (_2!8730 lt!289703)))))

(assert (= (and d!64567 res!155897) b!187191))

(declare-fun m!291059 () Bool)

(assert (=> d!64567 m!291059))

(declare-fun m!291061 () Bool)

(assert (=> d!64567 m!291061))

(declare-fun m!291063 () Bool)

(assert (=> d!64567 m!291063))

(assert (=> d!64567 m!290751))

(declare-fun m!291065 () Bool)

(assert (=> d!64567 m!291065))

(declare-fun m!291067 () Bool)

(assert (=> d!64567 m!291067))

(assert (=> b!186970 d!64567))

(declare-fun d!64573 () Bool)

(declare-fun e!129457 () Bool)

(assert (=> d!64573 e!129457))

(declare-fun res!155898 () Bool)

(assert (=> d!64573 (=> (not res!155898) (not e!129457))))

(declare-fun lt!289724 () tuple2!16164)

(assert (=> d!64573 (= res!155898 (isPrefixOf!0 (_1!8727 lt!289724) (_2!8727 lt!289724)))))

(declare-fun lt!289708 () BitStream!7780)

(assert (=> d!64573 (= lt!289724 (tuple2!16165 lt!289708 (_2!8729 lt!289297)))))

(declare-fun lt!289713 () Unit!13367)

(declare-fun lt!289714 () Unit!13367)

(assert (=> d!64573 (= lt!289713 lt!289714)))

(assert (=> d!64573 (isPrefixOf!0 lt!289708 (_2!8729 lt!289297))))

(assert (=> d!64573 (= lt!289714 (lemmaIsPrefixTransitive!0 lt!289708 (_2!8729 lt!289297) (_2!8729 lt!289297)))))

(declare-fun lt!289723 () Unit!13367)

(declare-fun lt!289719 () Unit!13367)

(assert (=> d!64573 (= lt!289723 lt!289719)))

(assert (=> d!64573 (isPrefixOf!0 lt!289708 (_2!8729 lt!289297))))

(assert (=> d!64573 (= lt!289719 (lemmaIsPrefixTransitive!0 lt!289708 (_2!8729 lt!289289) (_2!8729 lt!289297)))))

(declare-fun lt!289722 () Unit!13367)

(declare-fun e!129456 () Unit!13367)

(assert (=> d!64573 (= lt!289722 e!129456)))

(declare-fun c!9540 () Bool)

(assert (=> d!64573 (= c!9540 (not (= (size!4336 (buf!4802 (_2!8729 lt!289289))) #b00000000000000000000000000000000)))))

(declare-fun lt!289709 () Unit!13367)

(declare-fun lt!289717 () Unit!13367)

(assert (=> d!64573 (= lt!289709 lt!289717)))

(assert (=> d!64573 (isPrefixOf!0 (_2!8729 lt!289297) (_2!8729 lt!289297))))

(assert (=> d!64573 (= lt!289717 (lemmaIsPrefixRefl!0 (_2!8729 lt!289297)))))

(declare-fun lt!289712 () Unit!13367)

(declare-fun lt!289711 () Unit!13367)

(assert (=> d!64573 (= lt!289712 lt!289711)))

(assert (=> d!64573 (= lt!289711 (lemmaIsPrefixRefl!0 (_2!8729 lt!289297)))))

(declare-fun lt!289716 () Unit!13367)

(declare-fun lt!289715 () Unit!13367)

(assert (=> d!64573 (= lt!289716 lt!289715)))

(assert (=> d!64573 (isPrefixOf!0 lt!289708 lt!289708)))

(assert (=> d!64573 (= lt!289715 (lemmaIsPrefixRefl!0 lt!289708))))

(declare-fun lt!289710 () Unit!13367)

(declare-fun lt!289718 () Unit!13367)

(assert (=> d!64573 (= lt!289710 lt!289718)))

(assert (=> d!64573 (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!289289))))

(assert (=> d!64573 (= lt!289718 (lemmaIsPrefixRefl!0 (_2!8729 lt!289289)))))

(assert (=> d!64573 (= lt!289708 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(assert (=> d!64573 (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!289297))))

(assert (=> d!64573 (= (reader!0 (_2!8729 lt!289289) (_2!8729 lt!289297)) lt!289724)))

(declare-fun b!187192 () Bool)

(declare-fun Unit!13374 () Unit!13367)

(assert (=> b!187192 (= e!129456 Unit!13374)))

(declare-fun b!187193 () Bool)

(declare-fun lt!289721 () (_ BitVec 64))

(declare-fun lt!289707 () (_ BitVec 64))

(assert (=> b!187193 (= e!129457 (= (_1!8727 lt!289724) (withMovedBitIndex!0 (_2!8727 lt!289724) (bvsub lt!289721 lt!289707))))))

(assert (=> b!187193 (or (= (bvand lt!289721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289707 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289721 lt!289707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187193 (= lt!289707 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297))))))

(assert (=> b!187193 (= lt!289721 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(declare-fun b!187194 () Bool)

(declare-fun res!155900 () Bool)

(assert (=> b!187194 (=> (not res!155900) (not e!129457))))

(assert (=> b!187194 (= res!155900 (isPrefixOf!0 (_2!8727 lt!289724) (_2!8729 lt!289297)))))

(declare-fun b!187195 () Bool)

(declare-fun res!155899 () Bool)

(assert (=> b!187195 (=> (not res!155899) (not e!129457))))

(assert (=> b!187195 (= res!155899 (isPrefixOf!0 (_1!8727 lt!289724) (_2!8729 lt!289289)))))

(declare-fun b!187196 () Bool)

(declare-fun lt!289720 () Unit!13367)

(assert (=> b!187196 (= e!129456 lt!289720)))

(declare-fun lt!289705 () (_ BitVec 64))

(assert (=> b!187196 (= lt!289705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!289706 () (_ BitVec 64))

(assert (=> b!187196 (= lt!289706 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(assert (=> b!187196 (= lt!289720 (arrayBitRangesEqSymmetric!0 (buf!4802 (_2!8729 lt!289289)) (buf!4802 (_2!8729 lt!289297)) lt!289705 lt!289706))))

(assert (=> b!187196 (arrayBitRangesEq!0 (buf!4802 (_2!8729 lt!289297)) (buf!4802 (_2!8729 lt!289289)) lt!289705 lt!289706)))

(assert (= (and d!64573 c!9540) b!187196))

(assert (= (and d!64573 (not c!9540)) b!187192))

(assert (= (and d!64573 res!155898) b!187195))

(assert (= (and b!187195 res!155899) b!187194))

(assert (= (and b!187194 res!155900) b!187193))

(assert (=> b!187196 m!290721))

(declare-fun m!291071 () Bool)

(assert (=> b!187196 m!291071))

(declare-fun m!291073 () Bool)

(assert (=> b!187196 m!291073))

(declare-fun m!291075 () Bool)

(assert (=> b!187193 m!291075))

(assert (=> b!187193 m!290701))

(assert (=> b!187193 m!290721))

(declare-fun m!291077 () Bool)

(assert (=> b!187194 m!291077))

(declare-fun m!291081 () Bool)

(assert (=> b!187195 m!291081))

(declare-fun m!291083 () Bool)

(assert (=> d!64573 m!291083))

(assert (=> d!64573 m!290713))

(assert (=> d!64573 m!291007))

(declare-fun m!291085 () Bool)

(assert (=> d!64573 m!291085))

(declare-fun m!291087 () Bool)

(assert (=> d!64573 m!291087))

(declare-fun m!291089 () Bool)

(assert (=> d!64573 m!291089))

(declare-fun m!291091 () Bool)

(assert (=> d!64573 m!291091))

(declare-fun m!291093 () Bool)

(assert (=> d!64573 m!291093))

(assert (=> d!64573 m!291019))

(declare-fun m!291095 () Bool)

(assert (=> d!64573 m!291095))

(declare-fun m!291097 () Bool)

(assert (=> d!64573 m!291097))

(assert (=> b!186970 d!64573))

(declare-fun d!64579 () Bool)

(declare-fun lt!289730 () tuple2!16188)

(assert (=> d!64579 (= lt!289730 (readNBitsLSBFirstsLoop!0 (_1!8727 lt!289308) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290))))

(assert (=> d!64579 (= (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289308) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289290) (tuple2!16167 (_2!8739 lt!289730) (_1!8739 lt!289730)))))

(declare-fun bs!16066 () Bool)

(assert (= bs!16066 d!64579))

(declare-fun m!291101 () Bool)

(assert (=> bs!16066 m!291101))

(assert (=> b!186970 d!64579))

(declare-fun d!64583 () Bool)

(assert (=> d!64583 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!289302)))

(declare-fun lt!289740 () Unit!13367)

(declare-fun choose!9 (BitStream!7780 array!9834 (_ BitVec 64) BitStream!7780) Unit!13367)

(assert (=> d!64583 (= lt!289740 (choose!9 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!289297)) lt!289302 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289)))))))

(assert (=> d!64583 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!289297)) lt!289302) lt!289740)))

(declare-fun bs!16070 () Bool)

(assert (= bs!16070 d!64583))

(assert (=> bs!16070 m!290733))

(declare-fun m!291113 () Bool)

(assert (=> bs!16070 m!291113))

(assert (=> b!186970 d!64583))

(declare-fun d!64593 () Bool)

(assert (=> d!64593 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 thiss!1204)) ((_ sign_extend 32) (currentBit!9053 thiss!1204)) lt!289309)))

(declare-fun lt!289741 () Unit!13367)

(assert (=> d!64593 (= lt!289741 (choose!9 thiss!1204 (buf!4802 (_2!8729 lt!289297)) lt!289309 (BitStream!7781 (buf!4802 (_2!8729 lt!289297)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))))))

(assert (=> d!64593 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4802 (_2!8729 lt!289297)) lt!289309) lt!289741)))

(declare-fun bs!16071 () Bool)

(assert (= bs!16071 d!64593))

(assert (=> bs!16071 m!290737))

(declare-fun m!291115 () Bool)

(assert (=> bs!16071 m!291115))

(assert (=> b!186970 d!64593))

(declare-fun d!64595 () Bool)

(assert (=> d!64595 (= (invariant!0 (currentBit!9053 (_2!8729 lt!289297)) (currentByte!9058 (_2!8729 lt!289297)) (size!4336 (buf!4802 (_2!8729 lt!289297)))) (and (bvsge (currentBit!9053 (_2!8729 lt!289297)) #b00000000000000000000000000000000) (bvslt (currentBit!9053 (_2!8729 lt!289297)) #b00000000000000000000000000001000) (bvsge (currentByte!9058 (_2!8729 lt!289297)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9058 (_2!8729 lt!289297)) (size!4336 (buf!4802 (_2!8729 lt!289297)))) (and (= (currentBit!9053 (_2!8729 lt!289297)) #b00000000000000000000000000000000) (= (currentByte!9058 (_2!8729 lt!289297)) (size!4336 (buf!4802 (_2!8729 lt!289297))))))))))

(assert (=> b!186969 d!64595))

(declare-fun d!64597 () Bool)

(declare-fun res!155904 () Bool)

(declare-fun e!129460 () Bool)

(assert (=> d!64597 (=> (not res!155904) (not e!129460))))

(assert (=> d!64597 (= res!155904 (= (size!4336 (buf!4802 (_2!8729 lt!289289))) (size!4336 (buf!4802 (_2!8729 lt!289297)))))))

(assert (=> d!64597 (= (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!289297)) e!129460)))

(declare-fun b!187199 () Bool)

(declare-fun res!155905 () Bool)

(assert (=> b!187199 (=> (not res!155905) (not e!129460))))

(assert (=> b!187199 (= res!155905 (bvsle (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297)))))))

(declare-fun b!187200 () Bool)

(declare-fun e!129459 () Bool)

(assert (=> b!187200 (= e!129460 e!129459)))

(declare-fun res!155903 () Bool)

(assert (=> b!187200 (=> res!155903 e!129459)))

(assert (=> b!187200 (= res!155903 (= (size!4336 (buf!4802 (_2!8729 lt!289289))) #b00000000000000000000000000000000))))

(declare-fun b!187201 () Bool)

(assert (=> b!187201 (= e!129459 (arrayBitRangesEq!0 (buf!4802 (_2!8729 lt!289289)) (buf!4802 (_2!8729 lt!289297)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289)))))))

(assert (= (and d!64597 res!155904) b!187199))

(assert (= (and b!187199 res!155905) b!187200))

(assert (= (and b!187200 (not res!155903)) b!187201))

(assert (=> b!187199 m!290721))

(assert (=> b!187199 m!290701))

(assert (=> b!187201 m!290721))

(assert (=> b!187201 m!290721))

(declare-fun m!291117 () Bool)

(assert (=> b!187201 m!291117))

(assert (=> b!186982 d!64597))

(declare-fun d!64599 () Bool)

(declare-fun e!129461 () Bool)

(assert (=> d!64599 e!129461))

(declare-fun res!155906 () Bool)

(assert (=> d!64599 (=> (not res!155906) (not e!129461))))

(declare-fun lt!289743 () (_ BitVec 64))

(declare-fun lt!289742 () BitStream!7780)

(assert (=> d!64599 (= res!155906 (= (bvadd lt!289743 (bvsub lt!289301 lt!289292)) (bitIndex!0 (size!4336 (buf!4802 lt!289742)) (currentByte!9058 lt!289742) (currentBit!9053 lt!289742))))))

(assert (=> d!64599 (or (not (= (bvand lt!289743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289301 lt!289292) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289743 (bvsub lt!289301 lt!289292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64599 (= lt!289743 (bitIndex!0 (size!4336 (buf!4802 (_2!8727 lt!289287))) (currentByte!9058 (_2!8727 lt!289287)) (currentBit!9053 (_2!8727 lt!289287))))))

(assert (=> d!64599 (= lt!289742 (_2!8729 (moveBitIndex!0 (_2!8727 lt!289287) (bvsub lt!289301 lt!289292))))))

(assert (=> d!64599 (moveBitIndexPrecond!0 (_2!8727 lt!289287) (bvsub lt!289301 lt!289292))))

(assert (=> d!64599 (= (withMovedBitIndex!0 (_2!8727 lt!289287) (bvsub lt!289301 lt!289292)) lt!289742)))

(declare-fun b!187202 () Bool)

(assert (=> b!187202 (= e!129461 (= (size!4336 (buf!4802 (_2!8727 lt!289287))) (size!4336 (buf!4802 lt!289742))))))

(assert (= (and d!64599 res!155906) b!187202))

(declare-fun m!291119 () Bool)

(assert (=> d!64599 m!291119))

(declare-fun m!291121 () Bool)

(assert (=> d!64599 m!291121))

(declare-fun m!291123 () Bool)

(assert (=> d!64599 m!291123))

(declare-fun m!291125 () Bool)

(assert (=> d!64599 m!291125))

(assert (=> b!186971 d!64599))

(declare-fun d!64601 () Bool)

(assert (=> d!64601 (= (invariant!0 (currentBit!9053 thiss!1204) (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204))) (and (bvsge (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9053 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9058 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204))) (and (= (currentBit!9053 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9058 thiss!1204) (size!4336 (buf!4802 thiss!1204)))))))))

(assert (=> b!186981 d!64601))

(declare-fun d!64603 () Bool)

(declare-fun e!129462 () Bool)

(assert (=> d!64603 e!129462))

(declare-fun res!155907 () Bool)

(assert (=> d!64603 (=> (not res!155907) (not e!129462))))

(declare-fun lt!289749 () (_ BitVec 64))

(declare-fun lt!289745 () (_ BitVec 64))

(declare-fun lt!289746 () (_ BitVec 64))

(assert (=> d!64603 (= res!155907 (= lt!289745 (bvsub lt!289746 lt!289749)))))

(assert (=> d!64603 (or (= (bvand lt!289746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289746 lt!289749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64603 (= lt!289749 (remainingBits!0 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289297))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289297)))))))

(declare-fun lt!289744 () (_ BitVec 64))

(declare-fun lt!289748 () (_ BitVec 64))

(assert (=> d!64603 (= lt!289746 (bvmul lt!289744 lt!289748))))

(assert (=> d!64603 (or (= lt!289744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289748 (bvsdiv (bvmul lt!289744 lt!289748) lt!289744)))))

(assert (=> d!64603 (= lt!289748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64603 (= lt!289744 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))))))

(assert (=> d!64603 (= lt!289745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289297))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289297)))))))

(assert (=> d!64603 (invariant!0 (currentBit!9053 (_2!8729 lt!289297)) (currentByte!9058 (_2!8729 lt!289297)) (size!4336 (buf!4802 (_2!8729 lt!289297))))))

(assert (=> d!64603 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297))) lt!289745)))

(declare-fun b!187203 () Bool)

(declare-fun res!155908 () Bool)

(assert (=> b!187203 (=> (not res!155908) (not e!129462))))

(assert (=> b!187203 (= res!155908 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289745))))

(declare-fun b!187204 () Bool)

(declare-fun lt!289747 () (_ BitVec 64))

(assert (=> b!187204 (= e!129462 (bvsle lt!289745 (bvmul lt!289747 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187204 (or (= lt!289747 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289747 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289747)))))

(assert (=> b!187204 (= lt!289747 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289297)))))))

(assert (= (and d!64603 res!155907) b!187203))

(assert (= (and b!187203 res!155908) b!187204))

(declare-fun m!291127 () Bool)

(assert (=> d!64603 m!291127))

(assert (=> d!64603 m!290763))

(assert (=> b!186972 d!64603))

(declare-fun d!64605 () Bool)

(declare-fun res!155910 () Bool)

(declare-fun e!129464 () Bool)

(assert (=> d!64605 (=> (not res!155910) (not e!129464))))

(assert (=> d!64605 (= res!155910 (= (size!4336 (buf!4802 thiss!1204)) (size!4336 (buf!4802 (_2!8729 lt!289297)))))))

(assert (=> d!64605 (= (isPrefixOf!0 thiss!1204 (_2!8729 lt!289297)) e!129464)))

(declare-fun b!187205 () Bool)

(declare-fun res!155911 () Bool)

(assert (=> b!187205 (=> (not res!155911) (not e!129464))))

(assert (=> b!187205 (= res!155911 (bvsle (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204)) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289297))) (currentByte!9058 (_2!8729 lt!289297)) (currentBit!9053 (_2!8729 lt!289297)))))))

(declare-fun b!187206 () Bool)

(declare-fun e!129463 () Bool)

(assert (=> b!187206 (= e!129464 e!129463)))

(declare-fun res!155909 () Bool)

(assert (=> b!187206 (=> res!155909 e!129463)))

(assert (=> b!187206 (= res!155909 (= (size!4336 (buf!4802 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187207 () Bool)

(assert (=> b!187207 (= e!129463 (arrayBitRangesEq!0 (buf!4802 thiss!1204) (buf!4802 (_2!8729 lt!289297)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4336 (buf!4802 thiss!1204)) (currentByte!9058 thiss!1204) (currentBit!9053 thiss!1204))))))

(assert (= (and d!64605 res!155910) b!187205))

(assert (= (and b!187205 res!155911) b!187206))

(assert (= (and b!187206 (not res!155909)) b!187207))

(assert (=> b!187205 m!290723))

(assert (=> b!187205 m!290701))

(assert (=> b!187207 m!290723))

(assert (=> b!187207 m!290723))

(declare-fun m!291129 () Bool)

(assert (=> b!187207 m!291129))

(assert (=> b!186972 d!64605))

(declare-fun d!64607 () Bool)

(assert (=> d!64607 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289297))))

(declare-fun lt!289752 () Unit!13367)

(declare-fun choose!30 (BitStream!7780 BitStream!7780 BitStream!7780) Unit!13367)

(assert (=> d!64607 (= lt!289752 (choose!30 thiss!1204 (_2!8729 lt!289289) (_2!8729 lt!289297)))))

(assert (=> d!64607 (isPrefixOf!0 thiss!1204 (_2!8729 lt!289289))))

(assert (=> d!64607 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8729 lt!289289) (_2!8729 lt!289297)) lt!289752)))

(declare-fun bs!16072 () Bool)

(assert (= bs!16072 d!64607))

(assert (=> bs!16072 m!290703))

(declare-fun m!291131 () Bool)

(assert (=> bs!16072 m!291131))

(assert (=> bs!16072 m!290697))

(assert (=> b!186972 d!64607))

(declare-fun b!187298 () Bool)

(declare-fun e!129521 () tuple2!16168)

(declare-fun lt!290028 () tuple2!16168)

(assert (=> b!187298 (= e!129521 (tuple2!16169 (_1!8729 lt!290028) (_2!8729 lt!290028)))))

(declare-fun lt!290044 () Bool)

(assert (=> b!187298 (= lt!290044 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!290001 () tuple2!16168)

(assert (=> b!187298 (= lt!290001 (appendBit!0 (_2!8729 lt!289289) lt!290044))))

(declare-fun res!155993 () Bool)

(assert (=> b!187298 (= res!155993 (= (size!4336 (buf!4802 (_2!8729 lt!289289))) (size!4336 (buf!4802 (_2!8729 lt!290001)))))))

(declare-fun e!129514 () Bool)

(assert (=> b!187298 (=> (not res!155993) (not e!129514))))

(assert (=> b!187298 e!129514))

(declare-fun lt!289992 () tuple2!16168)

(assert (=> b!187298 (= lt!289992 lt!290001)))

(assert (=> b!187298 (= lt!290028 (appendBitsLSBFirstLoopTR!0 (_2!8729 lt!289992) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!289995 () Unit!13367)

(assert (=> b!187298 (= lt!289995 (lemmaIsPrefixTransitive!0 (_2!8729 lt!289289) (_2!8729 lt!289992) (_2!8729 lt!290028)))))

(declare-fun call!3008 () Bool)

(assert (=> b!187298 call!3008))

(declare-fun lt!290042 () Unit!13367)

(assert (=> b!187298 (= lt!290042 lt!289995)))

(assert (=> b!187298 (invariant!0 (currentBit!9053 (_2!8729 lt!289289)) (currentByte!9058 (_2!8729 lt!289289)) (size!4336 (buf!4802 (_2!8729 lt!289992))))))

(declare-fun lt!290043 () BitStream!7780)

(assert (=> b!187298 (= lt!290043 (BitStream!7781 (buf!4802 (_2!8729 lt!289992)) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(assert (=> b!187298 (invariant!0 (currentBit!9053 lt!290043) (currentByte!9058 lt!290043) (size!4336 (buf!4802 (_2!8729 lt!290028))))))

(declare-fun lt!290021 () BitStream!7780)

(assert (=> b!187298 (= lt!290021 (BitStream!7781 (buf!4802 (_2!8729 lt!290028)) (currentByte!9058 lt!290043) (currentBit!9053 lt!290043)))))

(declare-fun lt!289997 () tuple2!16170)

(assert (=> b!187298 (= lt!289997 (readBitPure!0 lt!290043))))

(declare-fun lt!290039 () tuple2!16170)

(assert (=> b!187298 (= lt!290039 (readBitPure!0 lt!290021))))

(declare-fun lt!290038 () Unit!13367)

(assert (=> b!187298 (= lt!290038 (readBitPrefixLemma!0 lt!290043 (_2!8729 lt!290028)))))

(declare-fun res!155990 () Bool)

(assert (=> b!187298 (= res!155990 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!289997))) (currentByte!9058 (_1!8730 lt!289997)) (currentBit!9053 (_1!8730 lt!289997))) (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!290039))) (currentByte!9058 (_1!8730 lt!290039)) (currentBit!9053 (_1!8730 lt!290039)))))))

(declare-fun e!129520 () Bool)

(assert (=> b!187298 (=> (not res!155990) (not e!129520))))

(assert (=> b!187298 e!129520))

(declare-fun lt!289989 () Unit!13367)

(assert (=> b!187298 (= lt!289989 lt!290038)))

(declare-fun lt!289993 () tuple2!16164)

(assert (=> b!187298 (= lt!289993 (reader!0 (_2!8729 lt!289289) (_2!8729 lt!290028)))))

(declare-fun lt!290032 () tuple2!16164)

(assert (=> b!187298 (= lt!290032 (reader!0 (_2!8729 lt!289992) (_2!8729 lt!290028)))))

(declare-fun lt!290005 () tuple2!16170)

(assert (=> b!187298 (= lt!290005 (readBitPure!0 (_1!8727 lt!289993)))))

(assert (=> b!187298 (= (_2!8730 lt!290005) lt!290044)))

(declare-fun lt!290033 () Unit!13367)

(declare-fun Unit!13375 () Unit!13367)

(assert (=> b!187298 (= lt!290033 Unit!13375)))

(declare-fun lt!290020 () (_ BitVec 64))

(assert (=> b!187298 (= lt!290020 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290007 () (_ BitVec 64))

(assert (=> b!187298 (= lt!290007 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290037 () Unit!13367)

(assert (=> b!187298 (= lt!290037 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!290028)) lt!290007))))

(assert (=> b!187298 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!290028)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!290007)))

(declare-fun lt!290034 () Unit!13367)

(assert (=> b!187298 (= lt!290034 lt!290037)))

(declare-fun lt!290000 () tuple2!16166)

(assert (=> b!187298 (= lt!290000 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290020))))

(declare-fun lt!290031 () (_ BitVec 64))

(assert (=> b!187298 (= lt!290031 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!289991 () Unit!13367)

(assert (=> b!187298 (= lt!289991 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289992) (buf!4802 (_2!8729 lt!290028)) lt!290031))))

(assert (=> b!187298 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!290028)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289992))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289992))) lt!290031)))

(declare-fun lt!290016 () Unit!13367)

(assert (=> b!187298 (= lt!290016 lt!289991)))

(declare-fun lt!289996 () tuple2!16166)

(assert (=> b!187298 (= lt!289996 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!290032) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!290020 (ite (_2!8730 lt!290005) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!290030 () tuple2!16166)

(assert (=> b!187298 (= lt!290030 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!289993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290020))))

(declare-fun c!9550 () Bool)

(assert (=> b!187298 (= c!9550 (_2!8730 (readBitPure!0 (_1!8727 lt!289993))))))

(declare-fun e!129517 () (_ BitVec 64))

(declare-fun lt!290003 () tuple2!16166)

(assert (=> b!187298 (= lt!290003 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8727 lt!289993) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!290020 e!129517)))))

(declare-fun lt!290041 () Unit!13367)

(assert (=> b!187298 (= lt!290041 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8727 lt!289993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290020))))

(assert (=> b!187298 (and (= (_2!8728 lt!290030) (_2!8728 lt!290003)) (= (_1!8728 lt!290030) (_1!8728 lt!290003)))))

(declare-fun lt!290010 () Unit!13367)

(assert (=> b!187298 (= lt!290010 lt!290041)))

(assert (=> b!187298 (= (_1!8727 lt!289993) (withMovedBitIndex!0 (_2!8727 lt!289993) (bvsub (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!290028))) (currentByte!9058 (_2!8729 lt!290028)) (currentBit!9053 (_2!8729 lt!290028))))))))

(declare-fun lt!290013 () Unit!13367)

(declare-fun Unit!13376 () Unit!13367)

(assert (=> b!187298 (= lt!290013 Unit!13376)))

(assert (=> b!187298 (= (_1!8727 lt!290032) (withMovedBitIndex!0 (_2!8727 lt!290032) (bvsub (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289992))) (currentByte!9058 (_2!8729 lt!289992)) (currentBit!9053 (_2!8729 lt!289992))) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!290028))) (currentByte!9058 (_2!8729 lt!290028)) (currentBit!9053 (_2!8729 lt!290028))))))))

(declare-fun lt!290004 () Unit!13367)

(declare-fun Unit!13377 () Unit!13367)

(assert (=> b!187298 (= lt!290004 Unit!13377)))

(assert (=> b!187298 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) (bvsub (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289992))) (currentByte!9058 (_2!8729 lt!289992)) (currentBit!9053 (_2!8729 lt!289992))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!290024 () Unit!13367)

(declare-fun Unit!13378 () Unit!13367)

(assert (=> b!187298 (= lt!290024 Unit!13378)))

(assert (=> b!187298 (= (_2!8728 lt!290000) (_2!8728 lt!289996))))

(declare-fun lt!290009 () Unit!13367)

(declare-fun Unit!13379 () Unit!13367)

(assert (=> b!187298 (= lt!290009 Unit!13379)))

(assert (=> b!187298 (invariant!0 (currentBit!9053 (_2!8729 lt!290028)) (currentByte!9058 (_2!8729 lt!290028)) (size!4336 (buf!4802 (_2!8729 lt!290028))))))

(declare-fun lt!289999 () Unit!13367)

(declare-fun Unit!13380 () Unit!13367)

(assert (=> b!187298 (= lt!289999 Unit!13380)))

(assert (=> b!187298 (= (size!4336 (buf!4802 (_2!8729 lt!289289))) (size!4336 (buf!4802 (_2!8729 lt!290028))))))

(declare-fun lt!290019 () Unit!13367)

(declare-fun Unit!13381 () Unit!13367)

(assert (=> b!187298 (= lt!290019 Unit!13381)))

(assert (=> b!187298 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!290028))) (currentByte!9058 (_2!8729 lt!290028)) (currentBit!9053 (_2!8729 lt!290028))) (bvsub (bvadd (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290036 () Unit!13367)

(declare-fun Unit!13382 () Unit!13367)

(assert (=> b!187298 (= lt!290036 Unit!13382)))

(declare-fun lt!290014 () Unit!13367)

(declare-fun Unit!13383 () Unit!13367)

(assert (=> b!187298 (= lt!290014 Unit!13383)))

(declare-fun lt!290026 () tuple2!16164)

(assert (=> b!187298 (= lt!290026 (reader!0 (_2!8729 lt!289289) (_2!8729 lt!290028)))))

(declare-fun lt!290027 () (_ BitVec 64))

(assert (=> b!187298 (= lt!290027 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290029 () Unit!13367)

(assert (=> b!187298 (= lt!290029 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!290028)) lt!290027))))

(assert (=> b!187298 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!290028)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!290027)))

(declare-fun lt!290018 () Unit!13367)

(assert (=> b!187298 (= lt!290018 lt!290029)))

(declare-fun lt!290015 () tuple2!16166)

(assert (=> b!187298 (= lt!290015 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!290026) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!155992 () Bool)

(assert (=> b!187298 (= res!155992 (= (_2!8728 lt!290015) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129522 () Bool)

(assert (=> b!187298 (=> (not res!155992) (not e!129522))))

(assert (=> b!187298 e!129522))

(declare-fun lt!290040 () Unit!13367)

(declare-fun Unit!13384 () Unit!13367)

(assert (=> b!187298 (= lt!290040 Unit!13384)))

(declare-fun d!64609 () Bool)

(declare-fun e!129515 () Bool)

(assert (=> d!64609 e!129515))

(declare-fun res!155987 () Bool)

(assert (=> d!64609 (=> (not res!155987) (not e!129515))))

(declare-fun lt!289998 () tuple2!16168)

(assert (=> d!64609 (= res!155987 (invariant!0 (currentBit!9053 (_2!8729 lt!289998)) (currentByte!9058 (_2!8729 lt!289998)) (size!4336 (buf!4802 (_2!8729 lt!289998)))))))

(assert (=> d!64609 (= lt!289998 e!129521)))

(declare-fun c!9549 () Bool)

(assert (=> d!64609 (= c!9549 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64609 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64609 (= (appendBitsLSBFirstLoopTR!0 (_2!8729 lt!289289) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!289998)))

(declare-fun b!187299 () Bool)

(declare-fun Unit!13385 () Unit!13367)

(assert (=> b!187299 (= e!129521 (tuple2!16169 Unit!13385 (_2!8729 lt!289289)))))

(declare-fun lt!290023 () Unit!13367)

(assert (=> b!187299 (= lt!290023 (lemmaIsPrefixRefl!0 (_2!8729 lt!289289)))))

(assert (=> b!187299 call!3008))

(declare-fun lt!290025 () Unit!13367)

(assert (=> b!187299 (= lt!290025 lt!290023)))

(declare-fun bm!3005 () Bool)

(assert (=> bm!3005 (= call!3008 (isPrefixOf!0 (_2!8729 lt!289289) (ite c!9549 (_2!8729 lt!289289) (_2!8729 lt!290028))))))

(declare-fun b!187300 () Bool)

(declare-fun e!129519 () Bool)

(declare-fun lt!289994 () tuple2!16166)

(declare-fun lt!290006 () tuple2!16164)

(assert (=> b!187300 (= e!129519 (= (_1!8728 lt!289994) (_2!8727 lt!290006)))))

(declare-fun b!187301 () Bool)

(declare-fun lt!290017 () tuple2!16170)

(assert (=> b!187301 (= lt!290017 (readBitPure!0 (readerFrom!0 (_2!8729 lt!290001) (currentBit!9053 (_2!8729 lt!289289)) (currentByte!9058 (_2!8729 lt!289289)))))))

(declare-fun res!155989 () Bool)

(assert (=> b!187301 (= res!155989 (and (= (_2!8730 lt!290017) lt!290044) (= (_1!8730 lt!290017) (_2!8729 lt!290001))))))

(declare-fun e!129518 () Bool)

(assert (=> b!187301 (=> (not res!155989) (not e!129518))))

(assert (=> b!187301 (= e!129514 e!129518)))

(declare-fun b!187302 () Bool)

(declare-fun e!129516 () Bool)

(declare-fun lt!290012 () (_ BitVec 64))

(assert (=> b!187302 (= e!129516 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289289)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!290012))))

(declare-fun b!187303 () Bool)

(declare-fun res!155994 () Bool)

(assert (=> b!187303 (= res!155994 (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!290001)))))

(assert (=> b!187303 (=> (not res!155994) (not e!129514))))

(declare-fun b!187304 () Bool)

(assert (=> b!187304 (= e!129515 e!129519)))

(declare-fun res!155997 () Bool)

(assert (=> b!187304 (=> (not res!155997) (not e!129519))))

(assert (=> b!187304 (= res!155997 (= (_2!8728 lt!289994) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!187304 (= lt!289994 (readNBitsLSBFirstsLoopPure!0 (_1!8727 lt!290006) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!290011 () Unit!13367)

(declare-fun lt!290008 () Unit!13367)

(assert (=> b!187304 (= lt!290011 lt!290008)))

(assert (=> b!187304 (validate_offset_bits!1 ((_ sign_extend 32) (size!4336 (buf!4802 (_2!8729 lt!289998)))) ((_ sign_extend 32) (currentByte!9058 (_2!8729 lt!289289))) ((_ sign_extend 32) (currentBit!9053 (_2!8729 lt!289289))) lt!290012)))

(assert (=> b!187304 (= lt!290008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8729 lt!289289) (buf!4802 (_2!8729 lt!289998)) lt!290012))))

(assert (=> b!187304 e!129516))

(declare-fun res!155986 () Bool)

(assert (=> b!187304 (=> (not res!155986) (not e!129516))))

(assert (=> b!187304 (= res!155986 (and (= (size!4336 (buf!4802 (_2!8729 lt!289289))) (size!4336 (buf!4802 (_2!8729 lt!289998)))) (bvsge lt!290012 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187304 (= lt!290012 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!187304 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!187304 (= lt!290006 (reader!0 (_2!8729 lt!289289) (_2!8729 lt!289998)))))

(declare-fun b!187305 () Bool)

(declare-fun res!155996 () Bool)

(assert (=> b!187305 (= res!155996 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!290001))) (currentByte!9058 (_2!8729 lt!290001)) (currentBit!9053 (_2!8729 lt!290001))) (bvadd (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!187305 (=> (not res!155996) (not e!129514))))

(declare-fun b!187306 () Bool)

(declare-fun res!155995 () Bool)

(assert (=> b!187306 (=> (not res!155995) (not e!129515))))

(assert (=> b!187306 (= res!155995 (= (size!4336 (buf!4802 (_2!8729 lt!289289))) (size!4336 (buf!4802 (_2!8729 lt!289998)))))))

(declare-fun b!187307 () Bool)

(assert (=> b!187307 (= e!129517 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!187308 () Bool)

(assert (=> b!187308 (= e!129517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!187309 () Bool)

(declare-fun res!155988 () Bool)

(assert (=> b!187309 (=> (not res!155988) (not e!129515))))

(assert (=> b!187309 (= res!155988 (isPrefixOf!0 (_2!8729 lt!289289) (_2!8729 lt!289998)))))

(declare-fun b!187310 () Bool)

(assert (=> b!187310 (= e!129522 (= (_1!8728 lt!290015) (_2!8727 lt!290026)))))

(declare-fun b!187311 () Bool)

(assert (=> b!187311 (= e!129520 (= (_2!8730 lt!289997) (_2!8730 lt!290039)))))

(declare-fun b!187312 () Bool)

(declare-fun res!155991 () Bool)

(assert (=> b!187312 (=> (not res!155991) (not e!129515))))

(declare-fun lt!290035 () (_ BitVec 64))

(declare-fun lt!290022 () (_ BitVec 64))

(assert (=> b!187312 (= res!155991 (= (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289998))) (currentByte!9058 (_2!8729 lt!289998)) (currentBit!9053 (_2!8729 lt!289998))) (bvsub lt!290035 lt!290022)))))

(assert (=> b!187312 (or (= (bvand lt!290035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290022 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290035 lt!290022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187312 (= lt!290022 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!290002 () (_ BitVec 64))

(declare-fun lt!289990 () (_ BitVec 64))

(assert (=> b!187312 (= lt!290035 (bvadd lt!290002 lt!289990))))

(assert (=> b!187312 (or (not (= (bvand lt!290002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289990 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290002 lt!289990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187312 (= lt!289990 ((_ sign_extend 32) nBits!348))))

(assert (=> b!187312 (= lt!290002 (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!289289))) (currentByte!9058 (_2!8729 lt!289289)) (currentBit!9053 (_2!8729 lt!289289))))))

(declare-fun b!187313 () Bool)

(assert (=> b!187313 (= e!129518 (= (bitIndex!0 (size!4336 (buf!4802 (_1!8730 lt!290017))) (currentByte!9058 (_1!8730 lt!290017)) (currentBit!9053 (_1!8730 lt!290017))) (bitIndex!0 (size!4336 (buf!4802 (_2!8729 lt!290001))) (currentByte!9058 (_2!8729 lt!290001)) (currentBit!9053 (_2!8729 lt!290001)))))))

(assert (= (and d!64609 c!9549) b!187299))

(assert (= (and d!64609 (not c!9549)) b!187298))

(assert (= (and b!187298 res!155993) b!187305))

(assert (= (and b!187305 res!155996) b!187303))

(assert (= (and b!187303 res!155994) b!187301))

(assert (= (and b!187301 res!155989) b!187313))

(assert (= (and b!187298 res!155990) b!187311))

(assert (= (and b!187298 c!9550) b!187307))

(assert (= (and b!187298 (not c!9550)) b!187308))

(assert (= (and b!187298 res!155992) b!187310))

(assert (= (or b!187299 b!187298) bm!3005))

(assert (= (and d!64609 res!155987) b!187306))

(assert (= (and b!187306 res!155995) b!187312))

(assert (= (and b!187312 res!155991) b!187309))

(assert (= (and b!187309 res!155988) b!187304))

(assert (= (and b!187304 res!155986) b!187302))

(assert (= (and b!187304 res!155997) b!187300))

(declare-fun m!291239 () Bool)

(assert (=> bm!3005 m!291239))

(declare-fun m!291241 () Bool)

(assert (=> b!187313 m!291241))

(declare-fun m!291243 () Bool)

(assert (=> b!187313 m!291243))

(declare-fun m!291245 () Bool)

(assert (=> b!187309 m!291245))

(declare-fun m!291247 () Bool)

(assert (=> b!187312 m!291247))

(assert (=> b!187312 m!290721))

(declare-fun m!291249 () Bool)

(assert (=> b!187304 m!291249))

(declare-fun m!291251 () Bool)

(assert (=> b!187304 m!291251))

(declare-fun m!291253 () Bool)

(assert (=> b!187304 m!291253))

(declare-fun m!291255 () Bool)

(assert (=> b!187304 m!291255))

(declare-fun m!291257 () Bool)

(assert (=> b!187304 m!291257))

(declare-fun m!291259 () Bool)

(assert (=> b!187304 m!291259))

(assert (=> b!187299 m!291093))

(assert (=> b!187305 m!291243))

(assert (=> b!187305 m!290721))

(declare-fun m!291261 () Bool)

(assert (=> b!187301 m!291261))

(assert (=> b!187301 m!291261))

(declare-fun m!291263 () Bool)

(assert (=> b!187301 m!291263))

(declare-fun m!291265 () Bool)

(assert (=> b!187303 m!291265))

(declare-fun m!291267 () Bool)

(assert (=> b!187302 m!291267))

(declare-fun m!291269 () Bool)

(assert (=> b!187298 m!291269))

(declare-fun m!291271 () Bool)

(assert (=> b!187298 m!291271))

(assert (=> b!187298 m!291251))

(assert (=> b!187298 m!290721))

(declare-fun m!291273 () Bool)

(assert (=> b!187298 m!291273))

(declare-fun m!291275 () Bool)

(assert (=> b!187298 m!291275))

(declare-fun m!291277 () Bool)

(assert (=> b!187298 m!291277))

(declare-fun m!291279 () Bool)

(assert (=> b!187298 m!291279))

(declare-fun m!291281 () Bool)

(assert (=> b!187298 m!291281))

(declare-fun m!291283 () Bool)

(assert (=> b!187298 m!291283))

(declare-fun m!291285 () Bool)

(assert (=> b!187298 m!291285))

(declare-fun m!291287 () Bool)

(assert (=> b!187298 m!291287))

(declare-fun m!291289 () Bool)

(assert (=> b!187298 m!291289))

(declare-fun m!291291 () Bool)

(assert (=> b!187298 m!291291))

(declare-fun m!291293 () Bool)

(assert (=> b!187298 m!291293))

(declare-fun m!291295 () Bool)

(assert (=> b!187298 m!291295))

(declare-fun m!291297 () Bool)

(assert (=> b!187298 m!291297))

(declare-fun m!291299 () Bool)

(assert (=> b!187298 m!291299))

(declare-fun m!291301 () Bool)

(assert (=> b!187298 m!291301))

(declare-fun m!291303 () Bool)

(assert (=> b!187298 m!291303))

(declare-fun m!291305 () Bool)

(assert (=> b!187298 m!291305))

(declare-fun m!291307 () Bool)

(assert (=> b!187298 m!291307))

(declare-fun m!291309 () Bool)

(assert (=> b!187298 m!291309))

(declare-fun m!291311 () Bool)

(assert (=> b!187298 m!291311))

(declare-fun m!291313 () Bool)

(assert (=> b!187298 m!291313))

(assert (=> b!187298 m!291311))

(declare-fun m!291315 () Bool)

(assert (=> b!187298 m!291315))

(assert (=> b!187298 m!291255))

(declare-fun m!291317 () Bool)

(assert (=> b!187298 m!291317))

(declare-fun m!291319 () Bool)

(assert (=> b!187298 m!291319))

(declare-fun m!291321 () Bool)

(assert (=> b!187298 m!291321))

(declare-fun m!291323 () Bool)

(assert (=> b!187298 m!291323))

(declare-fun m!291325 () Bool)

(assert (=> b!187298 m!291325))

(declare-fun m!291327 () Bool)

(assert (=> b!187298 m!291327))

(declare-fun m!291329 () Bool)

(assert (=> d!64609 m!291329))

(assert (=> b!186972 d!64609))

(push 1)

(assert (not d!64609))

(assert (not b!187301))

(assert (not b!187195))

(assert (not d!64525))

(assert (not b!187313))

(assert (not d!64533))

(assert (not d!64495))

(assert (not b!187309))

(assert (not d!64501))

(assert (not d!64493))

(assert (not d!64553))

(assert (not b!187205))

(assert (not d!64559))

(assert (not b!187175))

(assert (not b!187148))

(assert (not d!64497))

(assert (not b!187303))

(assert (not b!187127))

(assert (not b!187194))

(assert (not b!187137))

(assert (not d!64563))

(assert (not d!64593))

(assert (not d!64523))

(assert (not d!64513))

(assert (not d!64549))

(assert (not b!187304))

(assert (not d!64509))

(assert (not b!187302))

(assert (not d!64511))

(assert (not d!64561))

(assert (not d!64583))

(assert (not d!64603))

(assert (not b!187305))

(assert (not b!187147))

(assert (not d!64535))

(assert (not d!64573))

(assert (not b!187173))

(assert (not b!187149))

(assert (not b!187298))

(assert (not d!64567))

(assert (not b!187172))

(assert (not d!64507))

(assert (not b!187174))

(assert (not bm!3005))

(assert (not b!187193))

(assert (not b!187135))

(assert (not d!64517))

(assert (not d!64565))

(assert (not d!64599))

(assert (not b!187196))

(assert (not b!187312))

(assert (not d!64607))

(assert (not b!187207))

(assert (not b!187150))

(assert (not b!187201))

(assert (not d!64505))

(assert (not d!64579))

(assert (not b!187157))

(assert (not b!187199))

(assert (not b!187299))

(assert (not d!64529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

