; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43510 () Bool)

(assert start!43510)

(declare-fun b!205628 () Bool)

(declare-fun e!140685 () Bool)

(declare-fun e!140684 () Bool)

(assert (=> b!205628 (= e!140685 e!140684)))

(declare-fun res!172375 () Bool)

(assert (=> b!205628 (=> (not res!172375) (not e!140684))))

(declare-fun lt!321194 () (_ BitVec 64))

(declare-fun lt!321209 () (_ BitVec 64))

(assert (=> b!205628 (= res!172375 (= lt!321194 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321209)))))

(declare-datatypes ((array!10368 0))(
  ( (array!10369 (arr!5487 (Array (_ BitVec 32) (_ BitVec 8))) (size!4557 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8222 0))(
  ( (BitStream!8223 (buf!5062 array!10368) (currentByte!9571 (_ BitVec 32)) (currentBit!9566 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14671 0))(
  ( (Unit!14672) )
))
(declare-datatypes ((tuple2!17576 0))(
  ( (tuple2!17577 (_1!9443 Unit!14671) (_2!9443 BitStream!8222)) )
))
(declare-fun lt!321195 () tuple2!17576)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205628 (= lt!321194 (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))))))

(declare-fun thiss!1204 () BitStream!8222)

(assert (=> b!205628 (= lt!321209 (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)))))

(declare-fun res!172387 () Bool)

(declare-fun e!140691 () Bool)

(assert (=> start!43510 (=> (not res!172387) (not e!140691))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43510 (= res!172387 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43510 e!140691))

(assert (=> start!43510 true))

(declare-fun e!140689 () Bool)

(declare-fun inv!12 (BitStream!8222) Bool)

(assert (=> start!43510 (and (inv!12 thiss!1204) e!140689)))

(declare-fun b!205629 () Bool)

(declare-fun res!172383 () Bool)

(declare-fun e!140682 () Bool)

(assert (=> b!205629 (=> res!172383 e!140682)))

(declare-fun lt!321197 () tuple2!17576)

(declare-fun isPrefixOf!0 (BitStream!8222 BitStream!8222) Bool)

(assert (=> b!205629 (= res!172383 (not (isPrefixOf!0 (_2!9443 lt!321195) (_2!9443 lt!321197))))))

(declare-fun b!205630 () Bool)

(declare-fun res!172380 () Bool)

(assert (=> b!205630 (=> res!172380 e!140682)))

(declare-fun lt!321196 () (_ BitVec 64))

(declare-fun lt!321199 () (_ BitVec 64))

(assert (=> b!205630 (= res!172380 (or (not (= (size!4557 (buf!5062 (_2!9443 lt!321197))) (size!4557 (buf!5062 thiss!1204)))) (not (= lt!321199 (bvsub (bvadd lt!321196 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!205631 () Bool)

(declare-fun e!140690 () Bool)

(assert (=> b!205631 (= e!140691 (not e!140690))))

(declare-fun res!172377 () Bool)

(assert (=> b!205631 (=> res!172377 e!140690)))

(declare-fun lt!321203 () (_ BitVec 64))

(assert (=> b!205631 (= res!172377 (not (= lt!321203 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321196))))))

(assert (=> b!205631 (= lt!321203 (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))))))

(assert (=> b!205631 (= lt!321196 (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)))))

(assert (=> b!205631 e!140685))

(declare-fun res!172385 () Bool)

(assert (=> b!205631 (=> (not res!172385) (not e!140685))))

(assert (=> b!205631 (= res!172385 (= (size!4557 (buf!5062 thiss!1204)) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(declare-fun lt!321207 () Bool)

(declare-fun appendBit!0 (BitStream!8222 Bool) tuple2!17576)

(assert (=> b!205631 (= lt!321195 (appendBit!0 thiss!1204 lt!321207))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!205631 (= lt!321207 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!205632 () Bool)

(declare-fun e!140688 () Bool)

(declare-datatypes ((tuple2!17578 0))(
  ( (tuple2!17579 (_1!9444 BitStream!8222) (_2!9444 Bool)) )
))
(declare-fun lt!321204 () tuple2!17578)

(assert (=> b!205632 (= e!140688 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!321204))) (currentByte!9571 (_1!9444 lt!321204)) (currentBit!9566 (_1!9444 lt!321204))) lt!321194))))

(declare-fun b!205633 () Bool)

(declare-fun res!172379 () Bool)

(assert (=> b!205633 (=> (not res!172379) (not e!140691))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205633 (= res!172379 (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204))))))

(declare-fun b!205634 () Bool)

(declare-fun res!172381 () Bool)

(assert (=> b!205634 (=> (not res!172381) (not e!140684))))

(assert (=> b!205634 (= res!172381 (isPrefixOf!0 thiss!1204 (_2!9443 lt!321195)))))

(declare-fun b!205635 () Bool)

(declare-fun e!140687 () Bool)

(declare-fun lt!321200 () tuple2!17578)

(declare-fun lt!321206 () tuple2!17578)

(assert (=> b!205635 (= e!140687 (= (_2!9444 lt!321200) (_2!9444 lt!321206)))))

(declare-fun b!205636 () Bool)

(assert (=> b!205636 (= e!140684 e!140688)))

(declare-fun res!172386 () Bool)

(assert (=> b!205636 (=> (not res!172386) (not e!140688))))

(assert (=> b!205636 (= res!172386 (and (= (_2!9444 lt!321204) lt!321207) (= (_1!9444 lt!321204) (_2!9443 lt!321195))))))

(declare-fun readBitPure!0 (BitStream!8222) tuple2!17578)

(declare-fun readerFrom!0 (BitStream!8222 (_ BitVec 32) (_ BitVec 32)) BitStream!8222)

(assert (=> b!205636 (= lt!321204 (readBitPure!0 (readerFrom!0 (_2!9443 lt!321195) (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204))))))

(declare-fun b!205637 () Bool)

(declare-fun array_inv!4298 (array!10368) Bool)

(assert (=> b!205637 (= e!140689 (array_inv!4298 (buf!5062 thiss!1204)))))

(declare-fun b!205638 () Bool)

(declare-fun res!172384 () Bool)

(assert (=> b!205638 (=> res!172384 e!140682)))

(assert (=> b!205638 (= res!172384 (not (invariant!0 (currentBit!9566 (_2!9443 lt!321197)) (currentByte!9571 (_2!9443 lt!321197)) (size!4557 (buf!5062 (_2!9443 lt!321197))))))))

(declare-fun b!205639 () Bool)

(declare-fun res!172382 () Bool)

(assert (=> b!205639 (=> res!172382 e!140682)))

(assert (=> b!205639 (= res!172382 (not (isPrefixOf!0 thiss!1204 (_2!9443 lt!321195))))))

(declare-fun b!205640 () Bool)

(declare-fun res!172376 () Bool)

(assert (=> b!205640 (=> (not res!172376) (not e!140691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205640 (= res!172376 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 thiss!1204))) ((_ sign_extend 32) (currentByte!9571 thiss!1204)) ((_ sign_extend 32) (currentBit!9566 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205641 () Bool)

(declare-datatypes ((tuple2!17580 0))(
  ( (tuple2!17581 (_1!9445 BitStream!8222) (_2!9445 BitStream!8222)) )
))
(declare-fun lt!321208 () tuple2!17580)

(assert (=> b!205641 (= e!140682 (= (_2!9444 (readBitPure!0 (_1!9445 lt!321208))) lt!321207))))

(declare-fun lt!321201 () tuple2!17580)

(declare-fun reader!0 (BitStream!8222 BitStream!8222) tuple2!17580)

(assert (=> b!205641 (= lt!321201 (reader!0 (_2!9443 lt!321195) (_2!9443 lt!321197)))))

(assert (=> b!205641 (= lt!321208 (reader!0 thiss!1204 (_2!9443 lt!321197)))))

(assert (=> b!205641 e!140687))

(declare-fun res!172374 () Bool)

(assert (=> b!205641 (=> (not res!172374) (not e!140687))))

(assert (=> b!205641 (= res!172374 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!321200))) (currentByte!9571 (_1!9444 lt!321200)) (currentBit!9566 (_1!9444 lt!321200))) (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!321206))) (currentByte!9571 (_1!9444 lt!321206)) (currentBit!9566 (_1!9444 lt!321206)))))))

(declare-fun lt!321198 () Unit!14671)

(declare-fun lt!321202 () BitStream!8222)

