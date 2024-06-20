; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45144 () Bool)

(assert start!45144)

(declare-fun b!217379 () Bool)

(declare-fun res!182913 () Bool)

(declare-fun e!147802 () Bool)

(assert (=> b!217379 (=> (not res!182913) (not e!147802))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!217379 (= res!182913 (not (= i!590 nBits!348)))))

(declare-fun b!217380 () Bool)

(declare-fun res!182911 () Bool)

(declare-fun e!147806 () Bool)

(assert (=> b!217380 (=> res!182911 e!147806)))

(declare-datatypes ((array!10613 0))(
  ( (array!10614 (arr!5590 (Array (_ BitVec 32) (_ BitVec 8))) (size!4660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8428 0))(
  ( (BitStream!8429 (buf!5204 array!10613) (currentByte!9797 (_ BitVec 32)) (currentBit!9792 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15478 0))(
  ( (Unit!15479) )
))
(declare-datatypes ((tuple2!18530 0))(
  ( (tuple2!18531 (_1!9923 Unit!15478) (_2!9923 BitStream!8428)) )
))
(declare-fun lt!344203 () tuple2!18530)

(declare-fun lt!344183 () tuple2!18530)

(declare-fun isPrefixOf!0 (BitStream!8428 BitStream!8428) Bool)

(assert (=> b!217380 (= res!182911 (not (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344183))))))

(declare-fun b!217381 () Bool)

(declare-fun e!147799 () Bool)

(declare-fun e!147805 () Bool)

(assert (=> b!217381 (= e!147799 e!147805)))

(declare-fun res!182920 () Bool)

(assert (=> b!217381 (=> (not res!182920) (not e!147805))))

(declare-datatypes ((tuple2!18532 0))(
  ( (tuple2!18533 (_1!9924 BitStream!8428) (_2!9924 Bool)) )
))
(declare-fun lt!344194 () tuple2!18532)

(declare-fun lt!344187 () Bool)

(assert (=> b!217381 (= res!182920 (and (= (_2!9924 lt!344194) lt!344187) (= (_1!9924 lt!344194) (_2!9923 lt!344203))))))

(declare-fun thiss!1204 () BitStream!8428)

(declare-fun readBitPure!0 (BitStream!8428) tuple2!18532)

(declare-fun readerFrom!0 (BitStream!8428 (_ BitVec 32) (_ BitVec 32)) BitStream!8428)

(assert (=> b!217381 (= lt!344194 (readBitPure!0 (readerFrom!0 (_2!9923 lt!344203) (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204))))))

(declare-fun b!217382 () Bool)

(declare-fun e!147794 () Bool)

(declare-fun e!147804 () Bool)

(assert (=> b!217382 (= e!147794 e!147804)))

(declare-fun res!182922 () Bool)

(assert (=> b!217382 (=> res!182922 e!147804)))

(declare-datatypes ((tuple2!18534 0))(
  ( (tuple2!18535 (_1!9925 BitStream!8428) (_2!9925 BitStream!8428)) )
))
(declare-fun lt!344199 () tuple2!18534)

(declare-fun lt!344211 () BitStream!8428)

(assert (=> b!217382 (= res!182922 (not (= (_1!9925 lt!344199) lt!344211)))))

(declare-fun e!147807 () Bool)

(assert (=> b!217382 e!147807))

(declare-fun res!182910 () Bool)

(assert (=> b!217382 (=> (not res!182910) (not e!147807))))

(declare-datatypes ((tuple2!18536 0))(
  ( (tuple2!18537 (_1!9926 BitStream!8428) (_2!9926 (_ BitVec 64))) )
))
(declare-fun lt!344195 () tuple2!18536)

(declare-fun lt!344205 () tuple2!18536)

(assert (=> b!217382 (= res!182910 (and (= (_2!9926 lt!344195) (_2!9926 lt!344205)) (= (_1!9926 lt!344195) (_1!9926 lt!344205))))))

(declare-fun lt!344202 () (_ BitVec 64))

(declare-fun lt!344210 () Unit!15478)

(declare-fun lt!344185 () tuple2!18534)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15478)

(assert (=> b!217382 (= lt!344210 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202))))

(declare-fun lt!344198 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18536)

(assert (=> b!217382 (= lt!344205 (readNBitsLSBFirstsLoopPure!0 lt!344211 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198))))

(declare-fun withMovedBitIndex!0 (BitStream!8428 (_ BitVec 64)) BitStream!8428)

(assert (=> b!217382 (= lt!344211 (withMovedBitIndex!0 (_1!9925 lt!344185) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!217383 () Bool)

(assert (=> b!217383 (= e!147806 e!147794)))

(declare-fun res!182912 () Bool)

(assert (=> b!217383 (=> res!182912 e!147794)))

(declare-fun lt!344209 () tuple2!18536)

(assert (=> b!217383 (= res!182912 (not (= (_1!9926 lt!344209) (_2!9925 lt!344199))))))

(assert (=> b!217383 (= lt!344209 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344199) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198))))

(declare-fun lt!344184 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217383 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344184)))

(declare-fun lt!344213 () Unit!15478)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8428 array!10613 (_ BitVec 64)) Unit!15478)

(assert (=> b!217383 (= lt!344213 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344183)) lt!344184))))

(assert (=> b!217383 (= lt!344184 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!344191 () (_ BitVec 64))

(declare-fun lt!344189 () tuple2!18532)

(assert (=> b!217383 (= lt!344198 (bvor lt!344202 (ite (_2!9924 lt!344189) lt!344191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217383 (= lt!344195 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202))))

(declare-fun lt!344196 () (_ BitVec 64))

(assert (=> b!217383 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)) lt!344196)))

(declare-fun lt!344201 () Unit!15478)

(assert (=> b!217383 (= lt!344201 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5204 (_2!9923 lt!344183)) lt!344196))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217383 (= lt!344202 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!217383 (= (_2!9924 lt!344189) lt!344187)))

(assert (=> b!217383 (= lt!344189 (readBitPure!0 (_1!9925 lt!344185)))))

(declare-fun reader!0 (BitStream!8428 BitStream!8428) tuple2!18534)

(assert (=> b!217383 (= lt!344199 (reader!0 (_2!9923 lt!344203) (_2!9923 lt!344183)))))

(assert (=> b!217383 (= lt!344185 (reader!0 thiss!1204 (_2!9923 lt!344183)))))

(declare-fun e!147792 () Bool)

(assert (=> b!217383 e!147792))

(declare-fun res!182906 () Bool)

(assert (=> b!217383 (=> (not res!182906) (not e!147792))))

(declare-fun lt!344197 () tuple2!18532)

(declare-fun lt!344182 () tuple2!18532)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217383 (= res!182906 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344197))) (currentByte!9797 (_1!9924 lt!344197)) (currentBit!9792 (_1!9924 lt!344197))) (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344182))) (currentByte!9797 (_1!9924 lt!344182)) (currentBit!9792 (_1!9924 lt!344182)))))))

(declare-fun lt!344206 () Unit!15478)

(declare-fun lt!344190 () BitStream!8428)

(declare-fun readBitPrefixLemma!0 (BitStream!8428 BitStream!8428) Unit!15478)

(assert (=> b!217383 (= lt!344206 (readBitPrefixLemma!0 lt!344190 (_2!9923 lt!344183)))))

(assert (=> b!217383 (= lt!344182 (readBitPure!0 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))))))

(assert (=> b!217383 (= lt!344197 (readBitPure!0 lt!344190))))

(declare-fun e!147798 () Bool)

(assert (=> b!217383 e!147798))

(declare-fun res!182915 () Bool)

