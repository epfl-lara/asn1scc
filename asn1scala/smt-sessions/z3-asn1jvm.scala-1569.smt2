; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44546 () Bool)

(assert start!44546)

(declare-fun b!212234 () Bool)

(declare-fun e!144653 () Bool)

(declare-fun e!144649 () Bool)

(assert (=> b!212234 (= e!144653 e!144649)))

(declare-fun res!178265 () Bool)

(assert (=> b!212234 (=> res!178265 e!144649)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!10519 0))(
  ( (array!10520 (arr!5549 (Array (_ BitVec 32) (_ BitVec 8))) (size!4619 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8346 0))(
  ( (BitStream!8347 (buf!5148 array!10519) (currentByte!9714 (_ BitVec 32)) (currentBit!9709 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18154 0))(
  ( (tuple2!18155 (_1!9732 BitStream!8346) (_2!9732 BitStream!8346)) )
))
(declare-fun lt!334758 () tuple2!18154)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!334759 () (_ BitVec 64))

(declare-datatypes ((tuple2!18156 0))(
  ( (tuple2!18157 (_1!9733 BitStream!8346) (_2!9733 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18156)

(assert (=> b!212234 (= res!178265 (not (= (_1!9733 (readNBitsLSBFirstsLoopPure!0 (_1!9732 lt!334758) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334759)) (_2!9732 lt!334758))))))

(declare-datatypes ((Unit!15144 0))(
  ( (Unit!15145) )
))
(declare-datatypes ((tuple2!18158 0))(
  ( (tuple2!18159 (_1!9734 Unit!15144) (_2!9734 BitStream!8346)) )
))
(declare-fun lt!334780 () tuple2!18158)

(declare-fun lt!334764 () tuple2!18158)

(declare-fun lt!334778 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212234 (validate_offset_bits!1 ((_ sign_extend 32) (size!4619 (buf!5148 (_2!9734 lt!334780)))) ((_ sign_extend 32) (currentByte!9714 (_2!9734 lt!334764))) ((_ sign_extend 32) (currentBit!9709 (_2!9734 lt!334764))) lt!334778)))

(declare-fun lt!334781 () Unit!15144)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8346 array!10519 (_ BitVec 64)) Unit!15144)

(assert (=> b!212234 (= lt!334781 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9734 lt!334764) (buf!5148 (_2!9734 lt!334780)) lt!334778))))

(assert (=> b!212234 (= lt!334778 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!334783 () (_ BitVec 64))

(declare-fun lt!334775 () (_ BitVec 64))

(declare-datatypes ((tuple2!18160 0))(
  ( (tuple2!18161 (_1!9735 BitStream!8346) (_2!9735 Bool)) )
))
(declare-fun lt!334761 () tuple2!18160)

(assert (=> b!212234 (= lt!334759 (bvor lt!334775 (ite (_2!9735 lt!334761) lt!334783 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!334765 () tuple2!18154)

(declare-fun lt!334763 () tuple2!18156)

(assert (=> b!212234 (= lt!334763 (readNBitsLSBFirstsLoopPure!0 (_1!9732 lt!334765) nBits!348 i!590 lt!334775))))

(declare-fun thiss!1204 () BitStream!8346)

(declare-fun lt!334772 () (_ BitVec 64))

(assert (=> b!212234 (validate_offset_bits!1 ((_ sign_extend 32) (size!4619 (buf!5148 (_2!9734 lt!334780)))) ((_ sign_extend 32) (currentByte!9714 thiss!1204)) ((_ sign_extend 32) (currentBit!9709 thiss!1204)) lt!334772)))

(declare-fun lt!334777 () Unit!15144)

(assert (=> b!212234 (= lt!334777 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5148 (_2!9734 lt!334780)) lt!334772))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212234 (= lt!334775 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!334762 () Bool)

(assert (=> b!212234 (= (_2!9735 lt!334761) lt!334762)))

(declare-fun readBitPure!0 (BitStream!8346) tuple2!18160)

(assert (=> b!212234 (= lt!334761 (readBitPure!0 (_1!9732 lt!334765)))))

(declare-fun reader!0 (BitStream!8346 BitStream!8346) tuple2!18154)

(assert (=> b!212234 (= lt!334758 (reader!0 (_2!9734 lt!334764) (_2!9734 lt!334780)))))

(assert (=> b!212234 (= lt!334765 (reader!0 thiss!1204 (_2!9734 lt!334780)))))

(declare-fun e!144652 () Bool)

(assert (=> b!212234 e!144652))

(declare-fun res!178253 () Bool)

(assert (=> b!212234 (=> (not res!178253) (not e!144652))))

(declare-fun lt!334771 () tuple2!18160)

(declare-fun lt!334768 () tuple2!18160)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212234 (= res!178253 (= (bitIndex!0 (size!4619 (buf!5148 (_1!9735 lt!334771))) (currentByte!9714 (_1!9735 lt!334771)) (currentBit!9709 (_1!9735 lt!334771))) (bitIndex!0 (size!4619 (buf!5148 (_1!9735 lt!334768))) (currentByte!9714 (_1!9735 lt!334768)) (currentBit!9709 (_1!9735 lt!334768)))))))

(declare-fun lt!334784 () Unit!15144)

(declare-fun lt!334782 () BitStream!8346)

(declare-fun readBitPrefixLemma!0 (BitStream!8346 BitStream!8346) Unit!15144)

(assert (=> b!212234 (= lt!334784 (readBitPrefixLemma!0 lt!334782 (_2!9734 lt!334780)))))

(assert (=> b!212234 (= lt!334768 (readBitPure!0 (BitStream!8347 (buf!5148 (_2!9734 lt!334780)) (currentByte!9714 thiss!1204) (currentBit!9709 thiss!1204))))))

(assert (=> b!212234 (= lt!334771 (readBitPure!0 lt!334782))))

(declare-fun e!144650 () Bool)

(assert (=> b!212234 e!144650))

(declare-fun res!178271 () Bool)

(assert (=> b!212234 (=> (not res!178271) (not e!144650))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212234 (= res!178271 (invariant!0 (currentBit!9709 thiss!1204) (currentByte!9714 thiss!1204) (size!4619 (buf!5148 (_2!9734 lt!334764)))))))

(assert (=> b!212234 (= lt!334782 (BitStream!8347 (buf!5148 (_2!9734 lt!334764)) (currentByte!9714 thiss!1204) (currentBit!9709 thiss!1204)))))

(declare-fun b!212235 () Bool)

(declare-fun res!178266 () Bool)

(assert (=> b!212235 (=> res!178266 e!144653)))

(declare-fun isPrefixOf!0 (BitStream!8346 BitStream!8346) Bool)

(assert (=> b!212235 (= res!178266 (not (isPrefixOf!0 (_2!9734 lt!334764) (_2!9734 lt!334780))))))

(declare-fun b!212236 () Bool)

(declare-fun e!144656 () Bool)

(assert (=> b!212236 (= e!144656 e!144653)))

(declare-fun res!178269 () Bool)

(assert (=> b!212236 (=> res!178269 e!144653)))

(declare-fun lt!334779 () (_ BitVec 64))

(declare-fun lt!334773 () (_ BitVec 64))

(assert (=> b!212236 (= res!178269 (not (= lt!334779 (bvsub (bvsub (bvadd lt!334773 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212236 (= lt!334779 (bitIndex!0 (size!4619 (buf!5148 (_2!9734 lt!334780))) (currentByte!9714 (_2!9734 lt!334780)) (currentBit!9709 (_2!9734 lt!334780))))))

(assert (=> b!212236 (isPrefixOf!0 thiss!1204 (_2!9734 lt!334780))))

(declare-fun lt!334770 () Unit!15144)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8346 BitStream!8346 BitStream!8346) Unit!15144)

(assert (=> b!212236 (= lt!334770 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9734 lt!334764) (_2!9734 lt!334780)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18158)

(assert (=> b!212236 (= lt!334780 (appendBitsLSBFirstLoopTR!0 (_2!9734 lt!334764) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212237 () Bool)

(declare-fun res!178254 () Bool)

(declare-fun e!144648 () Bool)

(assert (=> b!212237 (=> (not res!178254) (not e!144648))))

(assert (=> b!212237 (= res!178254 (isPrefixOf!0 thiss!1204 (_2!9734 lt!334764)))))

(declare-fun b!212238 () Bool)

(declare-fun e!144647 () Bool)

(assert (=> b!212238 (= e!144647 (not e!144656))))

(declare-fun res!178262 () Bool)

(assert (=> b!212238 (=> res!178262 e!144656)))

(declare-fun lt!334760 () (_ BitVec 64))

(assert (=> b!212238 (= res!178262 (not (= lt!334773 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334760))))))

(assert (=> b!212238 (= lt!334773 (bitIndex!0 (size!4619 (buf!5148 (_2!9734 lt!334764))) (currentByte!9714 (_2!9734 lt!334764)) (currentBit!9709 (_2!9734 lt!334764))))))

(assert (=> b!212238 (= lt!334760 (bitIndex!0 (size!4619 (buf!5148 thiss!1204)) (currentByte!9714 thiss!1204) (currentBit!9709 thiss!1204)))))

(declare-fun e!144646 () Bool)

(assert (=> b!212238 e!144646))

(declare-fun res!178268 () Bool)

(assert (=> b!212238 (=> (not res!178268) (not e!144646))))

(assert (=> b!212238 (= res!178268 (= (size!4619 (buf!5148 thiss!1204)) (size!4619 (buf!5148 (_2!9734 lt!334764)))))))

(declare-fun appendBit!0 (BitStream!8346 Bool) tuple2!18158)

(assert (=> b!212238 (= lt!334764 (appendBit!0 thiss!1204 lt!334762))))

(assert (=> b!212238 (= lt!334762 (not (= (bvand v!189 lt!334783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212238 (= lt!334783 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212239 () Bool)

(declare-fun res!178260 () Bool)

(assert (=> b!212239 (=> res!178260 e!144653)))

(assert (=> b!212239 (= res!178260 (not (isPrefixOf!0 thiss!1204 (_2!9734 lt!334764))))))

(declare-fun b!212240 () Bool)

(declare-fun res!178263 () Bool)

(assert (=> b!212240 (=> res!178263 e!144653)))

(assert (=> b!212240 (= res!178263 (or (not (= (size!4619 (buf!5148 (_2!9734 lt!334780))) (size!4619 (buf!5148 thiss!1204)))) (not (= lt!334779 (bvsub (bvadd lt!334760 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212241 () Bool)

(declare-fun e!144655 () Bool)

(declare-fun lt!334776 () tuple2!18160)

(declare-fun lt!334767 () (_ BitVec 64))

(assert (=> b!212241 (= e!144655 (= (bitIndex!0 (size!4619 (buf!5148 (_1!9735 lt!334776))) (currentByte!9714 (_1!9735 lt!334776)) (currentBit!9709 (_1!9735 lt!334776))) lt!334767))))

(declare-fun b!212242 () Bool)

(declare-fun res!178261 () Bool)

(assert (=> b!212242 (=> (not res!178261) (not e!144647))))

(assert (=> b!212242 (= res!178261 (invariant!0 (currentBit!9709 thiss!1204) (currentByte!9714 thiss!1204) (size!4619 (buf!5148 thiss!1204))))))

(declare-fun b!212243 () Bool)

(declare-fun e!144657 () Bool)

(assert (=> b!212243 (= e!144657 e!144647)))

(declare-fun res!178256 () Bool)

(assert (=> b!212243 (=> (not res!178256) (not e!144647))))

(assert (=> b!212243 (= res!178256 (validate_offset_bits!1 ((_ sign_extend 32) (size!4619 (buf!5148 thiss!1204))) ((_ sign_extend 32) (currentByte!9714 thiss!1204)) ((_ sign_extend 32) (currentBit!9709 thiss!1204)) lt!334772))))

(assert (=> b!212243 (= lt!334772 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212244 () Bool)

(assert (=> b!212244 (= e!144650 (invariant!0 (currentBit!9709 thiss!1204) (currentByte!9714 thiss!1204) (size!4619 (buf!5148 (_2!9734 lt!334780)))))))

(declare-fun b!212245 () Bool)

(declare-fun res!178264 () Bool)

(assert (=> b!212245 (=> (not res!178264) (not e!144647))))

(assert (=> b!212245 (= res!178264 (not (= i!590 nBits!348)))))

(declare-fun res!178255 () Bool)

(assert (=> start!44546 (=> (not res!178255) (not e!144657))))

(assert (=> start!44546 (= res!178255 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44546 e!144657))

(assert (=> start!44546 true))

(declare-fun e!144654 () Bool)

(declare-fun inv!12 (BitStream!8346) Bool)

(assert (=> start!44546 (and (inv!12 thiss!1204) e!144654)))

(declare-fun b!212246 () Bool)

(assert (=> b!212246 (= e!144652 (= (_2!9735 lt!334771) (_2!9735 lt!334768)))))

(declare-fun e!144645 () Bool)

(declare-fun b!212247 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8346 (_ BitVec 64)) BitStream!8346)

(assert (=> b!212247 (= e!144645 (= (_1!9732 lt!334758) (withMovedBitIndex!0 (_2!9732 lt!334758) (bvsub lt!334773 lt!334779))))))

(declare-fun b!212248 () Bool)

(assert (=> b!212248 (= e!144646 e!144648)))

(declare-fun res!178258 () Bool)

(assert (=> b!212248 (=> (not res!178258) (not e!144648))))

(declare-fun lt!334774 () (_ BitVec 64))

(assert (=> b!212248 (= res!178258 (= lt!334767 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334774)))))

(assert (=> b!212248 (= lt!334767 (bitIndex!0 (size!4619 (buf!5148 (_2!9734 lt!334764))) (currentByte!9714 (_2!9734 lt!334764)) (currentBit!9709 (_2!9734 lt!334764))))))

(assert (=> b!212248 (= lt!334774 (bitIndex!0 (size!4619 (buf!5148 thiss!1204)) (currentByte!9714 thiss!1204) (currentBit!9709 thiss!1204)))))

(declare-fun b!212249 () Bool)

(assert (=> b!212249 (= e!144649 (= lt!334760 (bvsub lt!334773 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!212249 e!144645))

(declare-fun res!178257 () Bool)

(assert (=> b!212249 (=> (not res!178257) (not e!144645))))

(declare-fun lt!334766 () tuple2!18156)

(assert (=> b!212249 (= res!178257 (and (= (_2!9733 lt!334763) (_2!9733 lt!334766)) (= (_1!9733 lt!334763) (_1!9733 lt!334766))))))

(declare-fun lt!334769 () Unit!15144)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15144)

(assert (=> b!212249 (= lt!334769 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9732 lt!334765) nBits!348 i!590 lt!334775))))

(assert (=> b!212249 (= lt!334766 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9732 lt!334765) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334759))))

(declare-fun b!212250 () Bool)

(declare-fun res!178270 () Bool)

(assert (=> b!212250 (=> (not res!178270) (not e!144645))))

(assert (=> b!212250 (= res!178270 (= (_1!9732 lt!334765) (withMovedBitIndex!0 (_2!9732 lt!334765) (bvsub lt!334760 lt!334779))))))

(declare-fun b!212251 () Bool)

(assert (=> b!212251 (= e!144648 e!144655)))

(declare-fun res!178259 () Bool)

(assert (=> b!212251 (=> (not res!178259) (not e!144655))))

(assert (=> b!212251 (= res!178259 (and (= (_2!9735 lt!334776) lt!334762) (= (_1!9735 lt!334776) (_2!9734 lt!334764))))))

(declare-fun readerFrom!0 (BitStream!8346 (_ BitVec 32) (_ BitVec 32)) BitStream!8346)

(assert (=> b!212251 (= lt!334776 (readBitPure!0 (readerFrom!0 (_2!9734 lt!334764) (currentBit!9709 thiss!1204) (currentByte!9714 thiss!1204))))))

(declare-fun b!212252 () Bool)

(declare-fun array_inv!4360 (array!10519) Bool)

(assert (=> b!212252 (= e!144654 (array_inv!4360 (buf!5148 thiss!1204)))))

(declare-fun b!212253 () Bool)

(declare-fun res!178267 () Bool)

(assert (=> b!212253 (=> res!178267 e!144653)))

(assert (=> b!212253 (= res!178267 (not (invariant!0 (currentBit!9709 (_2!9734 lt!334780)) (currentByte!9714 (_2!9734 lt!334780)) (size!4619 (buf!5148 (_2!9734 lt!334780))))))))

(assert (= (and start!44546 res!178255) b!212243))

(assert (= (and b!212243 res!178256) b!212242))

(assert (= (and b!212242 res!178261) b!212245))

(assert (= (and b!212245 res!178264) b!212238))

(assert (= (and b!212238 res!178268) b!212248))

(assert (= (and b!212248 res!178258) b!212237))

(assert (= (and b!212237 res!178254) b!212251))

(assert (= (and b!212251 res!178259) b!212241))

(assert (= (and b!212238 (not res!178262)) b!212236))

(assert (= (and b!212236 (not res!178269)) b!212253))

(assert (= (and b!212253 (not res!178267)) b!212240))

(assert (= (and b!212240 (not res!178263)) b!212235))

(assert (= (and b!212235 (not res!178266)) b!212239))

(assert (= (and b!212239 (not res!178260)) b!212234))

(assert (= (and b!212234 res!178271) b!212244))

(assert (= (and b!212234 res!178253) b!212246))

(assert (= (and b!212234 (not res!178265)) b!212249))

(assert (= (and b!212249 res!178257) b!212250))

(assert (= (and b!212250 res!178270) b!212247))

(assert (= start!44546 b!212252))

(declare-fun m!327237 () Bool)

(assert (=> b!212248 m!327237))

(declare-fun m!327239 () Bool)

(assert (=> b!212248 m!327239))

(declare-fun m!327241 () Bool)

(assert (=> start!44546 m!327241))

(declare-fun m!327243 () Bool)

(assert (=> b!212251 m!327243))

(assert (=> b!212251 m!327243))

(declare-fun m!327245 () Bool)

(assert (=> b!212251 m!327245))

(assert (=> b!212238 m!327237))

(assert (=> b!212238 m!327239))

(declare-fun m!327247 () Bool)

(assert (=> b!212238 m!327247))

(declare-fun m!327249 () Bool)

(assert (=> b!212253 m!327249))

(declare-fun m!327251 () Bool)

(assert (=> b!212236 m!327251))

(declare-fun m!327253 () Bool)

(assert (=> b!212236 m!327253))

(declare-fun m!327255 () Bool)

(assert (=> b!212236 m!327255))

(declare-fun m!327257 () Bool)

(assert (=> b!212236 m!327257))

(declare-fun m!327259 () Bool)

(assert (=> b!212241 m!327259))

(declare-fun m!327261 () Bool)

(assert (=> b!212235 m!327261))

(declare-fun m!327263 () Bool)

(assert (=> b!212249 m!327263))

(declare-fun m!327265 () Bool)

(assert (=> b!212249 m!327265))

(assert (=> b!212249 m!327265))

(declare-fun m!327267 () Bool)

(assert (=> b!212249 m!327267))

(declare-fun m!327269 () Bool)

(assert (=> b!212244 m!327269))

(declare-fun m!327271 () Bool)

(assert (=> b!212242 m!327271))

(declare-fun m!327273 () Bool)

(assert (=> b!212234 m!327273))

(declare-fun m!327275 () Bool)

(assert (=> b!212234 m!327275))

(declare-fun m!327277 () Bool)

(assert (=> b!212234 m!327277))

(declare-fun m!327279 () Bool)

(assert (=> b!212234 m!327279))

(declare-fun m!327281 () Bool)

(assert (=> b!212234 m!327281))

(declare-fun m!327283 () Bool)

(assert (=> b!212234 m!327283))

(declare-fun m!327285 () Bool)

(assert (=> b!212234 m!327285))

(declare-fun m!327287 () Bool)

(assert (=> b!212234 m!327287))

(declare-fun m!327289 () Bool)

(assert (=> b!212234 m!327289))

(declare-fun m!327291 () Bool)

(assert (=> b!212234 m!327291))

(declare-fun m!327293 () Bool)

(assert (=> b!212234 m!327293))

(declare-fun m!327295 () Bool)

(assert (=> b!212234 m!327295))

(declare-fun m!327297 () Bool)

(assert (=> b!212234 m!327297))

(declare-fun m!327299 () Bool)

(assert (=> b!212234 m!327299))

(declare-fun m!327301 () Bool)

(assert (=> b!212234 m!327301))

(declare-fun m!327303 () Bool)

(assert (=> b!212234 m!327303))

(declare-fun m!327305 () Bool)

(assert (=> b!212247 m!327305))

(declare-fun m!327307 () Bool)

(assert (=> b!212243 m!327307))

(declare-fun m!327309 () Bool)

(assert (=> b!212239 m!327309))

(assert (=> b!212237 m!327309))

(declare-fun m!327311 () Bool)

(assert (=> b!212252 m!327311))

(declare-fun m!327313 () Bool)

(assert (=> b!212250 m!327313))

(check-sat (not b!212253) (not b!212250) (not b!212239) (not b!212252) (not b!212235) (not b!212234) (not b!212237) (not b!212243) (not b!212244) (not b!212248) (not b!212238) (not b!212241) (not start!44546) (not b!212247) (not b!212242) (not b!212251) (not b!212249) (not b!212236))
(check-sat)