(declare-fun readBitPrefixLemma!0 (BitStream!8222 BitStream!8222) Unit!14671)

(assert (=> b!205641 (= lt!321198 (readBitPrefixLemma!0 lt!321202 (_2!9443 lt!321197)))))

(assert (=> b!205641 (= lt!321206 (readBitPure!0 (BitStream!8223 (buf!5062 (_2!9443 lt!321197)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204))))))

(assert (=> b!205641 (= lt!321200 (readBitPure!0 lt!321202))))

(declare-fun e!140683 () Bool)

(assert (=> b!205641 e!140683))

(declare-fun res!172388 () Bool)

(assert (=> b!205641 (=> (not res!172388) (not e!140683))))

(assert (=> b!205641 (= res!172388 (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (=> b!205641 (= lt!321202 (BitStream!8223 (buf!5062 (_2!9443 lt!321195)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)))))

(declare-fun b!205642 () Bool)

(declare-fun res!172373 () Bool)

(assert (=> b!205642 (=> (not res!172373) (not e!140691))))

(assert (=> b!205642 (= res!172373 (not (= i!590 nBits!348)))))

(declare-fun b!205643 () Bool)

(assert (=> b!205643 (= e!140683 (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321197)))))))

(declare-fun b!205644 () Bool)

(assert (=> b!205644 (= e!140690 e!140682)))

(declare-fun res!172378 () Bool)

(assert (=> b!205644 (=> res!172378 e!140682)))

(assert (=> b!205644 (= res!172378 (not (= lt!321199 (bvsub (bvsub (bvadd lt!321203 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205644 (= lt!321199 (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321197))) (currentByte!9571 (_2!9443 lt!321197)) (currentBit!9566 (_2!9443 lt!321197))))))

(assert (=> b!205644 (isPrefixOf!0 thiss!1204 (_2!9443 lt!321197))))

(declare-fun lt!321205 () Unit!14671)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8222 BitStream!8222 BitStream!8222) Unit!14671)

(assert (=> b!205644 (= lt!321205 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9443 lt!321195) (_2!9443 lt!321197)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8222 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17576)

(assert (=> b!205644 (= lt!321197 (appendBitsLSBFirstLoopTR!0 (_2!9443 lt!321195) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!43510 res!172387) b!205640))

(assert (= (and b!205640 res!172376) b!205633))

(assert (= (and b!205633 res!172379) b!205642))

(assert (= (and b!205642 res!172373) b!205631))

(assert (= (and b!205631 res!172385) b!205628))

(assert (= (and b!205628 res!172375) b!205634))

(assert (= (and b!205634 res!172381) b!205636))

(assert (= (and b!205636 res!172386) b!205632))

(assert (= (and b!205631 (not res!172377)) b!205644))

(assert (= (and b!205644 (not res!172378)) b!205638))

(assert (= (and b!205638 (not res!172384)) b!205630))

(assert (= (and b!205630 (not res!172380)) b!205629))

(assert (= (and b!205629 (not res!172383)) b!205639))

(assert (= (and b!205639 (not res!172382)) b!205641))

(assert (= (and b!205641 res!172388) b!205643))

(assert (= (and b!205641 res!172374) b!205635))

(assert (= start!43510 b!205637))

(declare-fun m!316893 () Bool)

(assert (=> b!205633 m!316893))

(declare-fun m!316895 () Bool)

(assert (=> b!205643 m!316895))

(declare-fun m!316897 () Bool)

(assert (=> b!205639 m!316897))

(declare-fun m!316899 () Bool)

(assert (=> b!205632 m!316899))

(declare-fun m!316901 () Bool)

(assert (=> b!205637 m!316901))

(declare-fun m!316903 () Bool)

(assert (=> b!205636 m!316903))

(assert (=> b!205636 m!316903))

(declare-fun m!316905 () Bool)

(assert (=> b!205636 m!316905))

(declare-fun m!316907 () Bool)

(assert (=> b!205629 m!316907))

(declare-fun m!316909 () Bool)

(assert (=> b!205640 m!316909))

(declare-fun m!316911 () Bool)

(assert (=> b!205641 m!316911))

(declare-fun m!316913 () Bool)

(assert (=> b!205641 m!316913))

(declare-fun m!316915 () Bool)

(assert (=> b!205641 m!316915))

(declare-fun m!316917 () Bool)

(assert (=> b!205641 m!316917))

(declare-fun m!316919 () Bool)

(assert (=> b!205641 m!316919))

(declare-fun m!316921 () Bool)

(assert (=> b!205641 m!316921))

(declare-fun m!316923 () Bool)

(assert (=> b!205641 m!316923))

(declare-fun m!316925 () Bool)

(assert (=> b!205641 m!316925))

(declare-fun m!316927 () Bool)

(assert (=> b!205641 m!316927))

(assert (=> b!205634 m!316897))

(declare-fun m!316929 () Bool)

(assert (=> b!205628 m!316929))

(declare-fun m!316931 () Bool)

(assert (=> b!205628 m!316931))

(declare-fun m!316933 () Bool)

(assert (=> start!43510 m!316933))

(assert (=> b!205631 m!316929))

(assert (=> b!205631 m!316931))

(declare-fun m!316935 () Bool)

(assert (=> b!205631 m!316935))

(declare-fun m!316937 () Bool)

(assert (=> b!205644 m!316937))

(declare-fun m!316939 () Bool)

(assert (=> b!205644 m!316939))

(declare-fun m!316941 () Bool)

(assert (=> b!205644 m!316941))

(declare-fun m!316943 () Bool)

(assert (=> b!205644 m!316943))

(declare-fun m!316945 () Bool)

(assert (=> b!205638 m!316945))

(push 1)

(assert (not start!43510))

(assert (not b!205639))

(assert (not b!205631))

(assert (not b!205644))

(assert (not b!205629))

(assert (not b!205632))

(assert (not b!205640))

(assert (not b!205633))

(assert (not b!205643))

(assert (not b!205637))

(assert (not b!205634))

(assert (not b!205638))

(assert (not b!205641))

(assert (not b!205636))

(assert (not b!205628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70063 () Bool)

(assert (=> d!70063 (= (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321197)))) (and (bvsge (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9566 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9571 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321197)))) (and (= (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321197))))))))))

(assert (=> b!205643 d!70063))

(declare-fun d!70065 () Bool)

(assert (=> d!70065 (= (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204))) (and (bvsge (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9566 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9571 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204))) (and (= (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204)))))))))

(assert (=> b!205633 d!70065))

(declare-fun d!70067 () Bool)

(declare-fun e!140750 () Bool)

(assert (=> d!70067 e!140750))

(declare-fun res!172486 () Bool)

(assert (=> d!70067 (=> (not res!172486) (not e!140750))))

(declare-fun lt!321499 () (_ BitVec 64))

(declare-fun lt!321496 () (_ BitVec 64))

(declare-fun lt!321500 () (_ BitVec 64))

(assert (=> d!70067 (= res!172486 (= lt!321499 (bvsub lt!321496 lt!321500)))))

(assert (=> d!70067 (or (= (bvand lt!321496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321496 lt!321500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70067 (= lt!321500 (remainingBits!0 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321197)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321197))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321197)))))))

(declare-fun lt!321498 () (_ BitVec 64))

(declare-fun lt!321497 () (_ BitVec 64))

(assert (=> d!70067 (= lt!321496 (bvmul lt!321498 lt!321497))))

(assert (=> d!70067 (or (= lt!321498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321497 (bvsdiv (bvmul lt!321498 lt!321497) lt!321498)))))

(assert (=> d!70067 (= lt!321497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70067 (= lt!321498 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321197)))))))

(assert (=> d!70067 (= lt!321499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321197)))))))

(assert (=> d!70067 (invariant!0 (currentBit!9566 (_2!9443 lt!321197)) (currentByte!9571 (_2!9443 lt!321197)) (size!4557 (buf!5062 (_2!9443 lt!321197))))))

(assert (=> d!70067 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321197))) (currentByte!9571 (_2!9443 lt!321197)) (currentBit!9566 (_2!9443 lt!321197))) lt!321499)))

(declare-fun b!205758 () Bool)

(declare-fun res!172485 () Bool)

(assert (=> b!205758 (=> (not res!172485) (not e!140750))))

(assert (=> b!205758 (= res!172485 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321499))))

(declare-fun b!205759 () Bool)

(declare-fun lt!321495 () (_ BitVec 64))