(assert (=> b!217383 (=> (not res!182915) (not e!147798))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!217383 (= res!182915 (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (=> b!217383 (= lt!344190 (BitStream!8429 (buf!5204 (_2!9923 lt!344203)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(declare-fun b!217384 () Bool)

(declare-fun res!182900 () Bool)

(assert (=> b!217384 (=> res!182900 e!147806)))

(assert (=> b!217384 (= res!182900 (not (isPrefixOf!0 thiss!1204 (_2!9923 lt!344203))))))

(declare-fun b!217385 () Bool)

(declare-fun e!147801 () Bool)

(declare-fun e!147800 () Bool)

(assert (=> b!217385 (= e!147801 e!147800)))

(declare-fun res!182924 () Bool)

(assert (=> b!217385 (=> res!182924 e!147800)))

(declare-fun lt!344208 () (_ BitVec 64))

(declare-fun lt!344204 () (_ BitVec 64))

(assert (=> b!217385 (= res!182924 (not (= lt!344208 (bvsub (bvsub (bvadd lt!344204 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!217385 (= lt!344208 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183))))))

(assert (=> b!217385 (isPrefixOf!0 thiss!1204 (_2!9923 lt!344183))))

(declare-fun lt!344192 () Unit!15478)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8428 BitStream!8428 BitStream!8428) Unit!15478)

(assert (=> b!217385 (= lt!344192 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9923 lt!344203) (_2!9923 lt!344183)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8428 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18530)

(assert (=> b!217385 (= lt!344183 (appendBitsLSBFirstLoopTR!0 (_2!9923 lt!344203) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!217386 () Bool)

(declare-fun lt!344188 () (_ BitVec 64))

(assert (=> b!217386 (= e!147807 (and (= lt!344188 (bvsub lt!344204 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9925 lt!344199) lt!344211)) (= (_2!9926 lt!344195) (_2!9926 lt!344209)))))))

(declare-fun b!217387 () Bool)

(declare-fun res!182919 () Bool)

(assert (=> b!217387 (=> (not res!182919) (not e!147802))))

(assert (=> b!217387 (= res!182919 (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204))))))

(declare-fun b!217389 () Bool)

(declare-fun res!182905 () Bool)

(declare-fun e!147795 () Bool)

(assert (=> b!217389 (=> (not res!182905) (not e!147795))))

(assert (=> b!217389 (= res!182905 (= (_2!9926 lt!344195) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!217390 () Bool)

(declare-fun res!182904 () Bool)

(assert (=> b!217390 (=> (not res!182904) (not e!147807))))

(assert (=> b!217390 (= res!182904 (= (_1!9925 lt!344199) (withMovedBitIndex!0 (_2!9925 lt!344199) (bvsub lt!344204 lt!344208))))))

(declare-fun b!217391 () Bool)

(assert (=> b!217391 (= e!147800 e!147806)))

(declare-fun res!182909 () Bool)

(assert (=> b!217391 (=> res!182909 e!147806)))

(declare-fun lt!344186 () (_ BitVec 64))

(assert (=> b!217391 (= res!182909 (not (= lt!344208 lt!344186)))))

(declare-fun lt!344212 () (_ BitVec 64))

(assert (=> b!217391 (= lt!344186 (bvsub lt!344212 ((_ sign_extend 32) i!590)))))

(assert (=> b!217391 (= lt!344212 (bvadd lt!344188 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!217392 () Bool)

(assert (=> b!217392 (= e!147802 (not e!147801))))

(declare-fun res!182917 () Bool)

(assert (=> b!217392 (=> res!182917 e!147801)))

(assert (=> b!217392 (= res!182917 (not (= lt!344204 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344188))))))

(assert (=> b!217392 (= lt!344204 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(assert (=> b!217392 (= lt!344188 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(declare-fun e!147797 () Bool)

(assert (=> b!217392 e!147797))

(declare-fun res!182901 () Bool)

(assert (=> b!217392 (=> (not res!182901) (not e!147797))))

(assert (=> b!217392 (= res!182901 (= (size!4660 (buf!5204 thiss!1204)) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(declare-fun appendBit!0 (BitStream!8428 Bool) tuple2!18530)

(assert (=> b!217392 (= lt!344203 (appendBit!0 thiss!1204 lt!344187))))

(assert (=> b!217392 (= lt!344187 (not (= (bvand v!189 lt!344191) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217392 (= lt!344191 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!217393 () Bool)

(assert (=> b!217393 (= e!147798 (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(declare-fun b!217394 () Bool)

(assert (=> b!217394 (= e!147797 e!147799)))

(declare-fun res!182916 () Bool)

(assert (=> b!217394 (=> (not res!182916) (not e!147799))))

(declare-fun lt!344207 () (_ BitVec 64))

(declare-fun lt!344200 () (_ BitVec 64))

(assert (=> b!217394 (= res!182916 (= lt!344207 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344200)))))

(assert (=> b!217394 (= lt!344207 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(assert (=> b!217394 (= lt!344200 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(declare-fun b!217395 () Bool)

(declare-fun res!182923 () Bool)

(assert (=> b!217395 (=> res!182923 e!147800)))

(assert (=> b!217395 (= res!182923 (not (= (size!4660 (buf!5204 (_2!9923 lt!344183))) (size!4660 (buf!5204 thiss!1204)))))))

(declare-fun b!217396 () Bool)

(declare-fun e!147793 () Bool)

(assert (=> b!217396 (= e!147793 e!147802)))

(declare-fun res!182914 () Bool)

(assert (=> b!217396 (=> (not res!182914) (not e!147802))))

(assert (=> b!217396 (= res!182914 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)) lt!344196))))

(assert (=> b!217396 (= lt!344196 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!217397 () Bool)

(declare-fun e!147803 () Bool)

(declare-fun array_inv!4401 (array!10613) Bool)

(assert (=> b!217397 (= e!147803 (array_inv!4401 (buf!5204 thiss!1204)))))

(declare-fun b!217398 () Bool)

(declare-fun lt!344193 () (_ BitVec 64))

(assert (=> b!217398 (= e!147804 (or (= lt!344193 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!344193 (bvand lt!344186 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!217398 (= lt!344193 (bvand lt!344212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!217398 e!147795))

(declare-fun res!182908 () Bool)

(assert (=> b!217398 (=> (not res!182908) (not e!147795))))

(assert (=> b!217398 (= res!182908 (= (size!4660 (buf!5204 thiss!1204)) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(declare-fun b!217399 () Bool)

(declare-fun res!182903 () Bool)

(assert (=> b!217399 (=> (not res!182903) (not e!147807))))

(assert (=> b!217399 (= res!182903 (= (_1!9925 lt!344185) (withMovedBitIndex!0 (_2!9925 lt!344185) (bvsub lt!344188 lt!344208))))))

(declare-fun b!217400 () Bool)

(declare-fun res!182907 () Bool)

(assert (=> b!217400 (=> (not res!182907) (not e!147799))))

(assert (=> b!217400 (= res!182907 (isPrefixOf!0 thiss!1204 (_2!9923 lt!344203)))))

(declare-fun b!217401 () Bool)

(declare-fun res!182921 () Bool)

(assert (=> b!217401 (=> res!182921 e!147800)))

(assert (=> b!217401 (= res!182921 (not (invariant!0 (currentBit!9792 (_2!9923 lt!344183)) (currentByte!9797 (_2!9923 lt!344183)) (size!4660 (buf!5204 (_2!9923 lt!344183))))))))

(declare-fun b!217402 () Bool)

(assert (=> b!217402 (= e!147795 (= (_1!9926 lt!344195) (_2!9925 lt!344185)))))

(declare-fun b!217388 () Bool)

(declare-fun res!182918 () Bool)

(assert (=> b!217388 (=> res!182918 e!147804)))

(assert (=> b!217388 (= res!182918 (not (= (bitIndex!0 (size!4660 (buf!5204 (_1!9926 lt!344195))) (currentByte!9797 (_1!9926 lt!344195)) (currentBit!9792 (_1!9926 lt!344195))) (bitIndex!0 (size!4660 (buf!5204 (_2!9925 lt!344185))) (currentByte!9797 (_2!9925 lt!344185)) (currentBit!9792 (_2!9925 lt!344185))))))))

(declare-fun res!182902 () Bool)

(assert (=> start!45144 (=> (not res!182902) (not e!147793))))

(assert (=> start!45144 (= res!182902 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45144 e!147793))

(assert (=> start!45144 true))

(declare-fun inv!12 (BitStream!8428) Bool)

(assert (=> start!45144 (and (inv!12 thiss!1204) e!147803)))

(declare-fun b!217403 () Bool)

(assert (=> b!217403 (= e!147792 (= (_2!9924 lt!344197) (_2!9924 lt!344182)))))

(declare-fun b!217404 () Bool)

(assert (=> b!217404 (= e!147805 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344194))) (currentByte!9797 (_1!9924 lt!344194)) (currentBit!9792 (_1!9924 lt!344194))) lt!344207))))

(assert (= (and start!45144 res!182902) b!217396))

(assert (= (and b!217396 res!182914) b!217387))

(assert (= (and b!217387 res!182919) b!217379))

(assert (= (and b!217379 res!182913) b!217392))

(assert (= (and b!217392 res!182901) b!217394))

(assert (= (and b!217394 res!182916) b!217400))

(assert (= (and b!217400 res!182907) b!217381))

(assert (= (and b!217381 res!182920) b!217404))

(assert (= (and b!217392 (not res!182917)) b!217385))

(assert (= (and b!217385 (not res!182924)) b!217401))

(assert (= (and b!217401 (not res!182921)) b!217395))

(assert (= (and b!217395 (not res!182923)) b!217391))

(assert (= (and b!217391 (not res!182909)) b!217380))

(assert (= (and b!217380 (not res!182911)) b!217384))

(assert (= (and b!217384 (not res!182900)) b!217383))

(assert (= (and b!217383 res!182915) b!217393))

(assert (= (and b!217383 res!182906) b!217403))

(assert (= (and b!217383 (not res!182912)) b!217382))

(assert (= (and b!217382 res!182910) b!217399))

(assert (= (and b!217399 res!182903) b!217390))

(assert (= (and b!217390 res!182904) b!217386))

(assert (= (and b!217382 (not res!182922)) b!217388))

(assert (= (and b!217388 (not res!182918)) b!217398))

(assert (= (and b!217398 res!182908) b!217389))

(assert (= (and b!217389 res!182905) b!217402))

(assert (= start!45144 b!217397))

(declare-fun m!335421 () Bool)

(assert (=> b!217390 m!335421))

(declare-fun m!335423 () Bool)

(assert (=> b!217384 m!335423))

(declare-fun m!335425 () Bool)

(assert (=> b!217380 m!335425))

(declare-fun m!335427 () Bool)

(assert (=> b!217396 m!335427))

(declare-fun m!335429 () Bool)

(assert (=> b!217387 m!335429))

(declare-fun m!335431 () Bool)

(assert (=> b!217389 m!335431))

(declare-fun m!335433 () Bool)

(assert (=> b!217401 m!335433))

(declare-fun m!335435 () Bool)

(assert (=> b!217397 m!335435))

(declare-fun m!335437 () Bool)

(assert (=> b!217381 m!335437))

(assert (=> b!217381 m!335437))

(declare-fun m!335439 () Bool)

(assert (=> b!217381 m!335439))

(declare-fun m!335441 () Bool)

(assert (=> b!217404 m!335441))

(declare-fun m!335443 () Bool)

(assert (=> b!217399 m!335443))

(declare-fun m!335445 () Bool)

(assert (=> b!217393 m!335445))

(declare-fun m!335447 () Bool)

(assert (=> b!217394 m!335447))

(declare-fun m!335449 () Bool)

(assert (=> b!217394 m!335449))

(declare-fun m!335451 () Bool)

(assert (=> b!217388 m!335451))

(declare-fun m!335453 () Bool)

(assert (=> b!217388 m!335453))

(declare-fun m!335455 () Bool)

(assert (=> b!217385 m!335455))

(declare-fun m!335457 () Bool)

(assert (=> b!217385 m!335457))

(declare-fun m!335459 () Bool)

(assert (=> b!217385 m!335459))

(declare-fun m!335461 () Bool)

(assert (=> b!217385 m!335461))

(declare-fun m!335463 () Bool)

(assert (=> b!217383 m!335463))

(declare-fun m!335465 () Bool)

(assert (=> b!217383 m!335465))

(declare-fun m!335467 () Bool)

(assert (=> b!217383 m!335467))

(declare-fun m!335469 () Bool)

(assert (=> b!217383 m!335469))

(declare-fun m!335471 () Bool)

(assert (=> b!217383 m!335471))

(declare-fun m!335473 () Bool)

(assert (=> b!217383 m!335473))

(declare-fun m!335475 () Bool)

(assert (=> b!217383 m!335475))

(declare-fun m!335477 () Bool)

(assert (=> b!217383 m!335477))

(declare-fun m!335479 () Bool)

(assert (=> b!217383 m!335479))

(declare-fun m!335481 () Bool)

(assert (=> b!217383 m!335481))

(declare-fun m!335483 () Bool)

(assert (=> b!217383 m!335483))

(declare-fun m!335485 () Bool)

(assert (=> b!217383 m!335485))

(declare-fun m!335487 () Bool)

(assert (=> b!217383 m!335487))

(declare-fun m!335489 () Bool)

(assert (=> b!217383 m!335489))

(declare-fun m!335491 () Bool)

(assert (=> b!217383 m!335491))

(declare-fun m!335493 () Bool)

(assert (=> b!217383 m!335493))

(assert (=> b!217392 m!335447))

(assert (=> b!217392 m!335449))

(declare-fun m!335495 () Bool)

(assert (=> b!217392 m!335495))

(declare-fun m!335497 () Bool)

(assert (=> start!45144 m!335497))

(assert (=> b!217400 m!335423))

(declare-fun m!335499 () Bool)

(assert (=> b!217382 m!335499))

(declare-fun m!335501 () Bool)

(assert (=> b!217382 m!335501))

(declare-fun m!335503 () Bool)

(assert (=> b!217382 m!335503))

(push 1)

(assert (not b!217385))

(assert (not b!217389))

(assert (not start!45144))

(assert (not b!217387))

(assert (not b!217401))

(assert (not b!217394))

(assert (not b!217399))

(assert (not b!217397))

(assert (not b!217390))

(assert (not b!217388))

(assert (not b!217381))

(assert (not b!217382))

(assert (not b!217400))

(assert (not b!217392))

(assert (not b!217383))

(assert (not b!217384))

(assert (not b!217396))

(assert (not b!217380))

(assert (not b!217404))

(assert (not b!217393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!73789 () Bool)

(declare-fun res!183116 () Bool)

(declare-fun e!147933 () Bool)

(assert (=> d!73789 (=> (not res!183116) (not e!147933))))

(assert (=> d!73789 (= res!183116 (= (size!4660 (buf!5204 thiss!1204)) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (=> d!73789 (= (isPrefixOf!0 thiss!1204 (_2!9923 lt!344203)) e!147933)))

(declare-fun b!217601 () Bool)

(declare-fun res!183117 () Bool)

(assert (=> b!217601 (=> (not res!183117) (not e!147933))))

(assert (=> b!217601 (= res!183117 (bvsle (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203)))))))

(declare-fun b!217602 () Bool)

(declare-fun e!147932 () Bool)

(assert (=> b!217602 (= e!147933 e!147932)))

(declare-fun res!183118 () Bool)

(assert (=> b!217602 (=> res!183118 e!147932)))

(assert (=> b!217602 (= res!183118 (= (size!4660 (buf!5204 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217603 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10613 array!10613 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217603 (= e!147932 (arrayBitRangesEq!0 (buf!5204 thiss!1204) (buf!5204 (_2!9923 lt!344203)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))))))

(assert (= (and d!73789 res!183116) b!217601))

(assert (= (and b!217601 res!183117) b!217602))

(assert (= (and b!217602 (not res!183118)) b!217603))

(assert (=> b!217601 m!335449))

(assert (=> b!217601 m!335447))

(assert (=> b!217603 m!335449))

(assert (=> b!217603 m!335449))

(declare-fun m!335729 () Bool)

(assert (=> b!217603 m!335729))

(assert (=> b!217384 d!73789))

(declare-fun d!73793 () Bool)

(assert (=> d!73793 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204))))))

(declare-fun bs!18013 () Bool)

(assert (= bs!18013 d!73793))

(assert (=> bs!18013 m!335429))

(assert (=> start!45144 d!73793))

(declare-fun d!73795 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73795 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)) lt!344196) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204))) lt!344196))))

(declare-fun bs!18014 () Bool)

(assert (= bs!18014 d!73795))

(declare-fun m!335731 () Bool)

(assert (=> bs!18014 m!335731))

(assert (=> b!217396 d!73795))

(declare-fun d!73797 () Bool)

(declare-fun e!147947 () Bool)

(assert (=> d!73797 e!147947))

(declare-fun res!183140 () Bool)

(assert (=> d!73797 (=> (not res!183140) (not e!147947))))

(declare-fun lt!344504 () (_ BitVec 64))

(declare-fun lt!344501 () (_ BitVec 64))

(declare-fun lt!344502 () (_ BitVec 64))

(assert (=> d!73797 (= res!183140 (= lt!344502 (bvsub lt!344501 lt!344504)))))

(assert (=> d!73797 (or (= (bvand lt!344501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344501 lt!344504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73797 (= lt!344504 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344183))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344183)))))))

(declare-fun lt!344505 () (_ BitVec 64))

(declare-fun lt!344500 () (_ BitVec 64))

(assert (=> d!73797 (= lt!344501 (bvmul lt!344505 lt!344500))))

(assert (=> d!73797 (or (= lt!344505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344500 (bvsdiv (bvmul lt!344505 lt!344500) lt!344505)))))

(assert (=> d!73797 (= lt!344500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73797 (= lt!344505 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(assert (=> d!73797 (= lt!344502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344183))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344183)))))))

(assert (=> d!73797 (invariant!0 (currentBit!9792 (_2!9923 lt!344183)) (currentByte!9797 (_2!9923 lt!344183)) (size!4660 (buf!5204 (_2!9923 lt!344183))))))

(assert (=> d!73797 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183))) lt!344502)))

(declare-fun b!217623 () Bool)

(declare-fun res!183139 () Bool)

(assert (=> b!217623 (=> (not res!183139) (not e!147947))))

(assert (=> b!217623 (= res!183139 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344502))))

(declare-fun b!217624 () Bool)

(declare-fun lt!344503 () (_ BitVec 64))

(assert (=> b!217624 (= e!147947 (bvsle lt!344502 (bvmul lt!344503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217624 (or (= lt!344503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344503)))))

(assert (=> b!217624 (= lt!344503 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(assert (= (and d!73797 res!183140) b!217623))

(assert (= (and b!217623 res!183139) b!217624))

(declare-fun m!335745 () Bool)

(assert (=> d!73797 m!335745))

(assert (=> d!73797 m!335433))

(assert (=> b!217385 d!73797))

(declare-fun d!73811 () Bool)

(declare-fun res!183141 () Bool)

(declare-fun e!147949 () Bool)

(assert (=> d!73811 (=> (not res!183141) (not e!147949))))

(assert (=> d!73811 (= res!183141 (= (size!4660 (buf!5204 thiss!1204)) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(assert (=> d!73811 (= (isPrefixOf!0 thiss!1204 (_2!9923 lt!344183)) e!147949)))

(declare-fun b!217625 () Bool)

(declare-fun res!183142 () Bool)

(assert (=> b!217625 (=> (not res!183142) (not e!147949))))

(assert (=> b!217625 (= res!183142 (bvsle (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183)))))))

(declare-fun b!217626 () Bool)

(declare-fun e!147948 () Bool)

(assert (=> b!217626 (= e!147949 e!147948)))

(declare-fun res!183143 () Bool)

(assert (=> b!217626 (=> res!183143 e!147948)))

(assert (=> b!217626 (= res!183143 (= (size!4660 (buf!5204 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217627 () Bool)

(assert (=> b!217627 (= e!147948 (arrayBitRangesEq!0 (buf!5204 thiss!1204) (buf!5204 (_2!9923 lt!344183)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))))))

(assert (= (and d!73811 res!183141) b!217625))

(assert (= (and b!217625 res!183142) b!217626))

(assert (= (and b!217626 (not res!183143)) b!217627))

(assert (=> b!217625 m!335449))

(assert (=> b!217625 m!335455))

(assert (=> b!217627 m!335449))

(assert (=> b!217627 m!335449))

(declare-fun m!335749 () Bool)

(assert (=> b!217627 m!335749))

(assert (=> b!217385 d!73811))

(declare-fun d!73815 () Bool)

(assert (=> d!73815 (isPrefixOf!0 thiss!1204 (_2!9923 lt!344183))))

(declare-fun lt!344508 () Unit!15478)

(declare-fun choose!30 (BitStream!8428 BitStream!8428 BitStream!8428) Unit!15478)

(assert (=> d!73815 (= lt!344508 (choose!30 thiss!1204 (_2!9923 lt!344203) (_2!9923 lt!344183)))))

(assert (=> d!73815 (isPrefixOf!0 thiss!1204 (_2!9923 lt!344203))))

(assert (=> d!73815 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9923 lt!344203) (_2!9923 lt!344183)) lt!344508)))

(declare-fun bs!18017 () Bool)

(assert (= bs!18017 d!73815))

(assert (=> bs!18017 m!335457))

(declare-fun m!335751 () Bool)

(assert (=> bs!18017 m!335751))

(assert (=> bs!18017 m!335423))

(assert (=> b!217385 d!73815))

(declare-fun b!217772 () Bool)

(declare-fun e!148035 () tuple2!18530)

(declare-fun lt!344989 () tuple2!18530)

(assert (=> b!217772 (= e!148035 (tuple2!18531 (_1!9923 lt!344989) (_2!9923 lt!344989)))))

(declare-fun lt!344982 () Bool)

(assert (=> b!217772 (= lt!344982 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!344976 () tuple2!18530)

(assert (=> b!217772 (= lt!344976 (appendBit!0 (_2!9923 lt!344203) lt!344982))))

(declare-fun res!183262 () Bool)

(assert (=> b!217772 (= res!183262 (= (size!4660 (buf!5204 (_2!9923 lt!344203))) (size!4660 (buf!5204 (_2!9923 lt!344976)))))))

(declare-fun e!148034 () Bool)

(assert (=> b!217772 (=> (not res!183262) (not e!148034))))

(assert (=> b!217772 e!148034))

(declare-fun lt!345005 () tuple2!18530)

(assert (=> b!217772 (= lt!345005 lt!344976)))

(assert (=> b!217772 (= lt!344989 (appendBitsLSBFirstLoopTR!0 (_2!9923 lt!345005) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!345021 () Unit!15478)

(assert (=> b!217772 (= lt!345021 (lemmaIsPrefixTransitive!0 (_2!9923 lt!344203) (_2!9923 lt!345005) (_2!9923 lt!344989)))))

(declare-fun call!3408 () Bool)

(assert (=> b!217772 call!3408))

(declare-fun lt!345015 () Unit!15478)

(assert (=> b!217772 (= lt!345015 lt!345021)))

(assert (=> b!217772 (invariant!0 (currentBit!9792 (_2!9923 lt!344203)) (currentByte!9797 (_2!9923 lt!344203)) (size!4660 (buf!5204 (_2!9923 lt!345005))))))

(declare-fun lt!344991 () BitStream!8428)

(assert (=> b!217772 (= lt!344991 (BitStream!8429 (buf!5204 (_2!9923 lt!345005)) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(assert (=> b!217772 (invariant!0 (currentBit!9792 lt!344991) (currentByte!9797 lt!344991) (size!4660 (buf!5204 (_2!9923 lt!344989))))))

(declare-fun lt!344969 () BitStream!8428)

(assert (=> b!217772 (= lt!344969 (BitStream!8429 (buf!5204 (_2!9923 lt!344989)) (currentByte!9797 lt!344991) (currentBit!9792 lt!344991)))))

(declare-fun lt!345016 () tuple2!18532)

(assert (=> b!217772 (= lt!345016 (readBitPure!0 lt!344991))))

(declare-fun lt!344995 () tuple2!18532)

(assert (=> b!217772 (= lt!344995 (readBitPure!0 lt!344969))))

(declare-fun lt!345004 () Unit!15478)

(assert (=> b!217772 (= lt!345004 (readBitPrefixLemma!0 lt!344991 (_2!9923 lt!344989)))))

(declare-fun res!183268 () Bool)

(assert (=> b!217772 (= res!183268 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!345016))) (currentByte!9797 (_1!9924 lt!345016)) (currentBit!9792 (_1!9924 lt!345016))) (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344995))) (currentByte!9797 (_1!9924 lt!344995)) (currentBit!9792 (_1!9924 lt!344995)))))))

(declare-fun e!148031 () Bool)

(assert (=> b!217772 (=> (not res!183268) (not e!148031))))

(assert (=> b!217772 e!148031))

(declare-fun lt!344996 () Unit!15478)

(assert (=> b!217772 (= lt!344996 lt!345004)))

(declare-fun lt!344992 () tuple2!18534)

(assert (=> b!217772 (= lt!344992 (reader!0 (_2!9923 lt!344203) (_2!9923 lt!344989)))))

(declare-fun lt!344984 () tuple2!18534)

(assert (=> b!217772 (= lt!344984 (reader!0 (_2!9923 lt!345005) (_2!9923 lt!344989)))))

(declare-fun lt!344970 () tuple2!18532)

(assert (=> b!217772 (= lt!344970 (readBitPure!0 (_1!9925 lt!344992)))))

(assert (=> b!217772 (= (_2!9924 lt!344970) lt!344982)))

(declare-fun lt!344994 () Unit!15478)

(declare-fun Unit!15497 () Unit!15478)

(assert (=> b!217772 (= lt!344994 Unit!15497)))

(declare-fun lt!345022 () (_ BitVec 64))

(assert (=> b!217772 (= lt!345022 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344972 () (_ BitVec 64))

(assert (=> b!217772 (= lt!344972 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344999 () Unit!15478)

(assert (=> b!217772 (= lt!344999 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344989)) lt!344972))))

(assert (=> b!217772 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344989)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344972)))

(declare-fun lt!344998 () Unit!15478)

(assert (=> b!217772 (= lt!344998 lt!344999)))

(declare-fun lt!344980 () tuple2!18536)

(assert (=> b!217772 (= lt!344980 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344992) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345022))))

(declare-fun lt!345008 () (_ BitVec 64))

(assert (=> b!217772 (= lt!345008 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!345002 () Unit!15478)

(assert (=> b!217772 (= lt!345002 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!345005) (buf!5204 (_2!9923 lt!344989)) lt!345008))))

(assert (=> b!217772 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344989)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!345005))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!345005))) lt!345008)))

(declare-fun lt!345013 () Unit!15478)

(assert (=> b!217772 (= lt!345013 lt!345002)))

(declare-fun lt!344983 () tuple2!18536)

(assert (=> b!217772 (= lt!344983 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344984) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!345022 (ite (_2!9924 lt!344970) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!345010 () tuple2!18536)

(assert (=> b!217772 (= lt!345010 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344992) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345022))))

(declare-fun c!10643 () Bool)

(assert (=> b!217772 (= c!10643 (_2!9924 (readBitPure!0 (_1!9925 lt!344992))))))

(declare-fun lt!345006 () tuple2!18536)

(declare-fun e!148028 () (_ BitVec 64))

(assert (=> b!217772 (= lt!345006 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9925 lt!344992) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!345022 e!148028)))))

(declare-fun lt!345003 () Unit!15478)

(assert (=> b!217772 (= lt!345003 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9925 lt!344992) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345022))))

(assert (=> b!217772 (and (= (_2!9926 lt!345010) (_2!9926 lt!345006)) (= (_1!9926 lt!345010) (_1!9926 lt!345006)))))

(declare-fun lt!344973 () Unit!15478)

(assert (=> b!217772 (= lt!344973 lt!345003)))

(assert (=> b!217772 (= (_1!9925 lt!344992) (withMovedBitIndex!0 (_2!9925 lt!344992) (bvsub (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344989))) (currentByte!9797 (_2!9923 lt!344989)) (currentBit!9792 (_2!9923 lt!344989))))))))

(declare-fun lt!345018 () Unit!15478)

(declare-fun Unit!15498 () Unit!15478)

(assert (=> b!217772 (= lt!345018 Unit!15498)))

(assert (=> b!217772 (= (_1!9925 lt!344984) (withMovedBitIndex!0 (_2!9925 lt!344984) (bvsub (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!345005))) (currentByte!9797 (_2!9923 lt!345005)) (currentBit!9792 (_2!9923 lt!345005))) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344989))) (currentByte!9797 (_2!9923 lt!344989)) (currentBit!9792 (_2!9923 lt!344989))))))))

(declare-fun lt!345019 () Unit!15478)

(declare-fun Unit!15499 () Unit!15478)

(assert (=> b!217772 (= lt!345019 Unit!15499)))

(assert (=> b!217772 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) (bvsub (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!345005))) (currentByte!9797 (_2!9923 lt!345005)) (currentBit!9792 (_2!9923 lt!345005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!345011 () Unit!15478)

(declare-fun Unit!15500 () Unit!15478)

(assert (=> b!217772 (= lt!345011 Unit!15500)))

(assert (=> b!217772 (= (_2!9926 lt!344980) (_2!9926 lt!344983))))

(declare-fun lt!344985 () Unit!15478)

(declare-fun Unit!15501 () Unit!15478)

(assert (=> b!217772 (= lt!344985 Unit!15501)))

(assert (=> b!217772 (invariant!0 (currentBit!9792 (_2!9923 lt!344989)) (currentByte!9797 (_2!9923 lt!344989)) (size!4660 (buf!5204 (_2!9923 lt!344989))))))

(declare-fun lt!344975 () Unit!15478)

(declare-fun Unit!15502 () Unit!15478)

(assert (=> b!217772 (= lt!344975 Unit!15502)))

(assert (=> b!217772 (= (size!4660 (buf!5204 (_2!9923 lt!344203))) (size!4660 (buf!5204 (_2!9923 lt!344989))))))

(declare-fun lt!344978 () Unit!15478)

(declare-fun Unit!15503 () Unit!15478)

(assert (=> b!217772 (= lt!344978 Unit!15503)))

(assert (=> b!217772 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344989))) (currentByte!9797 (_2!9923 lt!344989)) (currentBit!9792 (_2!9923 lt!344989))) (bvsub (bvadd (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345014 () Unit!15478)

(declare-fun Unit!15504 () Unit!15478)

(assert (=> b!217772 (= lt!345014 Unit!15504)))

(declare-fun lt!344974 () Unit!15478)

(declare-fun Unit!15505 () Unit!15478)

(assert (=> b!217772 (= lt!344974 Unit!15505)))

(declare-fun lt!345020 () tuple2!18534)

(assert (=> b!217772 (= lt!345020 (reader!0 (_2!9923 lt!344203) (_2!9923 lt!344989)))))

(declare-fun lt!345017 () (_ BitVec 64))

(assert (=> b!217772 (= lt!345017 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345007 () Unit!15478)

(assert (=> b!217772 (= lt!345007 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344989)) lt!345017))))

(assert (=> b!217772 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344989)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!345017)))

(declare-fun lt!344981 () Unit!15478)

(assert (=> b!217772 (= lt!344981 lt!345007)))

(declare-fun lt!344971 () tuple2!18536)

(assert (=> b!217772 (= lt!344971 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!345020) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!183260 () Bool)

(assert (=> b!217772 (= res!183260 (= (_2!9926 lt!344971) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!148029 () Bool)

(assert (=> b!217772 (=> (not res!183260) (not e!148029))))

(assert (=> b!217772 e!148029))

(declare-fun lt!344990 () Unit!15478)

(declare-fun Unit!15506 () Unit!15478)

(assert (=> b!217772 (= lt!344990 Unit!15506)))

(declare-fun d!73817 () Bool)

(declare-fun e!148036 () Bool)

(assert (=> d!73817 e!148036))

(declare-fun res!183270 () Bool)

(assert (=> d!73817 (=> (not res!183270) (not e!148036))))

(declare-fun lt!344993 () tuple2!18530)

(assert (=> d!73817 (= res!183270 (invariant!0 (currentBit!9792 (_2!9923 lt!344993)) (currentByte!9797 (_2!9923 lt!344993)) (size!4660 (buf!5204 (_2!9923 lt!344993)))))))

(assert (=> d!73817 (= lt!344993 e!148035)))

(declare-fun c!10644 () Bool)

(assert (=> d!73817 (= c!10644 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73817 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73817 (= (appendBitsLSBFirstLoopTR!0 (_2!9923 lt!344203) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!344993)))

(declare-fun b!217773 () Bool)

(declare-fun res!183263 () Bool)

(assert (=> b!217773 (=> (not res!183263) (not e!148036))))

(assert (=> b!217773 (= res!183263 (= (size!4660 (buf!5204 (_2!9923 lt!344203))) (size!4660 (buf!5204 (_2!9923 lt!344993)))))))

(declare-fun b!217774 () Bool)

(declare-fun res!183266 () Bool)

(assert (=> b!217774 (= res!183266 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344976))) (currentByte!9797 (_2!9923 lt!344976)) (currentBit!9792 (_2!9923 lt!344976))) (bvadd (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!217774 (=> (not res!183266) (not e!148034))))

(declare-fun b!217775 () Bool)

(declare-fun res!183265 () Bool)

(assert (=> b!217775 (=> (not res!183265) (not e!148036))))

(assert (=> b!217775 (= res!183265 (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344993)))))

(declare-fun b!217776 () Bool)

(declare-fun e!148030 () Bool)

(assert (=> b!217776 (= e!148036 e!148030)))

(declare-fun res!183259 () Bool)

(assert (=> b!217776 (=> (not res!183259) (not e!148030))))

(declare-fun lt!345012 () tuple2!18536)

(assert (=> b!217776 (= res!183259 (= (_2!9926 lt!345012) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!345009 () tuple2!18534)

(assert (=> b!217776 (= lt!345012 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!345009) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!345000 () Unit!15478)

(declare-fun lt!345001 () Unit!15478)

(assert (=> b!217776 (= lt!345000 lt!345001)))

(declare-fun lt!344988 () (_ BitVec 64))

(assert (=> b!217776 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344993)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344988)))

(assert (=> b!217776 (= lt!345001 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344993)) lt!344988))))

(declare-fun e!148033 () Bool)

(assert (=> b!217776 e!148033))

(declare-fun res!183264 () Bool)

(assert (=> b!217776 (=> (not res!183264) (not e!148033))))

(assert (=> b!217776 (= res!183264 (and (= (size!4660 (buf!5204 (_2!9923 lt!344203))) (size!4660 (buf!5204 (_2!9923 lt!344993)))) (bvsge lt!344988 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217776 (= lt!344988 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217776 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217776 (= lt!345009 (reader!0 (_2!9923 lt!344203) (_2!9923 lt!344993)))))

(declare-fun bm!3405 () Bool)

(assert (=> bm!3405 (= call!3408 (isPrefixOf!0 (_2!9923 lt!344203) (ite c!10644 (_2!9923 lt!344203) (_2!9923 lt!344989))))))

(declare-fun b!217777 () Bool)

(assert (=> b!217777 (= e!148028 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!217778 () Bool)

(assert (=> b!217778 (= e!148028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!217779 () Bool)

(declare-fun Unit!15507 () Unit!15478)

(assert (=> b!217779 (= e!148035 (tuple2!18531 Unit!15507 (_2!9923 lt!344203)))))

(declare-fun lt!344977 () Unit!15478)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8428) Unit!15478)

(assert (=> b!217779 (= lt!344977 (lemmaIsPrefixRefl!0 (_2!9923 lt!344203)))))

(assert (=> b!217779 call!3408))

(declare-fun lt!344987 () Unit!15478)

(assert (=> b!217779 (= lt!344987 lt!344977)))

(declare-fun b!217780 () Bool)

(assert (=> b!217780 (= e!148029 (= (_1!9926 lt!344971) (_2!9925 lt!345020)))))

(declare-fun b!217781 () Bool)

(assert (=> b!217781 (= e!148033 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344203)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344988))))

(declare-fun b!217782 () Bool)

(assert (=> b!217782 (= e!148030 (= (_1!9926 lt!345012) (_2!9925 lt!345009)))))

(declare-fun b!217783 () Bool)

(declare-fun lt!344967 () tuple2!18532)

(assert (=> b!217783 (= lt!344967 (readBitPure!0 (readerFrom!0 (_2!9923 lt!344976) (currentBit!9792 (_2!9923 lt!344203)) (currentByte!9797 (_2!9923 lt!344203)))))))

(declare-fun res!183267 () Bool)

(assert (=> b!217783 (= res!183267 (and (= (_2!9924 lt!344967) lt!344982) (= (_1!9924 lt!344967) (_2!9923 lt!344976))))))

(declare-fun e!148032 () Bool)

(assert (=> b!217783 (=> (not res!183267) (not e!148032))))

(assert (=> b!217783 (= e!148034 e!148032)))

(declare-fun b!217784 () Bool)

(assert (=> b!217784 (= e!148032 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344967))) (currentByte!9797 (_1!9924 lt!344967)) (currentBit!9792 (_1!9924 lt!344967))) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344976))) (currentByte!9797 (_2!9923 lt!344976)) (currentBit!9792 (_2!9923 lt!344976)))))))

(declare-fun b!217785 () Bool)

(declare-fun res!183261 () Bool)

(assert (=> b!217785 (=> (not res!183261) (not e!148036))))

(declare-fun lt!344968 () (_ BitVec 64))

(declare-fun lt!344997 () (_ BitVec 64))

(assert (=> b!217785 (= res!183261 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344993))) (currentByte!9797 (_2!9923 lt!344993)) (currentBit!9792 (_2!9923 lt!344993))) (bvsub lt!344997 lt!344968)))))

