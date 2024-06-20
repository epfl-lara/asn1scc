; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45268 () Bool)

(assert start!45268)

(declare-fun b!218367 () Bool)

(declare-fun e!148378 () Bool)

(declare-fun e!148384 () Bool)

(assert (=> b!218367 (= e!148378 e!148384)))

(declare-fun res!183816 () Bool)

(assert (=> b!218367 (=> (not res!183816) (not e!148384))))

(declare-datatypes ((array!10632 0))(
  ( (array!10633 (arr!5598 (Array (_ BitVec 32) (_ BitVec 8))) (size!4668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8444 0))(
  ( (BitStream!8445 (buf!5215 array!10632) (currentByte!9814 (_ BitVec 32)) (currentBit!9809 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8444)

(declare-fun lt!346041 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218367 (= res!183816 (validate_offset_bits!1 ((_ sign_extend 32) (size!4668 (buf!5215 thiss!1204))) ((_ sign_extend 32) (currentByte!9814 thiss!1204)) ((_ sign_extend 32) (currentBit!9809 thiss!1204)) lt!346041))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!218367 (= lt!346041 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!183809 () Bool)

(assert (=> start!45268 (=> (not res!183809) (not e!148378))))

(assert (=> start!45268 (= res!183809 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45268 e!148378))

(assert (=> start!45268 true))

(declare-fun e!148376 () Bool)

(declare-fun inv!12 (BitStream!8444) Bool)

(assert (=> start!45268 (and (inv!12 thiss!1204) e!148376)))

(declare-fun b!218368 () Bool)

(declare-fun e!148380 () Bool)

(declare-fun e!148387 () Bool)

(assert (=> b!218368 (= e!148380 e!148387)))

(declare-fun res!183804 () Bool)

(assert (=> b!218368 (=> (not res!183804) (not e!148387))))

(declare-fun lt!346043 () Bool)

(declare-datatypes ((tuple2!18606 0))(
  ( (tuple2!18607 (_1!9961 BitStream!8444) (_2!9961 Bool)) )
))
(declare-fun lt!346039 () tuple2!18606)

(declare-datatypes ((Unit!15533 0))(
  ( (Unit!15534) )
))
(declare-datatypes ((tuple2!18608 0))(
  ( (tuple2!18609 (_1!9962 Unit!15533) (_2!9962 BitStream!8444)) )
))
(declare-fun lt!346059 () tuple2!18608)

(assert (=> b!218368 (= res!183804 (and (= (_2!9961 lt!346039) lt!346043) (= (_1!9961 lt!346039) (_2!9962 lt!346059))))))

(declare-fun readBitPure!0 (BitStream!8444) tuple2!18606)

(declare-fun readerFrom!0 (BitStream!8444 (_ BitVec 32) (_ BitVec 32)) BitStream!8444)

(assert (=> b!218368 (= lt!346039 (readBitPure!0 (readerFrom!0 (_2!9962 lt!346059) (currentBit!9809 thiss!1204) (currentByte!9814 thiss!1204))))))

(declare-fun b!218369 () Bool)

(declare-fun res!183815 () Bool)

(declare-fun e!148389 () Bool)

(assert (=> b!218369 (=> (not res!183815) (not e!148389))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!18610 0))(
  ( (tuple2!18611 (_1!9963 BitStream!8444) (_2!9963 (_ BitVec 64))) )
))
(declare-fun lt!346038 () tuple2!18610)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218369 (= res!183815 (= (_2!9963 lt!346038) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218370 () Bool)

(declare-fun res!183825 () Bool)

(assert (=> b!218370 (=> (not res!183825) (not e!148380))))

(declare-fun isPrefixOf!0 (BitStream!8444 BitStream!8444) Bool)

(assert (=> b!218370 (= res!183825 (isPrefixOf!0 thiss!1204 (_2!9962 lt!346059)))))

(declare-fun b!218371 () Bool)

(declare-fun array_inv!4409 (array!10632) Bool)

(assert (=> b!218371 (= e!148376 (array_inv!4409 (buf!5215 thiss!1204)))))

(declare-fun b!218372 () Bool)

(declare-fun lt!346052 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218372 (= e!148387 (= (bitIndex!0 (size!4668 (buf!5215 (_1!9961 lt!346039))) (currentByte!9814 (_1!9961 lt!346039)) (currentBit!9809 (_1!9961 lt!346039))) lt!346052))))

(declare-fun lt!346050 () (_ BitVec 64))

(declare-fun lt!346061 () tuple2!18610)

(declare-fun lt!346053 () BitStream!8444)

(declare-fun lt!346058 () (_ BitVec 64))

(declare-datatypes ((tuple2!18612 0))(
  ( (tuple2!18613 (_1!9964 BitStream!8444) (_2!9964 BitStream!8444)) )
))
(declare-fun lt!346042 () tuple2!18612)

(declare-fun b!218373 () Bool)

(declare-fun e!148377 () Bool)

(assert (=> b!218373 (= e!148377 (and (= lt!346058 (bvsub lt!346050 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9964 lt!346042) lt!346053)) (= (_2!9963 lt!346038) (_2!9963 lt!346061)))))))

(declare-fun b!218374 () Bool)

(declare-fun e!148388 () Bool)

(assert (=> b!218374 (= e!148384 (not e!148388))))

(declare-fun res!183806 () Bool)

(assert (=> b!218374 (=> res!183806 e!148388)))

(assert (=> b!218374 (= res!183806 (not (= lt!346050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346058))))))

(assert (=> b!218374 (= lt!346050 (bitIndex!0 (size!4668 (buf!5215 (_2!9962 lt!346059))) (currentByte!9814 (_2!9962 lt!346059)) (currentBit!9809 (_2!9962 lt!346059))))))

(assert (=> b!218374 (= lt!346058 (bitIndex!0 (size!4668 (buf!5215 thiss!1204)) (currentByte!9814 thiss!1204) (currentBit!9809 thiss!1204)))))

(declare-fun e!148385 () Bool)

(assert (=> b!218374 e!148385))

(declare-fun res!183814 () Bool)

(assert (=> b!218374 (=> (not res!183814) (not e!148385))))

(assert (=> b!218374 (= res!183814 (= (size!4668 (buf!5215 thiss!1204)) (size!4668 (buf!5215 (_2!9962 lt!346059)))))))

(declare-fun appendBit!0 (BitStream!8444 Bool) tuple2!18608)

(assert (=> b!218374 (= lt!346059 (appendBit!0 thiss!1204 lt!346043))))

(declare-fun lt!346040 () (_ BitVec 64))

(assert (=> b!218374 (= lt!346043 (not (= (bvand v!189 lt!346040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218374 (= lt!346040 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!218375 () Bool)

(declare-fun e!148381 () Bool)

(assert (=> b!218375 (= e!148388 e!148381)))

(declare-fun res!183820 () Bool)

(assert (=> b!218375 (=> res!183820 e!148381)))

(declare-fun lt!346049 () (_ BitVec 64))

(assert (=> b!218375 (= res!183820 (not (= lt!346049 (bvsub (bvsub (bvadd lt!346050 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!346054 () tuple2!18608)

(assert (=> b!218375 (= lt!346049 (bitIndex!0 (size!4668 (buf!5215 (_2!9962 lt!346054))) (currentByte!9814 (_2!9962 lt!346054)) (currentBit!9809 (_2!9962 lt!346054))))))

(assert (=> b!218375 (isPrefixOf!0 thiss!1204 (_2!9962 lt!346054))))

(declare-fun lt!346051 () Unit!15533)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8444 BitStream!8444 BitStream!8444) Unit!15533)

(assert (=> b!218375 (= lt!346051 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9962 lt!346059) (_2!9962 lt!346054)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8444 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18608)

(assert (=> b!218375 (= lt!346054 (appendBitsLSBFirstLoopTR!0 (_2!9962 lt!346059) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218376 () Bool)

(declare-fun e!148386 () Bool)

(assert (=> b!218376 (= e!148386 true)))

(assert (=> b!218376 e!148389))

(declare-fun res!183824 () Bool)

(assert (=> b!218376 (=> (not res!183824) (not e!148389))))

(assert (=> b!218376 (= res!183824 (= (size!4668 (buf!5215 thiss!1204)) (size!4668 (buf!5215 (_2!9962 lt!346054)))))))

(declare-fun b!218377 () Bool)

(declare-fun lt!346045 () tuple2!18612)

(assert (=> b!218377 (= e!148389 (= (_1!9963 lt!346038) (_2!9964 lt!346045)))))

(declare-fun b!218378 () Bool)

(declare-fun res!183811 () Bool)

(assert (=> b!218378 (=> res!183811 e!148381)))

(assert (=> b!218378 (= res!183811 (or (not (= (size!4668 (buf!5215 (_2!9962 lt!346054))) (size!4668 (buf!5215 thiss!1204)))) (not (= lt!346049 (bvsub (bvadd lt!346058 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!218379 () Bool)

(assert (=> b!218379 (= e!148385 e!148380)))

(declare-fun res!183818 () Bool)

(assert (=> b!218379 (=> (not res!183818) (not e!148380))))

(declare-fun lt!346034 () (_ BitVec 64))

(assert (=> b!218379 (= res!183818 (= lt!346052 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346034)))))

(assert (=> b!218379 (= lt!346052 (bitIndex!0 (size!4668 (buf!5215 (_2!9962 lt!346059))) (currentByte!9814 (_2!9962 lt!346059)) (currentBit!9809 (_2!9962 lt!346059))))))

(assert (=> b!218379 (= lt!346034 (bitIndex!0 (size!4668 (buf!5215 thiss!1204)) (currentByte!9814 thiss!1204) (currentBit!9809 thiss!1204)))))

(declare-fun b!218380 () Bool)

(declare-fun res!183826 () Bool)

(assert (=> b!218380 (=> (not res!183826) (not e!148377))))

(declare-fun withMovedBitIndex!0 (BitStream!8444 (_ BitVec 64)) BitStream!8444)

(assert (=> b!218380 (= res!183826 (= (_1!9964 lt!346045) (withMovedBitIndex!0 (_2!9964 lt!346045) (bvsub lt!346058 lt!346049))))))

(declare-fun b!218381 () Bool)

(declare-fun res!183805 () Bool)

(assert (=> b!218381 (=> res!183805 e!148386)))

(assert (=> b!218381 (= res!183805 (not (= (bitIndex!0 (size!4668 (buf!5215 (_1!9963 lt!346038))) (currentByte!9814 (_1!9963 lt!346038)) (currentBit!9809 (_1!9963 lt!346038))) (bitIndex!0 (size!4668 (buf!5215 (_2!9964 lt!346045))) (currentByte!9814 (_2!9964 lt!346045)) (currentBit!9809 (_2!9964 lt!346045))))))))

(declare-fun b!218382 () Bool)

(declare-fun e!148379 () Bool)

(declare-fun lt!346057 () tuple2!18606)

(declare-fun lt!346044 () tuple2!18606)

(assert (=> b!218382 (= e!148379 (= (_2!9961 lt!346057) (_2!9961 lt!346044)))))

(declare-fun b!218383 () Bool)

(declare-fun res!183827 () Bool)

(assert (=> b!218383 (=> (not res!183827) (not e!148377))))

(assert (=> b!218383 (= res!183827 (= (_1!9964 lt!346042) (withMovedBitIndex!0 (_2!9964 lt!346042) (bvsub lt!346050 lt!346049))))))

(declare-fun b!218384 () Bool)

(declare-fun res!183808 () Bool)

(assert (=> b!218384 (=> (not res!183808) (not e!148384))))

(assert (=> b!218384 (= res!183808 (not (= i!590 nBits!348)))))

(declare-fun b!218385 () Bool)

(declare-fun e!148375 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218385 (= e!148375 (invariant!0 (currentBit!9809 thiss!1204) (currentByte!9814 thiss!1204) (size!4668 (buf!5215 (_2!9962 lt!346054)))))))

(declare-fun b!218386 () Bool)

(declare-fun res!183807 () Bool)

(assert (=> b!218386 (=> res!183807 e!148381)))

(assert (=> b!218386 (= res!183807 (not (invariant!0 (currentBit!9809 (_2!9962 lt!346054)) (currentByte!9814 (_2!9962 lt!346054)) (size!4668 (buf!5215 (_2!9962 lt!346054))))))))

(declare-fun b!218387 () Bool)

(declare-fun e!148382 () Bool)

(assert (=> b!218387 (= e!148381 e!148382)))

(declare-fun res!183810 () Bool)

(assert (=> b!218387 (=> res!183810 e!148382)))

(assert (=> b!218387 (= res!183810 (not (= (_1!9963 lt!346061) (_2!9964 lt!346042))))))

(declare-fun lt!346060 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18610)

(assert (=> b!218387 (= lt!346061 (readNBitsLSBFirstsLoopPure!0 (_1!9964 lt!346042) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346060))))

(declare-fun lt!346056 () (_ BitVec 64))

(assert (=> b!218387 (validate_offset_bits!1 ((_ sign_extend 32) (size!4668 (buf!5215 (_2!9962 lt!346054)))) ((_ sign_extend 32) (currentByte!9814 (_2!9962 lt!346059))) ((_ sign_extend 32) (currentBit!9809 (_2!9962 lt!346059))) lt!346056)))

(declare-fun lt!346036 () Unit!15533)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8444 array!10632 (_ BitVec 64)) Unit!15533)

(assert (=> b!218387 (= lt!346036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9962 lt!346059) (buf!5215 (_2!9962 lt!346054)) lt!346056))))

(assert (=> b!218387 (= lt!346056 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!346055 () tuple2!18606)

(declare-fun lt!346037 () (_ BitVec 64))

(assert (=> b!218387 (= lt!346060 (bvor lt!346037 (ite (_2!9961 lt!346055) lt!346040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218387 (= lt!346038 (readNBitsLSBFirstsLoopPure!0 (_1!9964 lt!346045) nBits!348 i!590 lt!346037))))

(assert (=> b!218387 (validate_offset_bits!1 ((_ sign_extend 32) (size!4668 (buf!5215 (_2!9962 lt!346054)))) ((_ sign_extend 32) (currentByte!9814 thiss!1204)) ((_ sign_extend 32) (currentBit!9809 thiss!1204)) lt!346041)))

(declare-fun lt!346047 () Unit!15533)

(assert (=> b!218387 (= lt!346047 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5215 (_2!9962 lt!346054)) lt!346041))))

(assert (=> b!218387 (= lt!346037 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218387 (= (_2!9961 lt!346055) lt!346043)))

(assert (=> b!218387 (= lt!346055 (readBitPure!0 (_1!9964 lt!346045)))))

(declare-fun reader!0 (BitStream!8444 BitStream!8444) tuple2!18612)

(assert (=> b!218387 (= lt!346042 (reader!0 (_2!9962 lt!346059) (_2!9962 lt!346054)))))

(assert (=> b!218387 (= lt!346045 (reader!0 thiss!1204 (_2!9962 lt!346054)))))

(assert (=> b!218387 e!148379))

(declare-fun res!183817 () Bool)

(assert (=> b!218387 (=> (not res!183817) (not e!148379))))

(assert (=> b!218387 (= res!183817 (= (bitIndex!0 (size!4668 (buf!5215 (_1!9961 lt!346057))) (currentByte!9814 (_1!9961 lt!346057)) (currentBit!9809 (_1!9961 lt!346057))) (bitIndex!0 (size!4668 (buf!5215 (_1!9961 lt!346044))) (currentByte!9814 (_1!9961 lt!346044)) (currentBit!9809 (_1!9961 lt!346044)))))))

(declare-fun lt!346033 () Unit!15533)

(declare-fun lt!346046 () BitStream!8444)

(declare-fun readBitPrefixLemma!0 (BitStream!8444 BitStream!8444) Unit!15533)

(assert (=> b!218387 (= lt!346033 (readBitPrefixLemma!0 lt!346046 (_2!9962 lt!346054)))))

(assert (=> b!218387 (= lt!346044 (readBitPure!0 (BitStream!8445 (buf!5215 (_2!9962 lt!346054)) (currentByte!9814 thiss!1204) (currentBit!9809 thiss!1204))))))

(assert (=> b!218387 (= lt!346057 (readBitPure!0 lt!346046))))

(assert (=> b!218387 e!148375))

(declare-fun res!183823 () Bool)

(assert (=> b!218387 (=> (not res!183823) (not e!148375))))

(assert (=> b!218387 (= res!183823 (invariant!0 (currentBit!9809 thiss!1204) (currentByte!9814 thiss!1204) (size!4668 (buf!5215 (_2!9962 lt!346059)))))))

(assert (=> b!218387 (= lt!346046 (BitStream!8445 (buf!5215 (_2!9962 lt!346059)) (currentByte!9814 thiss!1204) (currentBit!9809 thiss!1204)))))

(declare-fun b!218388 () Bool)

(declare-fun res!183821 () Bool)

(assert (=> b!218388 (=> res!183821 e!148381)))

(assert (=> b!218388 (= res!183821 (not (isPrefixOf!0 (_2!9962 lt!346059) (_2!9962 lt!346054))))))

(declare-fun b!218389 () Bool)

(declare-fun res!183819 () Bool)

(assert (=> b!218389 (=> (not res!183819) (not e!148384))))

(assert (=> b!218389 (= res!183819 (invariant!0 (currentBit!9809 thiss!1204) (currentByte!9814 thiss!1204) (size!4668 (buf!5215 thiss!1204))))))

(declare-fun b!218390 () Bool)

(declare-fun res!183813 () Bool)

(assert (=> b!218390 (=> res!183813 e!148381)))

(assert (=> b!218390 (= res!183813 (not (isPrefixOf!0 thiss!1204 (_2!9962 lt!346059))))))

(declare-fun b!218391 () Bool)

(assert (=> b!218391 (= e!148382 e!148386)))

(declare-fun res!183822 () Bool)

(assert (=> b!218391 (=> res!183822 e!148386)))

(assert (=> b!218391 (= res!183822 (not (= (_1!9964 lt!346042) lt!346053)))))

(assert (=> b!218391 e!148377))

(declare-fun res!183812 () Bool)

(assert (=> b!218391 (=> (not res!183812) (not e!148377))))

(declare-fun lt!346048 () tuple2!18610)

(assert (=> b!218391 (= res!183812 (and (= (_2!9963 lt!346038) (_2!9963 lt!346048)) (= (_1!9963 lt!346038) (_1!9963 lt!346048))))))

(declare-fun lt!346035 () Unit!15533)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15533)

(assert (=> b!218391 (= lt!346035 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9964 lt!346045) nBits!348 i!590 lt!346037))))

(assert (=> b!218391 (= lt!346048 (readNBitsLSBFirstsLoopPure!0 lt!346053 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346060))))

(assert (=> b!218391 (= lt!346053 (withMovedBitIndex!0 (_1!9964 lt!346045) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!45268 res!183809) b!218367))

(assert (= (and b!218367 res!183816) b!218389))

(assert (= (and b!218389 res!183819) b!218384))

(assert (= (and b!218384 res!183808) b!218374))

(assert (= (and b!218374 res!183814) b!218379))

(assert (= (and b!218379 res!183818) b!218370))

(assert (= (and b!218370 res!183825) b!218368))

(assert (= (and b!218368 res!183804) b!218372))

(assert (= (and b!218374 (not res!183806)) b!218375))

(assert (= (and b!218375 (not res!183820)) b!218386))

(assert (= (and b!218386 (not res!183807)) b!218378))

(assert (= (and b!218378 (not res!183811)) b!218388))

(assert (= (and b!218388 (not res!183821)) b!218390))

(assert (= (and b!218390 (not res!183813)) b!218387))

(assert (= (and b!218387 res!183823) b!218385))

(assert (= (and b!218387 res!183817) b!218382))

(assert (= (and b!218387 (not res!183810)) b!218391))

(assert (= (and b!218391 res!183812) b!218380))

(assert (= (and b!218380 res!183826) b!218383))

(assert (= (and b!218383 res!183827) b!218373))

(assert (= (and b!218391 (not res!183822)) b!218381))

(assert (= (and b!218381 (not res!183805)) b!218376))

(assert (= (and b!218376 res!183824) b!218369))

(assert (= (and b!218369 res!183815) b!218377))

(assert (= start!45268 b!218371))

(declare-fun m!336855 () Bool)

(assert (=> b!218369 m!336855))

(declare-fun m!336857 () Bool)

(assert (=> b!218374 m!336857))

(declare-fun m!336859 () Bool)

(assert (=> b!218374 m!336859))

(declare-fun m!336861 () Bool)

(assert (=> b!218374 m!336861))

(declare-fun m!336863 () Bool)

(assert (=> b!218381 m!336863))

(declare-fun m!336865 () Bool)

(assert (=> b!218381 m!336865))

(declare-fun m!336867 () Bool)

(assert (=> b!218383 m!336867))

(assert (=> b!218379 m!336857))

(assert (=> b!218379 m!336859))

(declare-fun m!336869 () Bool)

(assert (=> b!218385 m!336869))

(declare-fun m!336871 () Bool)

(assert (=> start!45268 m!336871))

(declare-fun m!336873 () Bool)

(assert (=> b!218370 m!336873))

(declare-fun m!336875 () Bool)

(assert (=> b!218387 m!336875))

(declare-fun m!336877 () Bool)

(assert (=> b!218387 m!336877))

(declare-fun m!336879 () Bool)

(assert (=> b!218387 m!336879))

(declare-fun m!336881 () Bool)

(assert (=> b!218387 m!336881))

(declare-fun m!336883 () Bool)

(assert (=> b!218387 m!336883))

(declare-fun m!336885 () Bool)

(assert (=> b!218387 m!336885))

(declare-fun m!336887 () Bool)

(assert (=> b!218387 m!336887))

(declare-fun m!336889 () Bool)

(assert (=> b!218387 m!336889))

(declare-fun m!336891 () Bool)

(assert (=> b!218387 m!336891))

(declare-fun m!336893 () Bool)

(assert (=> b!218387 m!336893))

(declare-fun m!336895 () Bool)

(assert (=> b!218387 m!336895))

(declare-fun m!336897 () Bool)

(assert (=> b!218387 m!336897))

(declare-fun m!336899 () Bool)

(assert (=> b!218387 m!336899))

(declare-fun m!336901 () Bool)

(assert (=> b!218387 m!336901))

(declare-fun m!336903 () Bool)

(assert (=> b!218387 m!336903))

(declare-fun m!336905 () Bool)

(assert (=> b!218387 m!336905))

(declare-fun m!336907 () Bool)

(assert (=> b!218391 m!336907))

(declare-fun m!336909 () Bool)

(assert (=> b!218391 m!336909))

(declare-fun m!336911 () Bool)

(assert (=> b!218391 m!336911))

(declare-fun m!336913 () Bool)

(assert (=> b!218388 m!336913))

(declare-fun m!336915 () Bool)

(assert (=> b!218386 m!336915))

(declare-fun m!336917 () Bool)

(assert (=> b!218371 m!336917))

(declare-fun m!336919 () Bool)

(assert (=> b!218372 m!336919))

(declare-fun m!336921 () Bool)

(assert (=> b!218368 m!336921))

(assert (=> b!218368 m!336921))

(declare-fun m!336923 () Bool)

(assert (=> b!218368 m!336923))

(declare-fun m!336925 () Bool)

(assert (=> b!218367 m!336925))

(declare-fun m!336927 () Bool)

(assert (=> b!218380 m!336927))

(declare-fun m!336929 () Bool)

(assert (=> b!218389 m!336929))

(declare-fun m!336931 () Bool)

(assert (=> b!218375 m!336931))

(declare-fun m!336933 () Bool)

(assert (=> b!218375 m!336933))

(declare-fun m!336935 () Bool)

(assert (=> b!218375 m!336935))

(declare-fun m!336937 () Bool)

(assert (=> b!218375 m!336937))

(assert (=> b!218390 m!336873))

(push 1)

(assert (not b!218369))

(assert (not b!218375))

(assert (not b!218379))

(assert (not b!218367))

(assert (not b!218374))

(assert (not b!218390))

(assert (not b!218385))

(assert (not b!218368))

(assert (not b!218381))

(assert (not b!218389))

(assert (not start!45268))

(assert (not b!218388))

(assert (not b!218391))

(assert (not b!218370))

(assert (not b!218371))

(assert (not b!218383))

(assert (not b!218380))

(assert (not b!218387))

(assert (not b!218372))

(assert (not b!218386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