(assert (=> b!205759 (= e!140750 (bvsle lt!321499 (bvmul lt!321495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205759 (or (= lt!321495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321495)))))

(assert (=> b!205759 (= lt!321495 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321197)))))))

(assert (= (and d!70067 res!172486) b!205758))

(assert (= (and b!205758 res!172485) b!205759))

(declare-fun m!317133 () Bool)

(assert (=> d!70067 m!317133))

(assert (=> d!70067 m!316945))

(assert (=> b!205644 d!70067))

(declare-fun d!70075 () Bool)

(declare-fun res!172502 () Bool)

(declare-fun e!140760 () Bool)

(assert (=> d!70075 (=> (not res!172502) (not e!140760))))

(assert (=> d!70075 (= res!172502 (= (size!4557 (buf!5062 thiss!1204)) (size!4557 (buf!5062 (_2!9443 lt!321197)))))))

(assert (=> d!70075 (= (isPrefixOf!0 thiss!1204 (_2!9443 lt!321197)) e!140760)))

(declare-fun b!205773 () Bool)

(declare-fun res!172501 () Bool)

(assert (=> b!205773 (=> (not res!172501) (not e!140760))))

(assert (=> b!205773 (= res!172501 (bvsle (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321197))) (currentByte!9571 (_2!9443 lt!321197)) (currentBit!9566 (_2!9443 lt!321197)))))))

(declare-fun b!205774 () Bool)

(declare-fun e!140761 () Bool)

(assert (=> b!205774 (= e!140760 e!140761)))

(declare-fun res!172500 () Bool)

(assert (=> b!205774 (=> res!172500 e!140761)))

(assert (=> b!205774 (= res!172500 (= (size!4557 (buf!5062 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205775 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10368 array!10368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205775 (= e!140761 (arrayBitRangesEq!0 (buf!5062 thiss!1204) (buf!5062 (_2!9443 lt!321197)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204))))))

(assert (= (and d!70075 res!172502) b!205773))

(assert (= (and b!205773 res!172501) b!205774))

(assert (= (and b!205774 (not res!172500)) b!205775))

(assert (=> b!205773 m!316931))

(assert (=> b!205773 m!316937))

(assert (=> b!205775 m!316931))

(assert (=> b!205775 m!316931))

(declare-fun m!317155 () Bool)

(assert (=> b!205775 m!317155))

(assert (=> b!205644 d!70075))

(declare-fun d!70089 () Bool)

(assert (=> d!70089 (isPrefixOf!0 thiss!1204 (_2!9443 lt!321197))))

(declare-fun lt!321532 () Unit!14671)

(declare-fun choose!30 (BitStream!8222 BitStream!8222 BitStream!8222) Unit!14671)

(assert (=> d!70089 (= lt!321532 (choose!30 thiss!1204 (_2!9443 lt!321195) (_2!9443 lt!321197)))))

(assert (=> d!70089 (isPrefixOf!0 thiss!1204 (_2!9443 lt!321195))))

(assert (=> d!70089 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9443 lt!321195) (_2!9443 lt!321197)) lt!321532)))

(declare-fun bs!17223 () Bool)

(assert (= bs!17223 d!70089))

(assert (=> bs!17223 m!316939))

(declare-fun m!317161 () Bool)

(assert (=> bs!17223 m!317161))

(assert (=> bs!17223 m!316897))

(assert (=> b!205644 d!70089))

(declare-fun b!205928 () Bool)

(declare-fun e!140854 () Bool)

(declare-fun e!140852 () Bool)

(assert (=> b!205928 (= e!140854 e!140852)))

(declare-fun res!172629 () Bool)

(assert (=> b!205928 (=> (not res!172629) (not e!140852))))

(declare-datatypes ((tuple2!17590 0))(
  ( (tuple2!17591 (_1!9450 BitStream!8222) (_2!9450 (_ BitVec 64))) )
))
(declare-fun lt!322052 () tuple2!17590)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205928 (= res!172629 (= (_2!9450 lt!322052) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!322049 () tuple2!17580)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17590)

(assert (=> b!205928 (= lt!322052 (readNBitsLSBFirstsLoopPure!0 (_1!9445 lt!322049) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!322010 () Unit!14671)

(declare-fun lt!322030 () Unit!14671)

(assert (=> b!205928 (= lt!322010 lt!322030)))

(declare-fun lt!322005 () tuple2!17576)

(declare-fun lt!322045 () (_ BitVec 64))

(assert (=> b!205928 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!322005)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195))) lt!322045)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8222 array!10368 (_ BitVec 64)) Unit!14671)

(assert (=> b!205928 (= lt!322030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9443 lt!321195) (buf!5062 (_2!9443 lt!322005)) lt!322045))))

(declare-fun e!140851 () Bool)

(assert (=> b!205928 e!140851))

(declare-fun res!172633 () Bool)

(assert (=> b!205928 (=> (not res!172633) (not e!140851))))

(assert (=> b!205928 (= res!172633 (and (= (size!4557 (buf!5062 (_2!9443 lt!321195))) (size!4557 (buf!5062 (_2!9443 lt!322005)))) (bvsge lt!322045 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205928 (= lt!322045 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205928 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!205928 (= lt!322049 (reader!0 (_2!9443 lt!321195) (_2!9443 lt!322005)))))

(declare-fun b!205929 () Bool)

(declare-fun e!140855 () Bool)

(declare-fun lt!322001 () tuple2!17578)

(declare-fun lt!322013 () tuple2!17576)

(assert (=> b!205929 (= e!140855 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322001))) (currentByte!9571 (_1!9444 lt!322001)) (currentBit!9566 (_1!9444 lt!322001))) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322013))) (currentByte!9571 (_2!9443 lt!322013)) (currentBit!9566 (_2!9443 lt!322013)))))))

(declare-fun b!205930 () Bool)

(declare-fun res!172634 () Bool)

(assert (=> b!205930 (= res!172634 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322013))) (currentByte!9571 (_2!9443 lt!322013)) (currentBit!9566 (_2!9443 lt!322013))) (bvadd (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!140850 () Bool)

(assert (=> b!205930 (=> (not res!172634) (not e!140850))))

(declare-fun b!205931 () Bool)

(declare-fun e!140857 () Bool)

(declare-fun lt!322021 () tuple2!17590)

(declare-fun lt!322046 () tuple2!17580)

(assert (=> b!205931 (= e!140857 (= (_1!9450 lt!322021) (_2!9445 lt!322046)))))

(declare-fun b!205932 () Bool)

(declare-fun res!172628 () Bool)

(assert (=> b!205932 (=> (not res!172628) (not e!140854))))

(assert (=> b!205932 (= res!172628 (= (size!4557 (buf!5062 (_2!9443 lt!321195))) (size!4557 (buf!5062 (_2!9443 lt!322005)))))))

(declare-fun b!205933 () Bool)

(declare-fun e!140853 () Bool)

(declare-fun lt!322027 () tuple2!17578)

(declare-fun lt!322016 () tuple2!17578)

(assert (=> b!205933 (= e!140853 (= (_2!9444 lt!322027) (_2!9444 lt!322016)))))

(declare-fun c!10203 () Bool)

(declare-fun bm!3267 () Bool)

(declare-fun lt!322031 () tuple2!17576)

(declare-fun call!3270 () Bool)

(assert (=> bm!3267 (= call!3270 (isPrefixOf!0 (_2!9443 lt!321195) (ite c!10203 (_2!9443 lt!321195) (_2!9443 lt!322031))))))

(declare-fun d!70095 () Bool)

(assert (=> d!70095 e!140854))

(declare-fun res!172625 () Bool)

(assert (=> d!70095 (=> (not res!172625) (not e!140854))))

(assert (=> d!70095 (= res!172625 (invariant!0 (currentBit!9566 (_2!9443 lt!322005)) (currentByte!9571 (_2!9443 lt!322005)) (size!4557 (buf!5062 (_2!9443 lt!322005)))))))

(declare-fun e!140849 () tuple2!17576)

(assert (=> d!70095 (= lt!322005 e!140849)))

(assert (=> d!70095 (= c!10203 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70095 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70095 (= (appendBitsLSBFirstLoopTR!0 (_2!9443 lt!321195) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!322005)))

(declare-fun b!205934 () Bool)

(declare-fun e!140856 () (_ BitVec 64))

(assert (=> b!205934 (= e!140856 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!205935 () Bool)

(declare-fun Unit!14699 () Unit!14671)

(assert (=> b!205935 (= e!140849 (tuple2!17577 Unit!14699 (_2!9443 lt!321195)))))

(declare-fun lt!322025 () Unit!14671)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8222) Unit!14671)

(assert (=> b!205935 (= lt!322025 (lemmaIsPrefixRefl!0 (_2!9443 lt!321195)))))

(assert (=> b!205935 call!3270))

(declare-fun lt!322042 () Unit!14671)

(assert (=> b!205935 (= lt!322042 lt!322025)))

(declare-fun b!205936 () Bool)

(assert (=> b!205936 (= e!140852 (= (_1!9450 lt!322052) (_2!9445 lt!322049)))))

(declare-fun b!205937 () Bool)

(assert (=> b!205937 (= e!140856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!205938 () Bool)

(assert (=> b!205938 (= lt!322001 (readBitPure!0 (readerFrom!0 (_2!9443 lt!322013) (currentBit!9566 (_2!9443 lt!321195)) (currentByte!9571 (_2!9443 lt!321195)))))))

(declare-fun lt!322041 () Bool)

(declare-fun res!172630 () Bool)

(assert (=> b!205938 (= res!172630 (and (= (_2!9444 lt!322001) lt!322041) (= (_1!9444 lt!322001) (_2!9443 lt!322013))))))

(assert (=> b!205938 (=> (not res!172630) (not e!140855))))

(assert (=> b!205938 (= e!140850 e!140855)))

(declare-fun b!205939 () Bool)

(declare-fun res!172626 () Bool)

(assert (=> b!205939 (=> (not res!172626) (not e!140854))))

(declare-fun lt!322034 () (_ BitVec 64))

(declare-fun lt!322035 () (_ BitVec 64))

(assert (=> b!205939 (= res!172626 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322005))) (currentByte!9571 (_2!9443 lt!322005)) (currentBit!9566 (_2!9443 lt!322005))) (bvsub lt!322034 lt!322035)))))