(assert (=> b!217785 (or (= (bvand lt!344997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344997 lt!344968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217785 (= lt!344968 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!344986 () (_ BitVec 64))

(declare-fun lt!344979 () (_ BitVec 64))

(assert (=> b!217785 (= lt!344997 (bvadd lt!344986 lt!344979))))

(assert (=> b!217785 (or (not (= (bvand lt!344986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344979 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344986 lt!344979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217785 (= lt!344979 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217785 (= lt!344986 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(declare-fun b!217786 () Bool)

(declare-fun res!183269 () Bool)

(assert (=> b!217786 (= res!183269 (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344976)))))

(assert (=> b!217786 (=> (not res!183269) (not e!148034))))

(declare-fun b!217787 () Bool)

(assert (=> b!217787 (= e!148031 (= (_2!9924 lt!345016) (_2!9924 lt!344995)))))

(assert (= (and d!73817 c!10644) b!217779))

(assert (= (and d!73817 (not c!10644)) b!217772))

(assert (= (and b!217772 res!183262) b!217774))

(assert (= (and b!217774 res!183266) b!217786))

(assert (= (and b!217786 res!183269) b!217783))

(assert (= (and b!217783 res!183267) b!217784))

(assert (= (and b!217772 res!183268) b!217787))

(assert (= (and b!217772 c!10643) b!217777))

(assert (= (and b!217772 (not c!10643)) b!217778))

(assert (= (and b!217772 res!183260) b!217780))

(assert (= (or b!217779 b!217772) bm!3405))

(assert (= (and d!73817 res!183270) b!217773))

(assert (= (and b!217773 res!183263) b!217785))

(assert (= (and b!217785 res!183261) b!217775))

(assert (= (and b!217775 res!183265) b!217776))

(assert (= (and b!217776 res!183264) b!217781))

(assert (= (and b!217776 res!183259) b!217782))

(declare-fun m!335979 () Bool)

(assert (=> b!217776 m!335979))

(declare-fun m!335981 () Bool)

(assert (=> b!217776 m!335981))

(assert (=> b!217776 m!335431))

(declare-fun m!335983 () Bool)

(assert (=> b!217776 m!335983))

(declare-fun m!335985 () Bool)

(assert (=> b!217776 m!335985))

(declare-fun m!335987 () Bool)

(assert (=> b!217776 m!335987))

(declare-fun m!335989 () Bool)

(assert (=> b!217779 m!335989))

(declare-fun m!335991 () Bool)

(assert (=> b!217775 m!335991))

(declare-fun m!335993 () Bool)

(assert (=> b!217783 m!335993))

(assert (=> b!217783 m!335993))

(declare-fun m!335995 () Bool)

(assert (=> b!217783 m!335995))

(declare-fun m!335997 () Bool)

(assert (=> b!217786 m!335997))

(declare-fun m!335999 () Bool)

(assert (=> b!217785 m!335999))

(assert (=> b!217785 m!335447))

(declare-fun m!336001 () Bool)

(assert (=> b!217774 m!336001))

(assert (=> b!217774 m!335447))

(declare-fun m!336003 () Bool)

(assert (=> d!73817 m!336003))

(declare-fun m!336005 () Bool)

(assert (=> b!217781 m!336005))

(declare-fun m!336007 () Bool)

(assert (=> b!217772 m!336007))

(declare-fun m!336009 () Bool)

(assert (=> b!217772 m!336009))

(declare-fun m!336011 () Bool)

(assert (=> b!217772 m!336011))

(declare-fun m!336013 () Bool)

(assert (=> b!217772 m!336013))

(declare-fun m!336015 () Bool)

(assert (=> b!217772 m!336015))

(declare-fun m!336017 () Bool)

(assert (=> b!217772 m!336017))

(declare-fun m!336019 () Bool)

(assert (=> b!217772 m!336019))

(declare-fun m!336021 () Bool)

(assert (=> b!217772 m!336021))

(declare-fun m!336023 () Bool)

(assert (=> b!217772 m!336023))

(declare-fun m!336025 () Bool)

(assert (=> b!217772 m!336025))

(declare-fun m!336027 () Bool)

(assert (=> b!217772 m!336027))

(assert (=> b!217772 m!336015))

(declare-fun m!336029 () Bool)

(assert (=> b!217772 m!336029))

(assert (=> b!217772 m!335431))

(declare-fun m!336031 () Bool)

(assert (=> b!217772 m!336031))

(declare-fun m!336033 () Bool)

(assert (=> b!217772 m!336033))

(declare-fun m!336035 () Bool)

(assert (=> b!217772 m!336035))

(declare-fun m!336037 () Bool)

(assert (=> b!217772 m!336037))

(declare-fun m!336039 () Bool)

(assert (=> b!217772 m!336039))

(declare-fun m!336041 () Bool)

(assert (=> b!217772 m!336041))

(declare-fun m!336043 () Bool)

(assert (=> b!217772 m!336043))

(declare-fun m!336045 () Bool)

(assert (=> b!217772 m!336045))

(assert (=> b!217772 m!335979))

(declare-fun m!336047 () Bool)

(assert (=> b!217772 m!336047))

(declare-fun m!336049 () Bool)

(assert (=> b!217772 m!336049))

(declare-fun m!336051 () Bool)

(assert (=> b!217772 m!336051))

(assert (=> b!217772 m!335447))

(declare-fun m!336053 () Bool)

(assert (=> b!217772 m!336053))

(declare-fun m!336055 () Bool)

(assert (=> b!217772 m!336055))

(declare-fun m!336057 () Bool)

(assert (=> b!217772 m!336057))

(declare-fun m!336059 () Bool)

(assert (=> b!217772 m!336059))

(declare-fun m!336061 () Bool)

(assert (=> b!217772 m!336061))

(declare-fun m!336063 () Bool)

(assert (=> b!217772 m!336063))

(declare-fun m!336065 () Bool)

(assert (=> b!217772 m!336065))

(declare-fun m!336067 () Bool)

(assert (=> b!217784 m!336067))

(assert (=> b!217784 m!336001))

(declare-fun m!336069 () Bool)

(assert (=> bm!3405 m!336069))

(assert (=> b!217385 d!73817))

(declare-fun d!73885 () Bool)

(assert (=> d!73885 (= (array_inv!4401 (buf!5204 thiss!1204)) (bvsge (size!4660 (buf!5204 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!217397 d!73885))

(declare-fun d!73887 () Bool)

(assert (=> d!73887 (= (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204))) (and (bvsge (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9792 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9797 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204))) (and (= (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204)))))))))

(assert (=> b!217387 d!73887))

(declare-fun d!73889 () Bool)

(declare-fun e!148037 () Bool)

(assert (=> d!73889 e!148037))

(declare-fun res!183272 () Bool)

(assert (=> d!73889 (=> (not res!183272) (not e!148037))))

(declare-fun lt!345027 () (_ BitVec 64))

(declare-fun lt!345025 () (_ BitVec 64))

(declare-fun lt!345024 () (_ BitVec 64))

(assert (=> d!73889 (= res!183272 (= lt!345025 (bvsub lt!345024 lt!345027)))))

(assert (=> d!73889 (or (= (bvand lt!345024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345024 lt!345027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73889 (= lt!345027 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9926 lt!344195)))) ((_ sign_extend 32) (currentByte!9797 (_1!9926 lt!344195))) ((_ sign_extend 32) (currentBit!9792 (_1!9926 lt!344195)))))))

(declare-fun lt!345028 () (_ BitVec 64))

(declare-fun lt!345023 () (_ BitVec 64))

(assert (=> d!73889 (= lt!345024 (bvmul lt!345028 lt!345023))))

(assert (=> d!73889 (or (= lt!345028 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345023 (bvsdiv (bvmul lt!345028 lt!345023) lt!345028)))))

(assert (=> d!73889 (= lt!345023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73889 (= lt!345028 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9926 lt!344195)))))))

(assert (=> d!73889 (= lt!345025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_1!9926 lt!344195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_1!9926 lt!344195)))))))

(assert (=> d!73889 (invariant!0 (currentBit!9792 (_1!9926 lt!344195)) (currentByte!9797 (_1!9926 lt!344195)) (size!4660 (buf!5204 (_1!9926 lt!344195))))))

(assert (=> d!73889 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9926 lt!344195))) (currentByte!9797 (_1!9926 lt!344195)) (currentBit!9792 (_1!9926 lt!344195))) lt!345025)))