(assert (=> b!205939 (or (= (bvand lt!322034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!322034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!322034 lt!322035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205939 (= lt!322035 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!322019 () (_ BitVec 64))

(declare-fun lt!322009 () (_ BitVec 64))

(assert (=> b!205939 (= lt!322034 (bvadd lt!322019 lt!322009))))

(assert (=> b!205939 (or (not (= (bvand lt!322019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322009 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!322019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!322019 lt!322009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205939 (= lt!322009 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205939 (= lt!322019 (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))))))

(declare-fun b!205940 () Bool)

(assert (=> b!205940 (= e!140849 (tuple2!17577 (_1!9443 lt!322031) (_2!9443 lt!322031)))))

(assert (=> b!205940 (= lt!322041 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205940 (= lt!322013 (appendBit!0 (_2!9443 lt!321195) lt!322041))))

(declare-fun res!172627 () Bool)

(assert (=> b!205940 (= res!172627 (= (size!4557 (buf!5062 (_2!9443 lt!321195))) (size!4557 (buf!5062 (_2!9443 lt!322013)))))))

(assert (=> b!205940 (=> (not res!172627) (not e!140850))))

(assert (=> b!205940 e!140850))

(declare-fun lt!322032 () tuple2!17576)

(assert (=> b!205940 (= lt!322032 lt!322013)))

(assert (=> b!205940 (= lt!322031 (appendBitsLSBFirstLoopTR!0 (_2!9443 lt!322032) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!322038 () Unit!14671)

(assert (=> b!205940 (= lt!322038 (lemmaIsPrefixTransitive!0 (_2!9443 lt!321195) (_2!9443 lt!322032) (_2!9443 lt!322031)))))

(assert (=> b!205940 call!3270))

(declare-fun lt!322022 () Unit!14671)

(assert (=> b!205940 (= lt!322022 lt!322038)))

(assert (=> b!205940 (invariant!0 (currentBit!9566 (_2!9443 lt!321195)) (currentByte!9571 (_2!9443 lt!321195)) (size!4557 (buf!5062 (_2!9443 lt!322032))))))

(declare-fun lt!322028 () BitStream!8222)

(assert (=> b!205940 (= lt!322028 (BitStream!8223 (buf!5062 (_2!9443 lt!322032)) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))))))

(assert (=> b!205940 (invariant!0 (currentBit!9566 lt!322028) (currentByte!9571 lt!322028) (size!4557 (buf!5062 (_2!9443 lt!322031))))))

(declare-fun lt!322056 () BitStream!8222)

(assert (=> b!205940 (= lt!322056 (BitStream!8223 (buf!5062 (_2!9443 lt!322031)) (currentByte!9571 lt!322028) (currentBit!9566 lt!322028)))))

(assert (=> b!205940 (= lt!322027 (readBitPure!0 lt!322028))))

(assert (=> b!205940 (= lt!322016 (readBitPure!0 lt!322056))))

(declare-fun lt!322047 () Unit!14671)

(assert (=> b!205940 (= lt!322047 (readBitPrefixLemma!0 lt!322028 (_2!9443 lt!322031)))))

(declare-fun res!172631 () Bool)

(assert (=> b!205940 (= res!172631 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322027))) (currentByte!9571 (_1!9444 lt!322027)) (currentBit!9566 (_1!9444 lt!322027))) (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322016))) (currentByte!9571 (_1!9444 lt!322016)) (currentBit!9566 (_1!9444 lt!322016)))))))

(assert (=> b!205940 (=> (not res!172631) (not e!140853))))

(assert (=> b!205940 e!140853))

(declare-fun lt!322040 () Unit!14671)

(assert (=> b!205940 (= lt!322040 lt!322047)))

(declare-fun lt!322017 () tuple2!17580)

(assert (=> b!205940 (= lt!322017 (reader!0 (_2!9443 lt!321195) (_2!9443 lt!322031)))))

(declare-fun lt!322023 () tuple2!17580)

(assert (=> b!205940 (= lt!322023 (reader!0 (_2!9443 lt!322032) (_2!9443 lt!322031)))))

(declare-fun lt!322006 () tuple2!17578)

(assert (=> b!205940 (= lt!322006 (readBitPure!0 (_1!9445 lt!322017)))))

(assert (=> b!205940 (= (_2!9444 lt!322006) lt!322041)))

(declare-fun lt!322050 () Unit!14671)

(declare-fun Unit!14700 () Unit!14671)

(assert (=> b!205940 (= lt!322050 Unit!14700)))

(declare-fun lt!322054 () (_ BitVec 64))

(assert (=> b!205940 (= lt!322054 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!322055 () (_ BitVec 64))

(assert (=> b!205940 (= lt!322055 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!322026 () Unit!14671)

(assert (=> b!205940 (= lt!322026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9443 lt!321195) (buf!5062 (_2!9443 lt!322031)) lt!322055))))

(assert (=> b!205940 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!322031)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195))) lt!322055)))

(declare-fun lt!322048 () Unit!14671)

(assert (=> b!205940 (= lt!322048 lt!322026)))

(declare-fun lt!322002 () tuple2!17590)

(assert (=> b!205940 (= lt!322002 (readNBitsLSBFirstsLoopPure!0 (_1!9445 lt!322017) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!322054))))

(declare-fun lt!322012 () (_ BitVec 64))

(assert (=> b!205940 (= lt!322012 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!322036 () Unit!14671)

(assert (=> b!205940 (= lt!322036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9443 lt!322032) (buf!5062 (_2!9443 lt!322031)) lt!322012))))

(assert (=> b!205940 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!322031)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!322032))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!322032))) lt!322012)))

(declare-fun lt!322014 () Unit!14671)

(assert (=> b!205940 (= lt!322014 lt!322036)))

(declare-fun lt!322015 () tuple2!17590)

(assert (=> b!205940 (= lt!322015 (readNBitsLSBFirstsLoopPure!0 (_1!9445 lt!322023) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!322054 (ite (_2!9444 lt!322006) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!322037 () tuple2!17590)

(assert (=> b!205940 (= lt!322037 (readNBitsLSBFirstsLoopPure!0 (_1!9445 lt!322017) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!322054))))

(declare-fun c!10204 () Bool)

(assert (=> b!205940 (= c!10204 (_2!9444 (readBitPure!0 (_1!9445 lt!322017))))))

(declare-fun lt!322043 () tuple2!17590)

(declare-fun withMovedBitIndex!0 (BitStream!8222 (_ BitVec 64)) BitStream!8222)

(assert (=> b!205940 (= lt!322043 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9445 lt!322017) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!322054 e!140856)))))

(declare-fun lt!322051 () Unit!14671)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14671)

(assert (=> b!205940 (= lt!322051 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9445 lt!322017) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!322054))))

(assert (=> b!205940 (and (= (_2!9450 lt!322037) (_2!9450 lt!322043)) (= (_1!9450 lt!322037) (_1!9450 lt!322043)))))

(declare-fun lt!322024 () Unit!14671)

(assert (=> b!205940 (= lt!322024 lt!322051)))

(assert (=> b!205940 (= (_1!9445 lt!322017) (withMovedBitIndex!0 (_2!9445 lt!322017) (bvsub (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322031))) (currentByte!9571 (_2!9443 lt!322031)) (currentBit!9566 (_2!9443 lt!322031))))))))

(declare-fun lt!322020 () Unit!14671)

(declare-fun Unit!14701 () Unit!14671)

(assert (=> b!205940 (= lt!322020 Unit!14701)))

(assert (=> b!205940 (= (_1!9445 lt!322023) (withMovedBitIndex!0 (_2!9445 lt!322023) (bvsub (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322032))) (currentByte!9571 (_2!9443 lt!322032)) (currentBit!9566 (_2!9443 lt!322032))) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322031))) (currentByte!9571 (_2!9443 lt!322031)) (currentBit!9566 (_2!9443 lt!322031))))))))

(declare-fun lt!322007 () Unit!14671)

(declare-fun Unit!14702 () Unit!14671)

(assert (=> b!205940 (= lt!322007 Unit!14702)))

(assert (=> b!205940 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))) (bvsub (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322032))) (currentByte!9571 (_2!9443 lt!322032)) (currentBit!9566 (_2!9443 lt!322032))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!322033 () Unit!14671)

(declare-fun Unit!14703 () Unit!14671)

(assert (=> b!205940 (= lt!322033 Unit!14703)))

(assert (=> b!205940 (= (_2!9450 lt!322002) (_2!9450 lt!322015))))

(declare-fun lt!322029 () Unit!14671)

(declare-fun Unit!14704 () Unit!14671)

(assert (=> b!205940 (= lt!322029 Unit!14704)))

(assert (=> b!205940 (invariant!0 (currentBit!9566 (_2!9443 lt!322031)) (currentByte!9571 (_2!9443 lt!322031)) (size!4557 (buf!5062 (_2!9443 lt!322031))))))

(declare-fun lt!322008 () Unit!14671)

(declare-fun Unit!14705 () Unit!14671)

(assert (=> b!205940 (= lt!322008 Unit!14705)))

(assert (=> b!205940 (= (size!4557 (buf!5062 (_2!9443 lt!321195))) (size!4557 (buf!5062 (_2!9443 lt!322031))))))

(declare-fun lt!322039 () Unit!14671)

(declare-fun Unit!14706 () Unit!14671)

(assert (=> b!205940 (= lt!322039 Unit!14706)))

(assert (=> b!205940 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322031))) (currentByte!9571 (_2!9443 lt!322031)) (currentBit!9566 (_2!9443 lt!322031))) (bvsub (bvadd (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!322044 () Unit!14671)

(declare-fun Unit!14707 () Unit!14671)

(assert (=> b!205940 (= lt!322044 Unit!14707)))

(declare-fun lt!322018 () Unit!14671)

(declare-fun Unit!14708 () Unit!14671)

(assert (=> b!205940 (= lt!322018 Unit!14708)))

(assert (=> b!205940 (= lt!322046 (reader!0 (_2!9443 lt!321195) (_2!9443 lt!322031)))))

(declare-fun lt!322003 () (_ BitVec 64))

(assert (=> b!205940 (= lt!322003 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!322004 () Unit!14671)

(assert (=> b!205940 (= lt!322004 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9443 lt!321195) (buf!5062 (_2!9443 lt!322031)) lt!322003))))

(assert (=> b!205940 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!322031)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195))) lt!322003)))

(declare-fun lt!322053 () Unit!14671)

(assert (=> b!205940 (= lt!322053 lt!322004)))

(assert (=> b!205940 (= lt!322021 (readNBitsLSBFirstsLoopPure!0 (_1!9445 lt!322046) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172632 () Bool)

(assert (=> b!205940 (= res!172632 (= (_2!9450 lt!322021) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205940 (=> (not res!172632) (not e!140857))))

(assert (=> b!205940 e!140857))

(declare-fun lt!322011 () Unit!14671)

(declare-fun Unit!14709 () Unit!14671)

(assert (=> b!205940 (= lt!322011 Unit!14709)))

(declare-fun b!205941 () Bool)

(declare-fun res!172635 () Bool)

(assert (=> b!205941 (=> (not res!172635) (not e!140854))))

(assert (=> b!205941 (= res!172635 (isPrefixOf!0 (_2!9443 lt!321195) (_2!9443 lt!322005)))))

(declare-fun b!205942 () Bool)

(assert (=> b!205942 (= e!140851 (validate_offset_bits!1 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321195)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195))) lt!322045))))

(declare-fun b!205943 () Bool)

(declare-fun res!172624 () Bool)

(assert (=> b!205943 (= res!172624 (isPrefixOf!0 (_2!9443 lt!321195) (_2!9443 lt!322013)))))

(assert (=> b!205943 (=> (not res!172624) (not e!140850))))

(assert (= (and d!70095 c!10203) b!205935))

(assert (= (and d!70095 (not c!10203)) b!205940))

(assert (= (and b!205940 res!172627) b!205930))

(assert (= (and b!205930 res!172634) b!205943))

(assert (= (and b!205943 res!172624) b!205938))

(assert (= (and b!205938 res!172630) b!205929))

(assert (= (and b!205940 res!172631) b!205933))

(assert (= (and b!205940 c!10204) b!205934))

(assert (= (and b!205940 (not c!10204)) b!205937))

(assert (= (and b!205940 res!172632) b!205931))

(assert (= (or b!205935 b!205940) bm!3267))

(assert (= (and d!70095 res!172625) b!205932))

(assert (= (and b!205932 res!172628) b!205939))

(assert (= (and b!205939 res!172626) b!205941))

(assert (= (and b!205941 res!172635) b!205928))

(assert (= (and b!205928 res!172633) b!205942))

(assert (= (and b!205928 res!172629) b!205936))

(declare-fun m!317369 () Bool)

(assert (=> b!205942 m!317369))

(declare-fun m!317371 () Bool)

(assert (=> b!205935 m!317371))

(declare-fun m!317373 () Bool)

(assert (=> b!205941 m!317373))

(declare-fun m!317375 () Bool)

(assert (=> b!205940 m!317375))

(declare-fun m!317377 () Bool)

(assert (=> b!205940 m!317377))

(declare-fun m!317379 () Bool)

(assert (=> b!205940 m!317379))

(declare-fun m!317381 () Bool)

(assert (=> b!205940 m!317381))

(declare-fun m!317383 () Bool)

(assert (=> b!205940 m!317383))

(declare-fun m!317385 () Bool)

(assert (=> b!205940 m!317385))

(declare-fun m!317387 () Bool)

(assert (=> b!205940 m!317387))

(declare-fun m!317389 () Bool)

(assert (=> b!205940 m!317389))

(declare-fun m!317391 () Bool)

(assert (=> b!205940 m!317391))

(declare-fun m!317393 () Bool)

(assert (=> b!205940 m!317393))

(declare-fun m!317395 () Bool)

(assert (=> b!205940 m!317395))

(declare-fun m!317397 () Bool)

(assert (=> b!205940 m!317397))

(declare-fun m!317399 () Bool)

(assert (=> b!205940 m!317399))

(declare-fun m!317401 () Bool)

(assert (=> b!205940 m!317401))

(declare-fun m!317403 () Bool)

(assert (=> b!205940 m!317403))

(declare-fun m!317405 () Bool)

(assert (=> b!205940 m!317405))

(declare-fun m!317407 () Bool)

(assert (=> b!205940 m!317407))

(declare-fun m!317409 () Bool)

(assert (=> b!205940 m!317409))

(declare-fun m!317411 () Bool)

(assert (=> b!205940 m!317411))

(declare-fun m!317413 () Bool)

(assert (=> b!205940 m!317413))

(declare-fun m!317415 () Bool)

(assert (=> b!205940 m!317415))

(assert (=> b!205940 m!316929))

(declare-fun m!317417 () Bool)

(assert (=> b!205940 m!317417))

(declare-fun m!317419 () Bool)

(assert (=> b!205940 m!317419))

(declare-fun m!317421 () Bool)

(assert (=> b!205940 m!317421))

(declare-fun m!317423 () Bool)

(assert (=> b!205940 m!317423))

(declare-fun m!317425 () Bool)

(assert (=> b!205940 m!317425))

(assert (=> b!205940 m!317389))

(declare-fun m!317427 () Bool)

(assert (=> b!205940 m!317427))

(declare-fun m!317429 () Bool)

(assert (=> b!205940 m!317429))

(declare-fun m!317431 () Bool)

(assert (=> b!205940 m!317431))

(declare-fun m!317433 () Bool)

(assert (=> b!205940 m!317433))

(declare-fun m!317435 () Bool)

(assert (=> b!205940 m!317435))

(declare-fun m!317437 () Bool)

(assert (=> b!205940 m!317437))

(declare-fun m!317439 () Bool)

(assert (=> b!205930 m!317439))

(assert (=> b!205930 m!316929))

(declare-fun m!317441 () Bool)

(assert (=> b!205943 m!317441))

(declare-fun m!317443 () Bool)

(assert (=> b!205928 m!317443))

(assert (=> b!205928 m!317407))

(declare-fun m!317445 () Bool)

(assert (=> b!205928 m!317445))

(declare-fun m!317447 () Bool)

(assert (=> b!205928 m!317447))

(declare-fun m!317449 () Bool)

(assert (=> b!205928 m!317449))

(assert (=> b!205928 m!317425))

(declare-fun m!317451 () Bool)

(assert (=> b!205929 m!317451))

(assert (=> b!205929 m!317439))

(declare-fun m!317453 () Bool)

(assert (=> b!205939 m!317453))

(assert (=> b!205939 m!316929))

(declare-fun m!317455 () Bool)

(assert (=> d!70095 m!317455))

(declare-fun m!317457 () Bool)

(assert (=> bm!3267 m!317457))

(declare-fun m!317459 () Bool)

(assert (=> b!205938 m!317459))

(assert (=> b!205938 m!317459))

(declare-fun m!317461 () Bool)

(assert (=> b!205938 m!317461))

(assert (=> b!205644 d!70095))

(declare-fun d!70111 () Bool)

(declare-fun e!140858 () Bool)

(assert (=> d!70111 e!140858))

(declare-fun res!172637 () Bool)

(assert (=> d!70111 (=> (not res!172637) (not e!140858))))

(declare-fun lt!322061 () (_ BitVec 64))

(declare-fun lt!322062 () (_ BitVec 64))

(declare-fun lt!322058 () (_ BitVec 64))

(assert (=> d!70111 (= res!172637 (= lt!322061 (bvsub lt!322058 lt!322062)))))

(assert (=> d!70111 (or (= (bvand lt!322058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!322058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!322058 lt!322062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70111 (= lt!322062 (remainingBits!0 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321195)))) ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195)))))))