(declare-fun b!217788 () Bool)

(declare-fun res!183271 () Bool)

(assert (=> b!217788 (=> (not res!183271) (not e!148037))))

(assert (=> b!217788 (= res!183271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345025))))

(declare-fun b!217789 () Bool)

(declare-fun lt!345026 () (_ BitVec 64))

(assert (=> b!217789 (= e!148037 (bvsle lt!345025 (bvmul lt!345026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217789 (or (= lt!345026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345026)))))

(assert (=> b!217789 (= lt!345026 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9926 lt!344195)))))))

(assert (= (and d!73889 res!183272) b!217788))

(assert (= (and b!217788 res!183271) b!217789))

(declare-fun m!336071 () Bool)

(assert (=> d!73889 m!336071))

(declare-fun m!336073 () Bool)

(assert (=> d!73889 m!336073))

(assert (=> b!217388 d!73889))

(declare-fun d!73891 () Bool)

(declare-fun e!148038 () Bool)

(assert (=> d!73891 e!148038))

(declare-fun res!183274 () Bool)

(assert (=> d!73891 (=> (not res!183274) (not e!148038))))

(declare-fun lt!345031 () (_ BitVec 64))

(declare-fun lt!345030 () (_ BitVec 64))

(declare-fun lt!345033 () (_ BitVec 64))

(assert (=> d!73891 (= res!183274 (= lt!345031 (bvsub lt!345030 lt!345033)))))

(assert (=> d!73891 (or (= (bvand lt!345030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345030 lt!345033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73891 (= lt!345033 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9925 lt!344185)))) ((_ sign_extend 32) (currentByte!9797 (_2!9925 lt!344185))) ((_ sign_extend 32) (currentBit!9792 (_2!9925 lt!344185)))))))

(declare-fun lt!345034 () (_ BitVec 64))

(declare-fun lt!345029 () (_ BitVec 64))

(assert (=> d!73891 (= lt!345030 (bvmul lt!345034 lt!345029))))

(assert (=> d!73891 (or (= lt!345034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345029 (bvsdiv (bvmul lt!345034 lt!345029) lt!345034)))))

(assert (=> d!73891 (= lt!345029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73891 (= lt!345034 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9925 lt!344185)))))))

(assert (=> d!73891 (= lt!345031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_2!9925 lt!344185))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_2!9925 lt!344185)))))))

(assert (=> d!73891 (invariant!0 (currentBit!9792 (_2!9925 lt!344185)) (currentByte!9797 (_2!9925 lt!344185)) (size!4660 (buf!5204 (_2!9925 lt!344185))))))