(declare-fun lt!322060 () (_ BitVec 64))

(declare-fun lt!322059 () (_ BitVec 64))

(assert (=> d!70111 (= lt!322058 (bvmul lt!322060 lt!322059))))

(assert (=> d!70111 (or (= lt!322060 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!322059 (bvsdiv (bvmul lt!322060 lt!322059) lt!322060)))))

(assert (=> d!70111 (= lt!322059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70111 (= lt!322060 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (=> d!70111 (= lt!322061 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9571 (_2!9443 lt!321195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9566 (_2!9443 lt!321195)))))))

(assert (=> d!70111 (invariant!0 (currentBit!9566 (_2!9443 lt!321195)) (currentByte!9571 (_2!9443 lt!321195)) (size!4557 (buf!5062 (_2!9443 lt!321195))))))

(assert (=> d!70111 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195))) lt!322061)))

(declare-fun b!205944 () Bool)

(declare-fun res!172636 () Bool)

(assert (=> b!205944 (=> (not res!172636) (not e!140858))))

(assert (=> b!205944 (= res!172636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!322061))))

(declare-fun b!205945 () Bool)

(declare-fun lt!322057 () (_ BitVec 64))

(assert (=> b!205945 (= e!140858 (bvsle lt!322061 (bvmul lt!322057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205945 (or (= lt!322057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!322057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!322057)))))

(assert (=> b!205945 (= lt!322057 ((_ sign_extend 32) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (= (and d!70111 res!172637) b!205944))

(assert (= (and b!205944 res!172636) b!205945))

(declare-fun m!317463 () Bool)

(assert (=> d!70111 m!317463))

(declare-fun m!317465 () Bool)

(assert (=> d!70111 m!317465))

(assert (=> b!205631 d!70111))

(declare-fun d!70113 () Bool)

(declare-fun e!140859 () Bool)

(assert (=> d!70113 e!140859))

(declare-fun res!172639 () Bool)

(assert (=> d!70113 (=> (not res!172639) (not e!140859))))

(declare-fun lt!322067 () (_ BitVec 64))

(declare-fun lt!322068 () (_ BitVec 64))

(declare-fun lt!322064 () (_ BitVec 64))

(assert (=> d!70113 (= res!172639 (= lt!322067 (bvsub lt!322064 lt!322068)))))

(assert (=> d!70113 (or (= (bvand lt!322064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!322064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!322064 lt!322068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70113 (= lt!322068 (remainingBits!0 ((_ sign_extend 32) (size!4557 (buf!5062 thiss!1204))) ((_ sign_extend 32) (currentByte!9571 thiss!1204)) ((_ sign_extend 32) (currentBit!9566 thiss!1204))))))

(declare-fun lt!322066 () (_ BitVec 64))

(declare-fun lt!322065 () (_ BitVec 64))

(assert (=> d!70113 (= lt!322064 (bvmul lt!322066 lt!322065))))

(assert (=> d!70113 (or (= lt!322066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!322065 (bvsdiv (bvmul lt!322066 lt!322065) lt!322066)))))

(assert (=> d!70113 (= lt!322065 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70113 (= lt!322066 ((_ sign_extend 32) (size!4557 (buf!5062 thiss!1204))))))

(assert (=> d!70113 (= lt!322067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9571 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9566 thiss!1204))))))

(assert (=> d!70113 (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204)))))

(assert (=> d!70113 (= (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)) lt!322067)))

(declare-fun b!205946 () Bool)

(declare-fun res!172638 () Bool)

(assert (=> b!205946 (=> (not res!172638) (not e!140859))))

(assert (=> b!205946 (= res!172638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!322067))))

(declare-fun b!205947 () Bool)

(declare-fun lt!322063 () (_ BitVec 64))

(assert (=> b!205947 (= e!140859 (bvsle lt!322067 (bvmul lt!322063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205947 (or (= lt!322063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!322063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!322063)))))

(assert (=> b!205947 (= lt!322063 ((_ sign_extend 32) (size!4557 (buf!5062 thiss!1204))))))

(assert (= (and d!70113 res!172639) b!205946))

(assert (= (and b!205946 res!172638) b!205947))

(declare-fun m!317467 () Bool)

(assert (=> d!70113 m!317467))

(assert (=> d!70113 m!316893))

(assert (=> b!205631 d!70113))

(declare-fun b!205958 () Bool)

(declare-fun res!172649 () Bool)

(declare-fun e!140864 () Bool)

(assert (=> b!205958 (=> (not res!172649) (not e!140864))))

(declare-fun lt!322077 () tuple2!17576)

(assert (=> b!205958 (= res!172649 (isPrefixOf!0 thiss!1204 (_2!9443 lt!322077)))))

(declare-fun b!205957 () Bool)

(declare-fun res!172648 () Bool)

(assert (=> b!205957 (=> (not res!172648) (not e!140864))))

(declare-fun lt!322080 () (_ BitVec 64))

(declare-fun lt!322078 () (_ BitVec 64))

(assert (=> b!205957 (= res!172648 (= (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322077))) (currentByte!9571 (_2!9443 lt!322077)) (currentBit!9566 (_2!9443 lt!322077))) (bvadd lt!322078 lt!322080)))))

(assert (=> b!205957 (or (not (= (bvand lt!322078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322080 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!322078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!322078 lt!322080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205957 (= lt!322080 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205957 (= lt!322078 (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)))))

(declare-fun b!205959 () Bool)

(declare-fun e!140865 () Bool)

(assert (=> b!205959 (= e!140864 e!140865)))

(declare-fun res!172651 () Bool)

(assert (=> b!205959 (=> (not res!172651) (not e!140865))))

(declare-fun lt!322079 () tuple2!17578)

(assert (=> b!205959 (= res!172651 (and (= (_2!9444 lt!322079) lt!321207) (= (_1!9444 lt!322079) (_2!9443 lt!322077))))))

(assert (=> b!205959 (= lt!322079 (readBitPure!0 (readerFrom!0 (_2!9443 lt!322077) (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204))))))

(declare-fun b!205960 () Bool)

(assert (=> b!205960 (= e!140865 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322079))) (currentByte!9571 (_1!9444 lt!322079)) (currentBit!9566 (_1!9444 lt!322079))) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!322077))) (currentByte!9571 (_2!9443 lt!322077)) (currentBit!9566 (_2!9443 lt!322077)))))))