(assert (=> d!73891 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9925 lt!344185))) (currentByte!9797 (_2!9925 lt!344185)) (currentBit!9792 (_2!9925 lt!344185))) lt!345031)))

(declare-fun b!217790 () Bool)

(declare-fun res!183273 () Bool)

(assert (=> b!217790 (=> (not res!183273) (not e!148038))))

(assert (=> b!217790 (= res!183273 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345031))))

(declare-fun b!217791 () Bool)

(declare-fun lt!345032 () (_ BitVec 64))

(assert (=> b!217791 (= e!148038 (bvsle lt!345031 (bvmul lt!345032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217791 (or (= lt!345032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345032)))))

(assert (=> b!217791 (= lt!345032 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9925 lt!344185)))))))

(assert (= (and d!73891 res!183274) b!217790))

(assert (= (and b!217790 res!183273) b!217791))

(declare-fun m!336075 () Bool)

(assert (=> d!73891 m!336075))

(declare-fun m!336077 () Bool)

(assert (=> d!73891 m!336077))

(assert (=> b!217388 d!73891))

(declare-fun d!73893 () Bool)

(declare-fun e!148041 () Bool)

(assert (=> d!73893 e!148041))

(declare-fun res!183277 () Bool)

(assert (=> d!73893 (=> (not res!183277) (not e!148041))))

(declare-fun lt!345039 () BitStream!8428)

(declare-fun lt!345040 () (_ BitVec 64))

(assert (=> d!73893 (= res!183277 (= (bvadd lt!345040 (bvsub lt!344188 lt!344208)) (bitIndex!0 (size!4660 (buf!5204 lt!345039)) (currentByte!9797 lt!345039) (currentBit!9792 lt!345039))))))

(assert (=> d!73893 (or (not (= (bvand lt!345040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344188 lt!344208) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345040 (bvsub lt!344188 lt!344208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73893 (= lt!345040 (bitIndex!0 (size!4660 (buf!5204 (_2!9925 lt!344185))) (currentByte!9797 (_2!9925 lt!344185)) (currentBit!9792 (_2!9925 lt!344185))))))

(declare-fun moveBitIndex!0 (BitStream!8428 (_ BitVec 64)) tuple2!18530)

(assert (=> d!73893 (= lt!345039 (_2!9923 (moveBitIndex!0 (_2!9925 lt!344185) (bvsub lt!344188 lt!344208))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8428 (_ BitVec 64)) Bool)

(assert (=> d!73893 (moveBitIndexPrecond!0 (_2!9925 lt!344185) (bvsub lt!344188 lt!344208))))

(assert (=> d!73893 (= (withMovedBitIndex!0 (_2!9925 lt!344185) (bvsub lt!344188 lt!344208)) lt!345039)))

(declare-fun b!217794 () Bool)

(assert (=> b!217794 (= e!148041 (= (size!4660 (buf!5204 (_2!9925 lt!344185))) (size!4660 (buf!5204 lt!345039))))))

(assert (= (and d!73893 res!183277) b!217794))

(declare-fun m!336079 () Bool)

(assert (=> d!73893 m!336079))

(assert (=> d!73893 m!335453))

(declare-fun m!336081 () Bool)

(assert (=> d!73893 m!336081))

(declare-fun m!336083 () Bool)

(assert (=> d!73893 m!336083))

(assert (=> b!217399 d!73893))

(assert (=> b!217400 d!73789))

(declare-fun d!73895 () Bool)

(assert (=> d!73895 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!217389 d!73895))

(declare-fun d!73897 () Bool)

(declare-fun e!148042 () Bool)

(assert (=> d!73897 e!148042))

(declare-fun res!183278 () Bool)

(assert (=> d!73897 (=> (not res!183278) (not e!148042))))

(declare-fun lt!345042 () (_ BitVec 64))

(declare-fun lt!345041 () BitStream!8428)

(assert (=> d!73897 (= res!183278 (= (bvadd lt!345042 (bvsub lt!344204 lt!344208)) (bitIndex!0 (size!4660 (buf!5204 lt!345041)) (currentByte!9797 lt!345041) (currentBit!9792 lt!345041))))))

(assert (=> d!73897 (or (not (= (bvand lt!345042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344204 lt!344208) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345042 (bvsub lt!344204 lt!344208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73897 (= lt!345042 (bitIndex!0 (size!4660 (buf!5204 (_2!9925 lt!344199))) (currentByte!9797 (_2!9925 lt!344199)) (currentBit!9792 (_2!9925 lt!344199))))))

(assert (=> d!73897 (= lt!345041 (_2!9923 (moveBitIndex!0 (_2!9925 lt!344199) (bvsub lt!344204 lt!344208))))))

(assert (=> d!73897 (moveBitIndexPrecond!0 (_2!9925 lt!344199) (bvsub lt!344204 lt!344208))))

(assert (=> d!73897 (= (withMovedBitIndex!0 (_2!9925 lt!344199) (bvsub lt!344204 lt!344208)) lt!345041)))

(declare-fun b!217795 () Bool)

(assert (=> b!217795 (= e!148042 (= (size!4660 (buf!5204 (_2!9925 lt!344199))) (size!4660 (buf!5204 lt!345041))))))

(assert (= (and d!73897 res!183278) b!217795))

(declare-fun m!336085 () Bool)

(assert (=> d!73897 m!336085))

(declare-fun m!336087 () Bool)

(assert (=> d!73897 m!336087))

(declare-fun m!336089 () Bool)

(assert (=> d!73897 m!336089))

(declare-fun m!336091 () Bool)

(assert (=> d!73897 m!336091))

(assert (=> b!217390 d!73897))

(declare-fun d!73899 () Bool)

(declare-fun res!183279 () Bool)

(declare-fun e!148044 () Bool)

(assert (=> d!73899 (=> (not res!183279) (not e!148044))))

(assert (=> d!73899 (= res!183279 (= (size!4660 (buf!5204 (_2!9923 lt!344203))) (size!4660 (buf!5204 (_2!9923 lt!344183)))))))

(assert (=> d!73899 (= (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344183)) e!148044)))

(declare-fun b!217796 () Bool)

(declare-fun res!183280 () Bool)

(assert (=> b!217796 (=> (not res!183280) (not e!148044))))

(assert (=> b!217796 (= res!183280 (bvsle (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183)))))))

(declare-fun b!217797 () Bool)

(declare-fun e!148043 () Bool)

(assert (=> b!217797 (= e!148044 e!148043)))

(declare-fun res!183281 () Bool)

(assert (=> b!217797 (=> res!183281 e!148043)))

(assert (=> b!217797 (= res!183281 (= (size!4660 (buf!5204 (_2!9923 lt!344203))) #b00000000000000000000000000000000))))

(declare-fun b!217798 () Bool)

(assert (=> b!217798 (= e!148043 (arrayBitRangesEq!0 (buf!5204 (_2!9923 lt!344203)) (buf!5204 (_2!9923 lt!344183)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203)))))))

(assert (= (and d!73899 res!183279) b!217796))

(assert (= (and b!217796 res!183280) b!217797))

(assert (= (and b!217797 (not res!183281)) b!217798))

(assert (=> b!217796 m!335447))

(assert (=> b!217796 m!335455))

(assert (=> b!217798 m!335447))

(assert (=> b!217798 m!335447))

(declare-fun m!336093 () Bool)

(assert (=> b!217798 m!336093))

(assert (=> b!217380 d!73899))

(declare-fun d!73901 () Bool)

(assert (=> d!73901 (= (invariant!0 (currentBit!9792 (_2!9923 lt!344183)) (currentByte!9797 (_2!9923 lt!344183)) (size!4660 (buf!5204 (_2!9923 lt!344183)))) (and (bvsge (currentBit!9792 (_2!9923 lt!344183)) #b00000000000000000000000000000000) (bvslt (currentBit!9792 (_2!9923 lt!344183)) #b00000000000000000000000000001000) (bvsge (currentByte!9797 (_2!9923 lt!344183)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9797 (_2!9923 lt!344183)) (size!4660 (buf!5204 (_2!9923 lt!344183)))) (and (= (currentBit!9792 (_2!9923 lt!344183)) #b00000000000000000000000000000000) (= (currentByte!9797 (_2!9923 lt!344183)) (size!4660 (buf!5204 (_2!9923 lt!344183))))))))))

(assert (=> b!217401 d!73901))

(declare-fun d!73903 () Bool)

(declare-fun e!148045 () Bool)

(assert (=> d!73903 e!148045))

(declare-fun res!183283 () Bool)

(assert (=> d!73903 (=> (not res!183283) (not e!148045))))

(declare-fun lt!345047 () (_ BitVec 64))

(declare-fun lt!345044 () (_ BitVec 64))

(declare-fun lt!345045 () (_ BitVec 64))

(assert (=> d!73903 (= res!183283 (= lt!345045 (bvsub lt!345044 lt!345047)))))

(assert (=> d!73903 (or (= (bvand lt!345044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345044 lt!345047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73903 (= lt!345047 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344203)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203)))))))

(declare-fun lt!345048 () (_ BitVec 64))

(declare-fun lt!345043 () (_ BitVec 64))

(assert (=> d!73903 (= lt!345044 (bvmul lt!345048 lt!345043))))

(assert (=> d!73903 (or (= lt!345048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345043 (bvsdiv (bvmul lt!345048 lt!345043) lt!345048)))))

(assert (=> d!73903 (= lt!345043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73903 (= lt!345048 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (=> d!73903 (= lt!345045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203)))))))

(assert (=> d!73903 (invariant!0 (currentBit!9792 (_2!9923 lt!344203)) (currentByte!9797 (_2!9923 lt!344203)) (size!4660 (buf!5204 (_2!9923 lt!344203))))))

(assert (=> d!73903 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))) lt!345045)))

(declare-fun b!217799 () Bool)

(declare-fun res!183282 () Bool)

(assert (=> b!217799 (=> (not res!183282) (not e!148045))))

(assert (=> b!217799 (= res!183282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345045))))

(declare-fun b!217800 () Bool)

(declare-fun lt!345046 () (_ BitVec 64))

(assert (=> b!217800 (= e!148045 (bvsle lt!345045 (bvmul lt!345046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217800 (or (= lt!345046 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345046 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345046)))))

(assert (=> b!217800 (= lt!345046 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (= (and d!73903 res!183283) b!217799))

(assert (= (and b!217799 res!183282) b!217800))

(declare-fun m!336095 () Bool)

(assert (=> d!73903 m!336095))

(declare-fun m!336097 () Bool)

(assert (=> d!73903 m!336097))

(assert (=> b!217392 d!73903))

(declare-fun d!73905 () Bool)

(declare-fun e!148046 () Bool)

(assert (=> d!73905 e!148046))

(declare-fun res!183285 () Bool)

(assert (=> d!73905 (=> (not res!183285) (not e!148046))))

(declare-fun lt!345050 () (_ BitVec 64))

(declare-fun lt!345051 () (_ BitVec 64))

(declare-fun lt!345053 () (_ BitVec 64))

(assert (=> d!73905 (= res!183285 (= lt!345051 (bvsub lt!345050 lt!345053)))))

(assert (=> d!73905 (or (= (bvand lt!345050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345050 lt!345053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73905 (= lt!345053 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204))))))

(declare-fun lt!345054 () (_ BitVec 64))

(declare-fun lt!345049 () (_ BitVec 64))

(assert (=> d!73905 (= lt!345050 (bvmul lt!345054 lt!345049))))

(assert (=> d!73905 (or (= lt!345054 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345049 (bvsdiv (bvmul lt!345054 lt!345049) lt!345054)))))

(assert (=> d!73905 (= lt!345049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73905 (= lt!345054 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))))))

(assert (=> d!73905 (= lt!345051 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 thiss!1204))))))

(assert (=> d!73905 (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 thiss!1204)))))

(assert (=> d!73905 (= (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)) lt!345051)))

(declare-fun b!217801 () Bool)

(declare-fun res!183284 () Bool)

(assert (=> b!217801 (=> (not res!183284) (not e!148046))))

(assert (=> b!217801 (= res!183284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345051))))

(declare-fun b!217802 () Bool)

(declare-fun lt!345052 () (_ BitVec 64))

(assert (=> b!217802 (= e!148046 (bvsle lt!345051 (bvmul lt!345052 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217802 (or (= lt!345052 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345052 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345052)))))

(assert (=> b!217802 (= lt!345052 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))))))

(assert (= (and d!73905 res!183285) b!217801))

(assert (= (and b!217801 res!183284) b!217802))

(assert (=> d!73905 m!335731))

(assert (=> d!73905 m!335429))

(assert (=> b!217392 d!73905))

(declare-fun b!217846 () Bool)

(declare-fun e!148070 () Bool)

(declare-fun e!148069 () Bool)

(assert (=> b!217846 (= e!148070 e!148069)))

(declare-fun res!183321 () Bool)

(assert (=> b!217846 (=> (not res!183321) (not e!148069))))

(declare-fun lt!345176 () tuple2!18530)

(declare-fun lt!345177 () tuple2!18532)

(assert (=> b!217846 (= res!183321 (and (= (_2!9924 lt!345177) lt!344187) (= (_1!9924 lt!345177) (_2!9923 lt!345176))))))

(assert (=> b!217846 (= lt!345177 (readBitPure!0 (readerFrom!0 (_2!9923 lt!345176) (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204))))))

(declare-fun b!217845 () Bool)

(declare-fun res!183318 () Bool)

(assert (=> b!217845 (=> (not res!183318) (not e!148070))))

(assert (=> b!217845 (= res!183318 (isPrefixOf!0 thiss!1204 (_2!9923 lt!345176)))))

(declare-fun d!73907 () Bool)

(assert (=> d!73907 e!148070))

(declare-fun res!183319 () Bool)

(assert (=> d!73907 (=> (not res!183319) (not e!148070))))

(assert (=> d!73907 (= res!183319 (= (size!4660 (buf!5204 thiss!1204)) (size!4660 (buf!5204 (_2!9923 lt!345176)))))))

(declare-fun choose!16 (BitStream!8428 Bool) tuple2!18530)

(assert (=> d!73907 (= lt!345176 (choose!16 thiss!1204 lt!344187))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!73907 (validate_offset_bit!0 ((_ sign_extend 32) (size!4660 (buf!5204 thiss!1204))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)))))

(assert (=> d!73907 (= (appendBit!0 thiss!1204 lt!344187) lt!345176)))

(declare-fun b!217847 () Bool)

(assert (=> b!217847 (= e!148069 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!345177))) (currentByte!9797 (_1!9924 lt!345177)) (currentBit!9792 (_1!9924 lt!345177))) (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!345176))) (currentByte!9797 (_2!9923 lt!345176)) (currentBit!9792 (_2!9923 lt!345176)))))))

(declare-fun b!217844 () Bool)

(declare-fun res!183320 () Bool)

(assert (=> b!217844 (=> (not res!183320) (not e!148070))))

(declare-fun lt!345175 () (_ BitVec 64))

(declare-fun lt!345178 () (_ BitVec 64))

(assert (=> b!217844 (= res!183320 (= (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!345176))) (currentByte!9797 (_2!9923 lt!345176)) (currentBit!9792 (_2!9923 lt!345176))) (bvadd lt!345178 lt!345175)))))

(assert (=> b!217844 (or (not (= (bvand lt!345178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345178 lt!345175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217844 (= lt!345175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!217844 (= lt!345178 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(assert (= (and d!73907 res!183319) b!217844))

(assert (= (and b!217844 res!183320) b!217845))

(assert (= (and b!217845 res!183318) b!217846))

(assert (= (and b!217846 res!183321) b!217847))

(declare-fun m!336099 () Bool)

(assert (=> d!73907 m!336099))

(declare-fun m!336101 () Bool)

(assert (=> d!73907 m!336101))

(declare-fun m!336103 () Bool)

(assert (=> b!217846 m!336103))

(assert (=> b!217846 m!336103))

(declare-fun m!336105 () Bool)

(assert (=> b!217846 m!336105))

(declare-fun m!336107 () Bool)

(assert (=> b!217847 m!336107))

(declare-fun m!336109 () Bool)

(assert (=> b!217847 m!336109))

(assert (=> b!217844 m!336109))

(assert (=> b!217844 m!335449))

(declare-fun m!336111 () Bool)

(assert (=> b!217845 m!336111))

(assert (=> b!217392 d!73907))

(declare-fun d!73909 () Bool)

(declare-datatypes ((tuple2!18560 0))(
  ( (tuple2!18561 (_1!9938 Bool) (_2!9938 BitStream!8428)) )
))
(declare-fun lt!345181 () tuple2!18560)

(declare-fun readBit!0 (BitStream!8428) tuple2!18560)

(assert (=> d!73909 (= lt!345181 (readBit!0 (readerFrom!0 (_2!9923 lt!344203) (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204))))))

(assert (=> d!73909 (= (readBitPure!0 (readerFrom!0 (_2!9923 lt!344203) (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204))) (tuple2!18533 (_2!9938 lt!345181) (_1!9938 lt!345181)))))

(declare-fun bs!18029 () Bool)

(assert (= bs!18029 d!73909))

(assert (=> bs!18029 m!335437))

(declare-fun m!336113 () Bool)

(assert (=> bs!18029 m!336113))

(assert (=> b!217381 d!73909))

(declare-fun d!73911 () Bool)

(declare-fun e!148073 () Bool)

(assert (=> d!73911 e!148073))

(declare-fun res!183325 () Bool)

(assert (=> d!73911 (=> (not res!183325) (not e!148073))))

(assert (=> d!73911 (= res!183325 (invariant!0 (currentBit!9792 (_2!9923 lt!344203)) (currentByte!9797 (_2!9923 lt!344203)) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (=> d!73911 (= (readerFrom!0 (_2!9923 lt!344203) (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204)) (BitStream!8429 (buf!5204 (_2!9923 lt!344203)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(declare-fun b!217850 () Bool)

(assert (=> b!217850 (= e!148073 (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344203)))))))

(assert (= (and d!73911 res!183325) b!217850))

(assert (=> d!73911 m!336097))

(assert (=> b!217850 m!335481))

(assert (=> b!217381 d!73911))

(declare-fun d!73913 () Bool)

(declare-fun lt!345252 () tuple2!18536)

(declare-fun lt!345250 () tuple2!18536)

(assert (=> d!73913 (and (= (_2!9926 lt!345252) (_2!9926 lt!345250)) (= (_1!9926 lt!345252) (_1!9926 lt!345250)))))

(declare-fun lt!345254 () BitStream!8428)

(declare-fun lt!345255 () (_ BitVec 64))

(declare-fun lt!345253 () Unit!15478)

(declare-fun lt!345251 () Bool)

(declare-fun choose!56 (BitStream!8428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18536 tuple2!18536 BitStream!8428 (_ BitVec 64) Bool BitStream!8428 (_ BitVec 64) tuple2!18536 tuple2!18536 BitStream!8428 (_ BitVec 64)) Unit!15478)

(assert (=> d!73913 (= lt!345253 (choose!56 (_1!9925 lt!344185) nBits!348 i!590 lt!344202 lt!345252 (tuple2!18537 (_1!9926 lt!345252) (_2!9926 lt!345252)) (_1!9926 lt!345252) (_2!9926 lt!345252) lt!345251 lt!345254 lt!345255 lt!345250 (tuple2!18537 (_1!9926 lt!345250) (_2!9926 lt!345250)) (_1!9926 lt!345250) (_2!9926 lt!345250)))))

(assert (=> d!73913 (= lt!345250 (readNBitsLSBFirstsLoopPure!0 lt!345254 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!345255))))

(assert (=> d!73913 (= lt!345255 (bvor lt!344202 (ite lt!345251 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73913 (= lt!345254 (withMovedBitIndex!0 (_1!9925 lt!344185) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73913 (= lt!345251 (_2!9924 (readBitPure!0 (_1!9925 lt!344185))))))

(assert (=> d!73913 (= lt!345252 (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202))))

(assert (=> d!73913 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202) lt!345253)))

(declare-fun bs!18031 () Bool)

(assert (= bs!18031 d!73913))

(assert (=> bs!18031 m!335503))

(assert (=> bs!18031 m!335475))

(declare-fun m!336127 () Bool)

(assert (=> bs!18031 m!336127))

(assert (=> bs!18031 m!335487))

(declare-fun m!336135 () Bool)

(assert (=> bs!18031 m!336135))

(assert (=> b!217382 d!73913))

(declare-datatypes ((tuple2!18562 0))(
  ( (tuple2!18563 (_1!9939 (_ BitVec 64)) (_2!9939 BitStream!8428)) )
))
(declare-fun lt!345258 () tuple2!18562)

(declare-fun d!73915 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18562)

(assert (=> d!73915 (= lt!345258 (readNBitsLSBFirstsLoop!0 lt!344211 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198))))

(assert (=> d!73915 (= (readNBitsLSBFirstsLoopPure!0 lt!344211 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198) (tuple2!18537 (_2!9939 lt!345258) (_1!9939 lt!345258)))))

(declare-fun bs!18032 () Bool)

(assert (= bs!18032 d!73915))

(declare-fun m!336211 () Bool)

(assert (=> bs!18032 m!336211))

(assert (=> b!217382 d!73915))

(declare-fun d!73921 () Bool)

(declare-fun e!148083 () Bool)

(assert (=> d!73921 e!148083))

(declare-fun res!183338 () Bool)

(assert (=> d!73921 (=> (not res!183338) (not e!148083))))

(declare-fun lt!345260 () (_ BitVec 64))

(declare-fun lt!345259 () BitStream!8428)

(assert (=> d!73921 (= res!183338 (= (bvadd lt!345260 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4660 (buf!5204 lt!345259)) (currentByte!9797 lt!345259) (currentBit!9792 lt!345259))))))

(assert (=> d!73921 (or (not (= (bvand lt!345260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345260 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73921 (= lt!345260 (bitIndex!0 (size!4660 (buf!5204 (_1!9925 lt!344185))) (currentByte!9797 (_1!9925 lt!344185)) (currentBit!9792 (_1!9925 lt!344185))))))

(assert (=> d!73921 (= lt!345259 (_2!9923 (moveBitIndex!0 (_1!9925 lt!344185) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73921 (moveBitIndexPrecond!0 (_1!9925 lt!344185) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73921 (= (withMovedBitIndex!0 (_1!9925 lt!344185) #b0000000000000000000000000000000000000000000000000000000000000001) lt!345259)))

(declare-fun b!217867 () Bool)

(assert (=> b!217867 (= e!148083 (= (size!4660 (buf!5204 (_1!9925 lt!344185))) (size!4660 (buf!5204 lt!345259))))))

(assert (= (and d!73921 res!183338) b!217867))

(declare-fun m!336213 () Bool)

(assert (=> d!73921 m!336213))

(declare-fun m!336215 () Bool)

(assert (=> d!73921 m!336215))

(declare-fun m!336217 () Bool)

(assert (=> d!73921 m!336217))

(declare-fun m!336219 () Bool)

(assert (=> d!73921 m!336219))

(assert (=> b!217382 d!73921))

(declare-fun d!73923 () Bool)

(declare-fun e!148084 () Bool)

(assert (=> d!73923 e!148084))

(declare-fun res!183340 () Bool)

(assert (=> d!73923 (=> (not res!183340) (not e!148084))))

(declare-fun lt!345265 () (_ BitVec 64))

(declare-fun lt!345263 () (_ BitVec 64))

(declare-fun lt!345262 () (_ BitVec 64))

(assert (=> d!73923 (= res!183340 (= lt!345263 (bvsub lt!345262 lt!345265)))))

(assert (=> d!73923 (or (= (bvand lt!345262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345262 lt!345265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73923 (= lt!345265 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344194)))) ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344194))) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344194)))))))

(declare-fun lt!345266 () (_ BitVec 64))

(declare-fun lt!345261 () (_ BitVec 64))

(assert (=> d!73923 (= lt!345262 (bvmul lt!345266 lt!345261))))

(assert (=> d!73923 (or (= lt!345266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345261 (bvsdiv (bvmul lt!345266 lt!345261) lt!345266)))))

(assert (=> d!73923 (= lt!345261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73923 (= lt!345266 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344194)))))))

(assert (=> d!73923 (= lt!345263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344194))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344194)))))))

(assert (=> d!73923 (invariant!0 (currentBit!9792 (_1!9924 lt!344194)) (currentByte!9797 (_1!9924 lt!344194)) (size!4660 (buf!5204 (_1!9924 lt!344194))))))

(assert (=> d!73923 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344194))) (currentByte!9797 (_1!9924 lt!344194)) (currentBit!9792 (_1!9924 lt!344194))) lt!345263)))

(declare-fun b!217868 () Bool)

(declare-fun res!183339 () Bool)

(assert (=> b!217868 (=> (not res!183339) (not e!148084))))

(assert (=> b!217868 (= res!183339 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345263))))

(declare-fun b!217869 () Bool)

(declare-fun lt!345264 () (_ BitVec 64))

(assert (=> b!217869 (= e!148084 (bvsle lt!345263 (bvmul lt!345264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217869 (or (= lt!345264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345264)))))

(assert (=> b!217869 (= lt!345264 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344194)))))))

(assert (= (and d!73923 res!183340) b!217868))

(assert (= (and b!217868 res!183339) b!217869))

(declare-fun m!336221 () Bool)

(assert (=> d!73923 m!336221))

(declare-fun m!336223 () Bool)

(assert (=> d!73923 m!336223))

(assert (=> b!217404 d!73923))

(declare-fun d!73925 () Bool)

(assert (=> d!73925 (= (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344183)))) (and (bvsge (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9792 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9797 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344183)))) (and (= (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344183))))))))))

(assert (=> b!217393 d!73925))

(assert (=> b!217394 d!73903))

(assert (=> b!217394 d!73905))

(declare-fun e!148090 () Bool)

(declare-fun lt!345349 () tuple2!18534)

(declare-fun lt!345334 () (_ BitVec 64))

(declare-fun b!217881 () Bool)

(declare-fun lt!345351 () (_ BitVec 64))

(assert (=> b!217881 (= e!148090 (= (_1!9925 lt!345349) (withMovedBitIndex!0 (_2!9925 lt!345349) (bvsub lt!345334 lt!345351))))))

(assert (=> b!217881 (or (= (bvand lt!345334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345334 lt!345351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217881 (= lt!345351 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183))))))