(declare-fun d!70115 () Bool)

(assert (=> d!70115 e!140864))

(declare-fun res!172650 () Bool)

(assert (=> d!70115 (=> (not res!172650) (not e!140864))))

(assert (=> d!70115 (= res!172650 (= (size!4557 (buf!5062 thiss!1204)) (size!4557 (buf!5062 (_2!9443 lt!322077)))))))

(declare-fun choose!16 (BitStream!8222 Bool) tuple2!17576)

(assert (=> d!70115 (= lt!322077 (choose!16 thiss!1204 lt!321207))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70115 (validate_offset_bit!0 ((_ sign_extend 32) (size!4557 (buf!5062 thiss!1204))) ((_ sign_extend 32) (currentByte!9571 thiss!1204)) ((_ sign_extend 32) (currentBit!9566 thiss!1204)))))

(assert (=> d!70115 (= (appendBit!0 thiss!1204 lt!321207) lt!322077)))

(assert (= (and d!70115 res!172650) b!205957))

(assert (= (and b!205957 res!172648) b!205958))

(assert (= (and b!205958 res!172649) b!205959))

(assert (= (and b!205959 res!172651) b!205960))

(declare-fun m!317469 () Bool)

(assert (=> b!205960 m!317469))

(declare-fun m!317471 () Bool)

(assert (=> b!205960 m!317471))

(declare-fun m!317473 () Bool)

(assert (=> b!205958 m!317473))

(declare-fun m!317475 () Bool)

(assert (=> b!205959 m!317475))

(assert (=> b!205959 m!317475))

(declare-fun m!317477 () Bool)

(assert (=> b!205959 m!317477))

(declare-fun m!317479 () Bool)

(assert (=> d!70115 m!317479))

(declare-fun m!317481 () Bool)

(assert (=> d!70115 m!317481))

(assert (=> b!205957 m!317471))

(assert (=> b!205957 m!316931))

(assert (=> b!205631 d!70115))

(declare-fun d!70117 () Bool)

(declare-fun e!140866 () Bool)

(assert (=> d!70117 e!140866))

(declare-fun res!172653 () Bool)

(assert (=> d!70117 (=> (not res!172653) (not e!140866))))

(declare-fun lt!322085 () (_ BitVec 64))

(declare-fun lt!322082 () (_ BitVec 64))

(declare-fun lt!322086 () (_ BitVec 64))

(assert (=> d!70117 (= res!172653 (= lt!322085 (bvsub lt!322082 lt!322086)))))

(assert (=> d!70117 (or (= (bvand lt!322082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!322082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!322082 lt!322086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70117 (= lt!322086 (remainingBits!0 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321204)))) ((_ sign_extend 32) (currentByte!9571 (_1!9444 lt!321204))) ((_ sign_extend 32) (currentBit!9566 (_1!9444 lt!321204)))))))

(declare-fun lt!322084 () (_ BitVec 64))

(declare-fun lt!322083 () (_ BitVec 64))

(assert (=> d!70117 (= lt!322082 (bvmul lt!322084 lt!322083))))

(assert (=> d!70117 (or (= lt!322084 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!322083 (bvsdiv (bvmul lt!322084 lt!322083) lt!322084)))))

(assert (=> d!70117 (= lt!322083 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70117 (= lt!322084 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321204)))))))

(assert (=> d!70117 (= lt!322085 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9571 (_1!9444 lt!321204))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9566 (_1!9444 lt!321204)))))))

(assert (=> d!70117 (invariant!0 (currentBit!9566 (_1!9444 lt!321204)) (currentByte!9571 (_1!9444 lt!321204)) (size!4557 (buf!5062 (_1!9444 lt!321204))))))

(assert (=> d!70117 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!321204))) (currentByte!9571 (_1!9444 lt!321204)) (currentBit!9566 (_1!9444 lt!321204))) lt!322085)))

(declare-fun b!205961 () Bool)

(declare-fun res!172652 () Bool)

(assert (=> b!205961 (=> (not res!172652) (not e!140866))))

(assert (=> b!205961 (= res!172652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!322085))))

(declare-fun b!205962 () Bool)

(declare-fun lt!322081 () (_ BitVec 64))

(assert (=> b!205962 (= e!140866 (bvsle lt!322085 (bvmul lt!322081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205962 (or (= lt!322081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!322081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!322081)))))

(assert (=> b!205962 (= lt!322081 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321204)))))))

(assert (= (and d!70117 res!172653) b!205961))

(assert (= (and b!205961 res!172652) b!205962))

(declare-fun m!317483 () Bool)

(assert (=> d!70117 m!317483))

(declare-fun m!317485 () Bool)

(assert (=> d!70117 m!317485))

(assert (=> b!205632 d!70117))

(declare-fun d!70119 () Bool)

(declare-datatypes ((tuple2!17592 0))(
  ( (tuple2!17593 (_1!9451 Bool) (_2!9451 BitStream!8222)) )
))
(declare-fun lt!322089 () tuple2!17592)

(declare-fun readBit!0 (BitStream!8222) tuple2!17592)

(assert (=> d!70119 (= lt!322089 (readBit!0 (readerFrom!0 (_2!9443 lt!321195) (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204))))))

(assert (=> d!70119 (= (readBitPure!0 (readerFrom!0 (_2!9443 lt!321195) (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204))) (tuple2!17579 (_2!9451 lt!322089) (_1!9451 lt!322089)))))

(declare-fun bs!17226 () Bool)

(assert (= bs!17226 d!70119))

(assert (=> bs!17226 m!316903))

(declare-fun m!317487 () Bool)

(assert (=> bs!17226 m!317487))

(assert (=> b!205636 d!70119))

(declare-fun d!70121 () Bool)

(declare-fun e!140869 () Bool)

(assert (=> d!70121 e!140869))

(declare-fun res!172657 () Bool)

(assert (=> d!70121 (=> (not res!172657) (not e!140869))))