(assert (=> b!217881 (= lt!345334 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(declare-fun b!217882 () Bool)

(declare-fun res!183349 () Bool)

(assert (=> b!217882 (=> (not res!183349) (not e!148090))))

(assert (=> b!217882 (= res!183349 (isPrefixOf!0 (_2!9925 lt!345349) (_2!9923 lt!344183)))))

(declare-fun b!217883 () Bool)

(declare-fun e!148091 () Unit!15478)

(declare-fun lt!345347 () Unit!15478)

(assert (=> b!217883 (= e!148091 lt!345347)))

(declare-fun lt!345335 () (_ BitVec 64))

(assert (=> b!217883 (= lt!345335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!345336 () (_ BitVec 64))

(assert (=> b!217883 (= lt!345336 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344203))) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10613 array!10613 (_ BitVec 64) (_ BitVec 64)) Unit!15478)

(assert (=> b!217883 (= lt!345347 (arrayBitRangesEqSymmetric!0 (buf!5204 (_2!9923 lt!344203)) (buf!5204 (_2!9923 lt!344183)) lt!345335 lt!345336))))

(assert (=> b!217883 (arrayBitRangesEq!0 (buf!5204 (_2!9923 lt!344183)) (buf!5204 (_2!9923 lt!344203)) lt!345335 lt!345336)))

(declare-fun d!73927 () Bool)

(assert (=> d!73927 e!148090))

(declare-fun res!183348 () Bool)

(assert (=> d!73927 (=> (not res!183348) (not e!148090))))

(assert (=> d!73927 (= res!183348 (isPrefixOf!0 (_1!9925 lt!345349) (_2!9925 lt!345349)))))

(declare-fun lt!345342 () BitStream!8428)

(assert (=> d!73927 (= lt!345349 (tuple2!18535 lt!345342 (_2!9923 lt!344183)))))

(declare-fun lt!345333 () Unit!15478)

(declare-fun lt!345348 () Unit!15478)

(assert (=> d!73927 (= lt!345333 lt!345348)))

(assert (=> d!73927 (isPrefixOf!0 lt!345342 (_2!9923 lt!344183))))

(assert (=> d!73927 (= lt!345348 (lemmaIsPrefixTransitive!0 lt!345342 (_2!9923 lt!344183) (_2!9923 lt!344183)))))

(declare-fun lt!345350 () Unit!15478)

(declare-fun lt!345344 () Unit!15478)

(assert (=> d!73927 (= lt!345350 lt!345344)))

(assert (=> d!73927 (isPrefixOf!0 lt!345342 (_2!9923 lt!344183))))

(assert (=> d!73927 (= lt!345344 (lemmaIsPrefixTransitive!0 lt!345342 (_2!9923 lt!344203) (_2!9923 lt!344183)))))

(declare-fun lt!345338 () Unit!15478)

(assert (=> d!73927 (= lt!345338 e!148091)))

(declare-fun c!10653 () Bool)

(assert (=> d!73927 (= c!10653 (not (= (size!4660 (buf!5204 (_2!9923 lt!344203))) #b00000000000000000000000000000000)))))

(declare-fun lt!345345 () Unit!15478)

(declare-fun lt!345343 () Unit!15478)

(assert (=> d!73927 (= lt!345345 lt!345343)))

(assert (=> d!73927 (isPrefixOf!0 (_2!9923 lt!344183) (_2!9923 lt!344183))))

(assert (=> d!73927 (= lt!345343 (lemmaIsPrefixRefl!0 (_2!9923 lt!344183)))))

(declare-fun lt!345341 () Unit!15478)

(declare-fun lt!345337 () Unit!15478)

(assert (=> d!73927 (= lt!345341 lt!345337)))

(assert (=> d!73927 (= lt!345337 (lemmaIsPrefixRefl!0 (_2!9923 lt!344183)))))

(declare-fun lt!345352 () Unit!15478)

(declare-fun lt!345346 () Unit!15478)

(assert (=> d!73927 (= lt!345352 lt!345346)))

(assert (=> d!73927 (isPrefixOf!0 lt!345342 lt!345342)))

(assert (=> d!73927 (= lt!345346 (lemmaIsPrefixRefl!0 lt!345342))))

(declare-fun lt!345340 () Unit!15478)

(declare-fun lt!345339 () Unit!15478)

(assert (=> d!73927 (= lt!345340 lt!345339)))

(assert (=> d!73927 (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344203))))

(assert (=> d!73927 (= lt!345339 (lemmaIsPrefixRefl!0 (_2!9923 lt!344203)))))

(assert (=> d!73927 (= lt!345342 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203))))))

(assert (=> d!73927 (isPrefixOf!0 (_2!9923 lt!344203) (_2!9923 lt!344183))))

(assert (=> d!73927 (= (reader!0 (_2!9923 lt!344203) (_2!9923 lt!344183)) lt!345349)))

(declare-fun b!217884 () Bool)

(declare-fun res!183350 () Bool)

(assert (=> b!217884 (=> (not res!183350) (not e!148090))))

(assert (=> b!217884 (= res!183350 (isPrefixOf!0 (_1!9925 lt!345349) (_2!9923 lt!344203)))))

(declare-fun b!217885 () Bool)

(declare-fun Unit!15510 () Unit!15478)

(assert (=> b!217885 (= e!148091 Unit!15510)))

(assert (= (and d!73927 c!10653) b!217883))

(assert (= (and d!73927 (not c!10653)) b!217885))

(assert (= (and d!73927 res!183348) b!217884))

(assert (= (and b!217884 res!183350) b!217882))

(assert (= (and b!217882 res!183349) b!217881))

(assert (=> d!73927 m!335989))

(declare-fun m!336241 () Bool)

(assert (=> d!73927 m!336241))

(declare-fun m!336243 () Bool)

(assert (=> d!73927 m!336243))

(declare-fun m!336245 () Bool)

(assert (=> d!73927 m!336245))

(assert (=> d!73927 m!335425))

(declare-fun m!336247 () Bool)

(assert (=> d!73927 m!336247))

(declare-fun m!336249 () Bool)

(assert (=> d!73927 m!336249))

(declare-fun m!336251 () Bool)

(assert (=> d!73927 m!336251))

(declare-fun m!336253 () Bool)

(assert (=> d!73927 m!336253))

(declare-fun m!336255 () Bool)

(assert (=> d!73927 m!336255))

(declare-fun m!336257 () Bool)

(assert (=> d!73927 m!336257))

(declare-fun m!336259 () Bool)

(assert (=> b!217881 m!336259))

(assert (=> b!217881 m!335455))

(assert (=> b!217881 m!335447))

(declare-fun m!336261 () Bool)

(assert (=> b!217884 m!336261))

(declare-fun m!336263 () Bool)

(assert (=> b!217882 m!336263))

(assert (=> b!217883 m!335447))

(declare-fun m!336265 () Bool)

(assert (=> b!217883 m!336265))

(declare-fun m!336267 () Bool)

(assert (=> b!217883 m!336267))

(assert (=> b!217383 d!73927))

(declare-fun d!73937 () Bool)

(assert (=> d!73937 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)) lt!344196)))

(declare-fun lt!345355 () Unit!15478)

(declare-fun choose!9 (BitStream!8428 array!10613 (_ BitVec 64) BitStream!8428) Unit!15478)

(assert (=> d!73937 (= lt!345355 (choose!9 thiss!1204 (buf!5204 (_2!9923 lt!344183)) lt!344196 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))))))

(assert (=> d!73937 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5204 (_2!9923 lt!344183)) lt!344196) lt!345355)))

(declare-fun bs!18037 () Bool)

(assert (= bs!18037 d!73937))

(assert (=> bs!18037 m!335469))

(declare-fun m!336269 () Bool)

(assert (=> bs!18037 m!336269))

(assert (=> b!217383 d!73937))

(declare-fun d!73939 () Bool)

(assert (=> d!73939 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!217383 d!73939))

(declare-fun d!73941 () Bool)

(declare-fun lt!345356 () tuple2!18560)

(assert (=> d!73941 (= lt!345356 (readBit!0 lt!344190))))

(assert (=> d!73941 (= (readBitPure!0 lt!344190) (tuple2!18533 (_2!9938 lt!345356) (_1!9938 lt!345356)))))

(declare-fun bs!18038 () Bool)

(assert (= bs!18038 d!73941))

(declare-fun m!336271 () Bool)

(assert (=> bs!18038 m!336271))

(assert (=> b!217383 d!73941))

(declare-fun d!73943 () Bool)

(assert (=> d!73943 (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344184)))

(declare-fun lt!345357 () Unit!15478)

(assert (=> d!73943 (= lt!345357 (choose!9 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344183)) lt!344184 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 (_2!9923 lt!344203)) (currentBit!9792 (_2!9923 lt!344203)))))))

(assert (=> d!73943 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9923 lt!344203) (buf!5204 (_2!9923 lt!344183)) lt!344184) lt!345357)))

(declare-fun bs!18039 () Bool)

(assert (= bs!18039 d!73943))

(assert (=> bs!18039 m!335471))

(declare-fun m!336273 () Bool)

(assert (=> bs!18039 m!336273))

(assert (=> b!217383 d!73943))

(declare-fun d!73945 () Bool)

(declare-fun lt!345358 () tuple2!18560)

(assert (=> d!73945 (= lt!345358 (readBit!0 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))))))

(assert (=> d!73945 (= (readBitPure!0 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204))) (tuple2!18533 (_2!9938 lt!345358) (_1!9938 lt!345358)))))

(declare-fun bs!18040 () Bool)

(assert (= bs!18040 d!73945))

(declare-fun m!336275 () Bool)

(assert (=> bs!18040 m!336275))

(assert (=> b!217383 d!73945))

(declare-fun d!73947 () Bool)

(assert (=> d!73947 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203))) lt!344184) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 (_2!9923 lt!344203))) ((_ sign_extend 32) (currentBit!9792 (_2!9923 lt!344203)))) lt!344184))))

(declare-fun bs!18041 () Bool)

(assert (= bs!18041 d!73947))

(declare-fun m!336277 () Bool)

(assert (=> bs!18041 m!336277))

(assert (=> b!217383 d!73947))

(declare-fun d!73949 () Bool)

(declare-fun e!148092 () Bool)

(assert (=> d!73949 e!148092))

(declare-fun res!183352 () Bool)

(assert (=> d!73949 (=> (not res!183352) (not e!148092))))

(declare-fun lt!345360 () (_ BitVec 64))

(declare-fun lt!345363 () (_ BitVec 64))

(declare-fun lt!345361 () (_ BitVec 64))

(assert (=> d!73949 (= res!183352 (= lt!345361 (bvsub lt!345360 lt!345363)))))

(assert (=> d!73949 (or (= (bvand lt!345360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345360 lt!345363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73949 (= lt!345363 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344197)))) ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344197))) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344197)))))))

(declare-fun lt!345364 () (_ BitVec 64))

(declare-fun lt!345359 () (_ BitVec 64))

(assert (=> d!73949 (= lt!345360 (bvmul lt!345364 lt!345359))))

(assert (=> d!73949 (or (= lt!345364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345359 (bvsdiv (bvmul lt!345364 lt!345359) lt!345364)))))

(assert (=> d!73949 (= lt!345359 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73949 (= lt!345364 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344197)))))))

(assert (=> d!73949 (= lt!345361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344197)))))))

(assert (=> d!73949 (invariant!0 (currentBit!9792 (_1!9924 lt!344197)) (currentByte!9797 (_1!9924 lt!344197)) (size!4660 (buf!5204 (_1!9924 lt!344197))))))

(assert (=> d!73949 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344197))) (currentByte!9797 (_1!9924 lt!344197)) (currentBit!9792 (_1!9924 lt!344197))) lt!345361)))

(declare-fun b!217886 () Bool)

(declare-fun res!183351 () Bool)

(assert (=> b!217886 (=> (not res!183351) (not e!148092))))

(assert (=> b!217886 (= res!183351 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345361))))

(declare-fun b!217887 () Bool)

(declare-fun lt!345362 () (_ BitVec 64))

(assert (=> b!217887 (= e!148092 (bvsle lt!345361 (bvmul lt!345362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217887 (or (= lt!345362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345362)))))

(assert (=> b!217887 (= lt!345362 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344197)))))))

(assert (= (and d!73949 res!183352) b!217886))

(assert (= (and b!217886 res!183351) b!217887))

(declare-fun m!336279 () Bool)

(assert (=> d!73949 m!336279))

(declare-fun m!336281 () Bool)

(assert (=> d!73949 m!336281))

(assert (=> b!217383 d!73949))

(declare-fun d!73951 () Bool)

(declare-fun lt!345365 () tuple2!18562)

(assert (=> d!73951 (= lt!345365 (readNBitsLSBFirstsLoop!0 (_1!9925 lt!344199) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198))))

(assert (=> d!73951 (= (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344199) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344198) (tuple2!18537 (_2!9939 lt!345365) (_1!9939 lt!345365)))))

(declare-fun bs!18042 () Bool)

(assert (= bs!18042 d!73951))

(declare-fun m!336283 () Bool)

(assert (=> bs!18042 m!336283))

(assert (=> b!217383 d!73951))

(declare-fun d!73953 () Bool)

(assert (=> d!73953 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204)) lt!344196) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_2!9923 lt!344183)))) ((_ sign_extend 32) (currentByte!9797 thiss!1204)) ((_ sign_extend 32) (currentBit!9792 thiss!1204))) lt!344196))))

(declare-fun bs!18043 () Bool)

(assert (= bs!18043 d!73953))

(declare-fun m!336285 () Bool)

(assert (=> bs!18043 m!336285))

(assert (=> b!217383 d!73953))

(declare-fun d!73955 () Bool)

(declare-fun lt!345366 () tuple2!18560)

(assert (=> d!73955 (= lt!345366 (readBit!0 (_1!9925 lt!344185)))))

(assert (=> d!73955 (= (readBitPure!0 (_1!9925 lt!344185)) (tuple2!18533 (_2!9938 lt!345366) (_1!9938 lt!345366)))))

(declare-fun bs!18044 () Bool)

(assert (= bs!18044 d!73955))

(declare-fun m!336287 () Bool)

(assert (=> bs!18044 m!336287))

(assert (=> b!217383 d!73955))

(declare-fun d!73957 () Bool)

(assert (=> d!73957 (= (invariant!0 (currentBit!9792 thiss!1204) (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344203)))) (and (bvsge (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9792 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9797 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344203)))) (and (= (currentBit!9792 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9797 thiss!1204) (size!4660 (buf!5204 (_2!9923 lt!344203))))))))))

(assert (=> b!217383 d!73957))

(declare-fun d!73959 () Bool)

(declare-fun lt!345367 () tuple2!18562)

(assert (=> d!73959 (= lt!345367 (readNBitsLSBFirstsLoop!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202))))

(assert (=> d!73959 (= (readNBitsLSBFirstsLoopPure!0 (_1!9925 lt!344185) nBits!348 i!590 lt!344202) (tuple2!18537 (_2!9939 lt!345367) (_1!9939 lt!345367)))))

(declare-fun bs!18045 () Bool)

(assert (= bs!18045 d!73959))

(declare-fun m!336289 () Bool)

(assert (=> bs!18045 m!336289))

(assert (=> b!217383 d!73959))

(declare-fun lt!345369 () (_ BitVec 64))

(declare-fun lt!345386 () (_ BitVec 64))

(declare-fun b!217888 () Bool)

(declare-fun e!148093 () Bool)

(declare-fun lt!345384 () tuple2!18534)

(assert (=> b!217888 (= e!148093 (= (_1!9925 lt!345384) (withMovedBitIndex!0 (_2!9925 lt!345384) (bvsub lt!345369 lt!345386))))))

(assert (=> b!217888 (or (= (bvand lt!345369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345369 lt!345386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217888 (= lt!345386 (bitIndex!0 (size!4660 (buf!5204 (_2!9923 lt!344183))) (currentByte!9797 (_2!9923 lt!344183)) (currentBit!9792 (_2!9923 lt!344183))))))

(assert (=> b!217888 (= lt!345369 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(declare-fun b!217889 () Bool)

(declare-fun res!183354 () Bool)

(assert (=> b!217889 (=> (not res!183354) (not e!148093))))

(assert (=> b!217889 (= res!183354 (isPrefixOf!0 (_2!9925 lt!345384) (_2!9923 lt!344183)))))

(declare-fun b!217890 () Bool)

(declare-fun e!148094 () Unit!15478)

(declare-fun lt!345382 () Unit!15478)

(assert (=> b!217890 (= e!148094 lt!345382)))

(declare-fun lt!345370 () (_ BitVec 64))

(assert (=> b!217890 (= lt!345370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!345371 () (_ BitVec 64))

(assert (=> b!217890 (= lt!345371 (bitIndex!0 (size!4660 (buf!5204 thiss!1204)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(assert (=> b!217890 (= lt!345382 (arrayBitRangesEqSymmetric!0 (buf!5204 thiss!1204) (buf!5204 (_2!9923 lt!344183)) lt!345370 lt!345371))))

(assert (=> b!217890 (arrayBitRangesEq!0 (buf!5204 (_2!9923 lt!344183)) (buf!5204 thiss!1204) lt!345370 lt!345371)))

(declare-fun d!73961 () Bool)

(assert (=> d!73961 e!148093))

(declare-fun res!183353 () Bool)

(assert (=> d!73961 (=> (not res!183353) (not e!148093))))

(assert (=> d!73961 (= res!183353 (isPrefixOf!0 (_1!9925 lt!345384) (_2!9925 lt!345384)))))

(declare-fun lt!345377 () BitStream!8428)

(assert (=> d!73961 (= lt!345384 (tuple2!18535 lt!345377 (_2!9923 lt!344183)))))

(declare-fun lt!345368 () Unit!15478)

(declare-fun lt!345383 () Unit!15478)

(assert (=> d!73961 (= lt!345368 lt!345383)))

(assert (=> d!73961 (isPrefixOf!0 lt!345377 (_2!9923 lt!344183))))

(assert (=> d!73961 (= lt!345383 (lemmaIsPrefixTransitive!0 lt!345377 (_2!9923 lt!344183) (_2!9923 lt!344183)))))

(declare-fun lt!345385 () Unit!15478)

(declare-fun lt!345379 () Unit!15478)

(assert (=> d!73961 (= lt!345385 lt!345379)))

(assert (=> d!73961 (isPrefixOf!0 lt!345377 (_2!9923 lt!344183))))

(assert (=> d!73961 (= lt!345379 (lemmaIsPrefixTransitive!0 lt!345377 thiss!1204 (_2!9923 lt!344183)))))

(declare-fun lt!345373 () Unit!15478)

(assert (=> d!73961 (= lt!345373 e!148094)))

(declare-fun c!10654 () Bool)

(assert (=> d!73961 (= c!10654 (not (= (size!4660 (buf!5204 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!345380 () Unit!15478)

(declare-fun lt!345378 () Unit!15478)

(assert (=> d!73961 (= lt!345380 lt!345378)))

(assert (=> d!73961 (isPrefixOf!0 (_2!9923 lt!344183) (_2!9923 lt!344183))))

(assert (=> d!73961 (= lt!345378 (lemmaIsPrefixRefl!0 (_2!9923 lt!344183)))))

(declare-fun lt!345376 () Unit!15478)

(declare-fun lt!345372 () Unit!15478)

(assert (=> d!73961 (= lt!345376 lt!345372)))

(assert (=> d!73961 (= lt!345372 (lemmaIsPrefixRefl!0 (_2!9923 lt!344183)))))

(declare-fun lt!345387 () Unit!15478)

(declare-fun lt!345381 () Unit!15478)

(assert (=> d!73961 (= lt!345387 lt!345381)))

(assert (=> d!73961 (isPrefixOf!0 lt!345377 lt!345377)))

(assert (=> d!73961 (= lt!345381 (lemmaIsPrefixRefl!0 lt!345377))))

(declare-fun lt!345375 () Unit!15478)

(declare-fun lt!345374 () Unit!15478)

(assert (=> d!73961 (= lt!345375 lt!345374)))

(assert (=> d!73961 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73961 (= lt!345374 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73961 (= lt!345377 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 thiss!1204) (currentBit!9792 thiss!1204)))))

(assert (=> d!73961 (isPrefixOf!0 thiss!1204 (_2!9923 lt!344183))))

(assert (=> d!73961 (= (reader!0 thiss!1204 (_2!9923 lt!344183)) lt!345384)))

(declare-fun b!217891 () Bool)

(declare-fun res!183355 () Bool)

(assert (=> b!217891 (=> (not res!183355) (not e!148093))))

(assert (=> b!217891 (= res!183355 (isPrefixOf!0 (_1!9925 lt!345384) thiss!1204))))

(declare-fun b!217892 () Bool)

(declare-fun Unit!15520 () Unit!15478)

(assert (=> b!217892 (= e!148094 Unit!15520)))

(assert (= (and d!73961 c!10654) b!217890))

(assert (= (and d!73961 (not c!10654)) b!217892))

(assert (= (and d!73961 res!183353) b!217891))

(assert (= (and b!217891 res!183355) b!217889))

(assert (= (and b!217889 res!183354) b!217888))

(declare-fun m!336291 () Bool)

(assert (=> d!73961 m!336291))

(declare-fun m!336293 () Bool)

(assert (=> d!73961 m!336293))

(declare-fun m!336295 () Bool)

(assert (=> d!73961 m!336295))

(declare-fun m!336297 () Bool)

(assert (=> d!73961 m!336297))

(assert (=> d!73961 m!335457))

(declare-fun m!336299 () Bool)

(assert (=> d!73961 m!336299))

(declare-fun m!336301 () Bool)

(assert (=> d!73961 m!336301))

(assert (=> d!73961 m!336251))

(assert (=> d!73961 m!336253))

(declare-fun m!336303 () Bool)

(assert (=> d!73961 m!336303))

(declare-fun m!336305 () Bool)

(assert (=> d!73961 m!336305))

(declare-fun m!336307 () Bool)

(assert (=> b!217888 m!336307))

(assert (=> b!217888 m!335455))

(assert (=> b!217888 m!335449))

(declare-fun m!336309 () Bool)

(assert (=> b!217891 m!336309))

(declare-fun m!336311 () Bool)

(assert (=> b!217889 m!336311))

(assert (=> b!217890 m!335449))

(declare-fun m!336313 () Bool)

(assert (=> b!217890 m!336313))

(declare-fun m!336315 () Bool)

(assert (=> b!217890 m!336315))

(assert (=> b!217383 d!73961))

(declare-fun d!73963 () Bool)

(declare-fun e!148097 () Bool)

(assert (=> d!73963 e!148097))

(declare-fun res!183357 () Bool)

(assert (=> d!73963 (=> (not res!183357) (not e!148097))))

(declare-fun lt!345420 () (_ BitVec 64))

(declare-fun lt!345418 () (_ BitVec 64))

(declare-fun lt!345417 () (_ BitVec 64))

(assert (=> d!73963 (= res!183357 (= lt!345418 (bvsub lt!345417 lt!345420)))))

(assert (=> d!73963 (or (= (bvand lt!345417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345417 lt!345420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73963 (= lt!345420 (remainingBits!0 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344182)))) ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344182))) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344182)))))))

(declare-fun lt!345421 () (_ BitVec 64))

(declare-fun lt!345416 () (_ BitVec 64))

(assert (=> d!73963 (= lt!345417 (bvmul lt!345421 lt!345416))))

(assert (=> d!73963 (or (= lt!345421 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345416 (bvsdiv (bvmul lt!345421 lt!345416) lt!345421)))))

(assert (=> d!73963 (= lt!345416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73963 (= lt!345421 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344182)))))))

(assert (=> d!73963 (= lt!345418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9797 (_1!9924 lt!344182))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9792 (_1!9924 lt!344182)))))))

(assert (=> d!73963 (invariant!0 (currentBit!9792 (_1!9924 lt!344182)) (currentByte!9797 (_1!9924 lt!344182)) (size!4660 (buf!5204 (_1!9924 lt!344182))))))

(assert (=> d!73963 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!344182))) (currentByte!9797 (_1!9924 lt!344182)) (currentBit!9792 (_1!9924 lt!344182))) lt!345418)))

(declare-fun b!217897 () Bool)

(declare-fun res!183356 () Bool)

(assert (=> b!217897 (=> (not res!183356) (not e!148097))))

(assert (=> b!217897 (= res!183356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345418))))

(declare-fun b!217898 () Bool)

(declare-fun lt!345419 () (_ BitVec 64))

(assert (=> b!217898 (= e!148097 (bvsle lt!345418 (bvmul lt!345419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217898 (or (= lt!345419 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345419 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345419)))))

(assert (=> b!217898 (= lt!345419 ((_ sign_extend 32) (size!4660 (buf!5204 (_1!9924 lt!344182)))))))

(assert (= (and d!73963 res!183357) b!217897))

(assert (= (and b!217897 res!183356) b!217898))

(declare-fun m!336317 () Bool)

(assert (=> d!73963 m!336317))

(declare-fun m!336319 () Bool)

(assert (=> d!73963 m!336319))

(assert (=> b!217383 d!73963))

(declare-fun d!73965 () Bool)

(declare-fun e!148104 () Bool)

(assert (=> d!73965 e!148104))

(declare-fun res!183369 () Bool)

(assert (=> d!73965 (=> (not res!183369) (not e!148104))))

(declare-fun lt!345465 () tuple2!18532)

(declare-fun lt!345466 () tuple2!18532)

(assert (=> d!73965 (= res!183369 (= (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!345465))) (currentByte!9797 (_1!9924 lt!345465)) (currentBit!9792 (_1!9924 lt!345465))) (bitIndex!0 (size!4660 (buf!5204 (_1!9924 lt!345466))) (currentByte!9797 (_1!9924 lt!345466)) (currentBit!9792 (_1!9924 lt!345466)))))))

(declare-fun lt!345467 () BitStream!8428)

(declare-fun lt!345464 () Unit!15478)

(declare-fun choose!50 (BitStream!8428 BitStream!8428 BitStream!8428 tuple2!18532 tuple2!18532 BitStream!8428 Bool tuple2!18532 tuple2!18532 BitStream!8428 Bool) Unit!15478)

(assert (=> d!73965 (= lt!345464 (choose!50 lt!344190 (_2!9923 lt!344183) lt!345467 lt!345465 (tuple2!18533 (_1!9924 lt!345465) (_2!9924 lt!345465)) (_1!9924 lt!345465) (_2!9924 lt!345465) lt!345466 (tuple2!18533 (_1!9924 lt!345466) (_2!9924 lt!345466)) (_1!9924 lt!345466) (_2!9924 lt!345466)))))

(assert (=> d!73965 (= lt!345466 (readBitPure!0 lt!345467))))

(assert (=> d!73965 (= lt!345465 (readBitPure!0 lt!344190))))

(assert (=> d!73965 (= lt!345467 (BitStream!8429 (buf!5204 (_2!9923 lt!344183)) (currentByte!9797 lt!344190) (currentBit!9792 lt!344190)))))

(assert (=> d!73965 (invariant!0 (currentBit!9792 lt!344190) (currentByte!9797 lt!344190) (size!4660 (buf!5204 (_2!9923 lt!344183))))))

(assert (=> d!73965 (= (readBitPrefixLemma!0 lt!344190 (_2!9923 lt!344183)) lt!345464)))

(declare-fun b!217912 () Bool)

(assert (=> b!217912 (= e!148104 (= (_2!9924 lt!345465) (_2!9924 lt!345466)))))

(assert (= (and d!73965 res!183369) b!217912))

(assert (=> d!73965 m!335479))

(declare-fun m!336355 () Bool)

(assert (=> d!73965 m!336355))

(declare-fun m!336357 () Bool)

(assert (=> d!73965 m!336357))

(declare-fun m!336359 () Bool)

(assert (=> d!73965 m!336359))

(declare-fun m!336361 () Bool)

(assert (=> d!73965 m!336361))

(declare-fun m!336363 () Bool)

(assert (=> d!73965 m!336363))

(assert (=> b!217383 d!73965))

(push 1)

(assert (not b!217846))

(assert (not d!73893))

(assert (not d!73953))

(assert (not d!73955))

(assert (not b!217883))

(assert (not d!73903))

(assert (not d!73943))

(assert (not b!217796))

(assert (not b!217786))

(assert (not b!217779))

(assert (not d!73907))

(assert (not b!217603))

(assert (not d!73889))

(assert (not d!73815))

(assert (not b!217775))

(assert (not b!217627))

(assert (not b!217776))

(assert (not bm!3405))

(assert (not b!217891))

(assert (not d!73927))

(assert (not d!73949))

(assert (not b!217845))

(assert (not b!217785))

(assert (not d!73897))

(assert (not d!73959))

(assert (not d!73909))

(assert (not b!217888))

(assert (not b!217601))

(assert (not b!217889))

(assert (not d!73795))

(assert (not d!73905))

(assert (not d!73915))

(assert (not b!217625))

(assert (not d!73945))

(assert (not b!217783))

(assert (not b!217884))

(assert (not b!217847))

(assert (not b!217882))

(assert (not d!73963))

(assert (not d!73911))

(assert (not d!73923))

(assert (not d!73913))

(assert (not b!217774))

(assert (not b!217798))

(assert (not b!217784))

(assert (not b!217881))

(assert (not b!217844))

(assert (not b!217890))

(assert (not d!73921))

(assert (not d!73797))

(assert (not b!217781))

(assert (not d!73937))

(assert (not b!217772))

(assert (not b!217850))

(assert (not d!73891))

(assert (not d!73961))

(assert (not d!73793))

(assert (not d!73817))

(assert (not d!73941))

(assert (not d!73951))

(assert (not d!73947))

(assert (not d!73965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