(assert (=> d!70121 (= res!172657 (invariant!0 (currentBit!9566 (_2!9443 lt!321195)) (currentByte!9571 (_2!9443 lt!321195)) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (=> d!70121 (= (readerFrom!0 (_2!9443 lt!321195) (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204)) (BitStream!8223 (buf!5062 (_2!9443 lt!321195)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)))))

(declare-fun b!205965 () Bool)

(assert (=> b!205965 (= e!140869 (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (= (and d!70121 res!172657) b!205965))

(assert (=> d!70121 m!317465))

(assert (=> b!205965 m!316919))

(assert (=> b!205636 d!70121))

(declare-fun d!70123 () Bool)

(declare-fun res!172660 () Bool)

(declare-fun e!140870 () Bool)

(assert (=> d!70123 (=> (not res!172660) (not e!140870))))

(assert (=> d!70123 (= res!172660 (= (size!4557 (buf!5062 thiss!1204)) (size!4557 (buf!5062 (_2!9443 lt!321195)))))))

(assert (=> d!70123 (= (isPrefixOf!0 thiss!1204 (_2!9443 lt!321195)) e!140870)))

(declare-fun b!205966 () Bool)

(declare-fun res!172659 () Bool)

(assert (=> b!205966 (=> (not res!172659) (not e!140870))))

(assert (=> b!205966 (= res!172659 (bvsle (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204)) (bitIndex!0 (size!4557 (buf!5062 (_2!9443 lt!321195))) (currentByte!9571 (_2!9443 lt!321195)) (currentBit!9566 (_2!9443 lt!321195)))))))

(declare-fun b!205967 () Bool)

(declare-fun e!140871 () Bool)

(assert (=> b!205967 (= e!140870 e!140871)))

(declare-fun res!172658 () Bool)

(assert (=> b!205967 (=> res!172658 e!140871)))

(assert (=> b!205967 (= res!172658 (= (size!4557 (buf!5062 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205968 () Bool)

(assert (=> b!205968 (= e!140871 (arrayBitRangesEq!0 (buf!5062 thiss!1204) (buf!5062 (_2!9443 lt!321195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4557 (buf!5062 thiss!1204)) (currentByte!9571 thiss!1204) (currentBit!9566 thiss!1204))))))

(assert (= (and d!70123 res!172660) b!205966))

(assert (= (and b!205966 res!172659) b!205967))

(assert (= (and b!205967 (not res!172658)) b!205968))

(assert (=> b!205966 m!316931))

(assert (=> b!205966 m!316929))

(assert (=> b!205968 m!316931))

(assert (=> b!205968 m!316931))

(declare-fun m!317489 () Bool)

(assert (=> b!205968 m!317489))

(assert (=> b!205634 d!70123))

(declare-fun d!70125 () Bool)

(assert (=> d!70125 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 thiss!1204))))))

(declare-fun bs!17227 () Bool)

(assert (= bs!17227 d!70125))

(assert (=> bs!17227 m!316893))

(assert (=> start!43510 d!70125))

(declare-fun d!70127 () Bool)

(assert (=> d!70127 (= (invariant!0 (currentBit!9566 (_2!9443 lt!321197)) (currentByte!9571 (_2!9443 lt!321197)) (size!4557 (buf!5062 (_2!9443 lt!321197)))) (and (bvsge (currentBit!9566 (_2!9443 lt!321197)) #b00000000000000000000000000000000) (bvslt (currentBit!9566 (_2!9443 lt!321197)) #b00000000000000000000000000001000) (bvsge (currentByte!9571 (_2!9443 lt!321197)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9571 (_2!9443 lt!321197)) (size!4557 (buf!5062 (_2!9443 lt!321197)))) (and (= (currentBit!9566 (_2!9443 lt!321197)) #b00000000000000000000000000000000) (= (currentByte!9571 (_2!9443 lt!321197)) (size!4557 (buf!5062 (_2!9443 lt!321197))))))))))

(assert (=> b!205638 d!70127))

(assert (=> b!205628 d!70111))

(assert (=> b!205628 d!70113))

(declare-fun d!70129 () Bool)

(assert (=> d!70129 (= (array_inv!4298 (buf!5062 thiss!1204)) (bvsge (size!4557 (buf!5062 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205637 d!70129))

(declare-fun d!70131 () Bool)

(assert (=> d!70131 (= (invariant!0 (currentBit!9566 thiss!1204) (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321195)))) (and (bvsge (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9566 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9571 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321195)))) (and (= (currentBit!9566 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9571 thiss!1204) (size!4557 (buf!5062 (_2!9443 lt!321195))))))))))

(assert (=> b!205641 d!70131))

(declare-fun d!70133 () Bool)

(declare-fun e!140872 () Bool)

(assert (=> d!70133 e!140872))

(declare-fun res!172662 () Bool)

(assert (=> d!70133 (=> (not res!172662) (not e!140872))))

(declare-fun lt!322091 () (_ BitVec 64))

(declare-fun lt!322094 () (_ BitVec 64))

(declare-fun lt!322095 () (_ BitVec 64))

(assert (=> d!70133 (= res!172662 (= lt!322094 (bvsub lt!322091 lt!322095)))))

(assert (=> d!70133 (or (= (bvand lt!322091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!322095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!322091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!322091 lt!322095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70133 (= lt!322095 (remainingBits!0 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321206)))) ((_ sign_extend 32) (currentByte!9571 (_1!9444 lt!321206))) ((_ sign_extend 32) (currentBit!9566 (_1!9444 lt!321206)))))))

(declare-fun lt!322093 () (_ BitVec 64))

(declare-fun lt!322092 () (_ BitVec 64))

(assert (=> d!70133 (= lt!322091 (bvmul lt!322093 lt!322092))))

(assert (=> d!70133 (or (= lt!322093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!322092 (bvsdiv (bvmul lt!322093 lt!322092) lt!322093)))))

(assert (=> d!70133 (= lt!322092 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70133 (= lt!322093 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321206)))))))

(assert (=> d!70133 (= lt!322094 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9571 (_1!9444 lt!321206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9566 (_1!9444 lt!321206)))))))

(assert (=> d!70133 (invariant!0 (currentBit!9566 (_1!9444 lt!321206)) (currentByte!9571 (_1!9444 lt!321206)) (size!4557 (buf!5062 (_1!9444 lt!321206))))))

(assert (=> d!70133 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!321206))) (currentByte!9571 (_1!9444 lt!321206)) (currentBit!9566 (_1!9444 lt!321206))) lt!322094)))

(declare-fun b!205969 () Bool)

(declare-fun res!172661 () Bool)

(assert (=> b!205969 (=> (not res!172661) (not e!140872))))

(assert (=> b!205969 (= res!172661 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!322094))))

(declare-fun b!205970 () Bool)

(declare-fun lt!322090 () (_ BitVec 64))

(assert (=> b!205970 (= e!140872 (bvsle lt!322094 (bvmul lt!322090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205970 (or (= lt!322090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!322090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!322090)))))

(assert (=> b!205970 (= lt!322090 ((_ sign_extend 32) (size!4557 (buf!5062 (_1!9444 lt!321206)))))))

(assert (= (and d!70133 res!172662) b!205969))

(assert (= (and b!205969 res!172661) b!205970))

(declare-fun m!317491 () Bool)

(assert (=> d!70133 m!317491))

(declare-fun m!317493 () Bool)

(assert (=> d!70133 m!317493))

(assert (=> b!205641 d!70133))

(declare-fun d!70135 () Bool)

(declare-fun e!140875 () Bool)

(assert (=> d!70135 e!140875))

(declare-fun res!172665 () Bool)

(assert (=> d!70135 (=> (not res!172665) (not e!140875))))

(declare-fun lt!322105 () tuple2!17578)

(declare-fun lt!322104 () tuple2!17578)

(assert (=> d!70135 (= res!172665 (= (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322105))) (currentByte!9571 (_1!9444 lt!322105)) (currentBit!9566 (_1!9444 lt!322105))) (bitIndex!0 (size!4557 (buf!5062 (_1!9444 lt!322104))) (currentByte!9571 (_1!9444 lt!322104)) (currentBit!9566 (_1!9444 lt!322104)))))))

(declare-fun lt!322106 () BitStream!8222)

(declare-fun lt!322107 () Unit!14671)

(declare-fun choose!50 (BitStream!8222 BitStream!8222 BitStream!8222 tuple2!17578 tuple2!17578 BitStream!8222 Bool tuple2!17578 tuple2!17578 BitStream!8222 Bool) Unit!14671)

(assert (=> d!70135 (= lt!322107 (choose!50 lt!321202 (_2!9443 lt!321197) lt!322106 lt!322105 (tuple2!17579 (_1!9444 lt!322105) (_2!9444 lt!322105)) (_1!9444 lt!322105) (_2!9444 lt!322105) lt!322104 (tuple2!17579 (_1!9444 lt!322104) (_2!9444 lt!322104)) (_1!9444 lt!322104) (_2!9444 lt!322104)))))

(assert (=> d!70135 (= lt!322104 (readBitPure!0 lt!322106))))

(assert (=> d!70135 (= lt!322105 (readBitPure!0 lt!321202))))

(assert (=> d!70135 (= lt!322106 (BitStream!8223 (buf!5062 (_2!9443 lt!321197)) (currentByte!9571 lt!321202) (currentBit!9566 lt!321202)))))

(assert (=> d!70135 (invariant!0 (currentBit!9566 lt!321202) (currentByte!9571 lt!321202) (size!4557 (buf!5062 (_2!9443 lt!321197))))))

(assert (=> d!70135 (= (readBitPrefixLemma!0 lt!321202 (_2!9443 lt!321197)) lt!322107)))

(declare-fun b!205973 () Bool)

(assert (=> b!205973 (= e!140875 (= (_2!9444 lt!322105) (_2!9444 lt!322104)))))

(assert (= (and d!70135 res!172665) b!205973))

(declare-fun m!317495 () Bool)

