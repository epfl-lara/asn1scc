; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22860 () Bool)

(assert start!22860)

(declare-fun b!115418 () Bool)

(declare-fun e!75651 () Bool)

(declare-datatypes ((array!5205 0))(
  ( (array!5206 (arr!2954 (Array (_ BitVec 32) (_ BitVec 8))) (size!2361 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4196 0))(
  ( (BitStream!4197 (buf!2771 array!5205) (currentByte!5399 (_ BitVec 32)) (currentBit!5394 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9502 0))(
  ( (tuple2!9503 (_1!5016 BitStream!4196) (_2!5016 Bool)) )
))
(declare-fun lt!176200 () tuple2!9502)

(declare-fun lt!176195 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115418 (= e!75651 (= (bitIndex!0 (size!2361 (buf!2771 (_1!5016 lt!176200))) (currentByte!5399 (_1!5016 lt!176200)) (currentBit!5394 (_1!5016 lt!176200))) lt!176195))))

(declare-fun b!115419 () Bool)

(declare-fun res!95373 () Bool)

(declare-fun e!75648 () Bool)

(assert (=> b!115419 (=> (not res!95373) (not e!75648))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!115419 (= res!95373 (bvslt i!615 nBits!396))))

(declare-fun b!115420 () Bool)

(declare-fun res!95377 () Bool)

(declare-fun e!75644 () Bool)

(assert (=> b!115420 (=> (not res!95377) (not e!75644))))

(declare-fun thiss!1305 () BitStream!4196)

(declare-datatypes ((Unit!7103 0))(
  ( (Unit!7104) )
))
(declare-datatypes ((tuple2!9504 0))(
  ( (tuple2!9505 (_1!5017 Unit!7103) (_2!5017 BitStream!4196)) )
))
(declare-fun lt!176196 () tuple2!9504)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115420 (= res!95377 (invariant!0 (currentBit!5394 thiss!1305) (currentByte!5399 thiss!1305) (size!2361 (buf!2771 (_2!5017 lt!176196)))))))

(declare-fun b!115421 () Bool)

(assert (=> b!115421 (= e!75648 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9506 0))(
  ( (tuple2!9507 (_1!5018 BitStream!4196) (_2!5018 BitStream!4196)) )
))
(declare-fun lt!176199 () tuple2!9506)

(declare-fun lt!176204 () Bool)

(declare-fun readBitPure!0 (BitStream!4196) tuple2!9502)

(assert (=> b!115421 (= (_2!5016 (readBitPure!0 (_1!5018 lt!176199))) lt!176204)))

(declare-fun lt!176198 () tuple2!9506)

(declare-fun lt!176197 () tuple2!9504)

(declare-fun reader!0 (BitStream!4196 BitStream!4196) tuple2!9506)

(assert (=> b!115421 (= lt!176198 (reader!0 (_2!5017 lt!176196) (_2!5017 lt!176197)))))

(assert (=> b!115421 (= lt!176199 (reader!0 thiss!1305 (_2!5017 lt!176197)))))

(declare-fun e!75649 () Bool)

(assert (=> b!115421 e!75649))

(declare-fun res!95374 () Bool)

(assert (=> b!115421 (=> (not res!95374) (not e!75649))))

(declare-fun lt!176202 () tuple2!9502)

(declare-fun lt!176194 () tuple2!9502)

(assert (=> b!115421 (= res!95374 (= (bitIndex!0 (size!2361 (buf!2771 (_1!5016 lt!176202))) (currentByte!5399 (_1!5016 lt!176202)) (currentBit!5394 (_1!5016 lt!176202))) (bitIndex!0 (size!2361 (buf!2771 (_1!5016 lt!176194))) (currentByte!5399 (_1!5016 lt!176194)) (currentBit!5394 (_1!5016 lt!176194)))))))

(declare-fun lt!176205 () Unit!7103)

(declare-fun lt!176201 () BitStream!4196)

(declare-fun readBitPrefixLemma!0 (BitStream!4196 BitStream!4196) Unit!7103)

(assert (=> b!115421 (= lt!176205 (readBitPrefixLemma!0 lt!176201 (_2!5017 lt!176197)))))

(assert (=> b!115421 (= lt!176194 (readBitPure!0 (BitStream!4197 (buf!2771 (_2!5017 lt!176197)) (currentByte!5399 thiss!1305) (currentBit!5394 thiss!1305))))))

(assert (=> b!115421 (= lt!176202 (readBitPure!0 lt!176201))))

(assert (=> b!115421 (= lt!176201 (BitStream!4197 (buf!2771 (_2!5017 lt!176196)) (currentByte!5399 thiss!1305) (currentBit!5394 thiss!1305)))))

(assert (=> b!115421 e!75644))

(declare-fun res!95371 () Bool)

(assert (=> b!115421 (=> (not res!95371) (not e!75644))))

(declare-fun isPrefixOf!0 (BitStream!4196 BitStream!4196) Bool)

(assert (=> b!115421 (= res!95371 (isPrefixOf!0 thiss!1305 (_2!5017 lt!176197)))))

(declare-fun lt!176203 () Unit!7103)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4196 BitStream!4196 BitStream!4196) Unit!7103)

(assert (=> b!115421 (= lt!176203 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5017 lt!176196) (_2!5017 lt!176197)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4196 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9504)

(assert (=> b!115421 (= lt!176197 (appendNLeastSignificantBitsLoop!0 (_2!5017 lt!176196) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75646 () Bool)

(assert (=> b!115421 e!75646))

(declare-fun res!95376 () Bool)

(assert (=> b!115421 (=> (not res!95376) (not e!75646))))

(assert (=> b!115421 (= res!95376 (= (size!2361 (buf!2771 thiss!1305)) (size!2361 (buf!2771 (_2!5017 lt!176196)))))))

(declare-fun appendBit!0 (BitStream!4196 Bool) tuple2!9504)

(assert (=> b!115421 (= lt!176196 (appendBit!0 thiss!1305 lt!176204))))

(assert (=> b!115421 (= lt!176204 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115422 () Bool)

(declare-fun res!95378 () Bool)

(assert (=> b!115422 (=> (not res!95378) (not e!75648))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115422 (= res!95378 (validate_offset_bits!1 ((_ sign_extend 32) (size!2361 (buf!2771 thiss!1305))) ((_ sign_extend 32) (currentByte!5399 thiss!1305)) ((_ sign_extend 32) (currentBit!5394 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115423 () Bool)

(declare-fun res!95375 () Bool)

(declare-fun e!75650 () Bool)

(assert (=> b!115423 (=> (not res!95375) (not e!75650))))

(assert (=> b!115423 (= res!95375 (isPrefixOf!0 thiss!1305 (_2!5017 lt!176196)))))

(declare-fun b!115425 () Bool)

(declare-fun res!95370 () Bool)

(assert (=> b!115425 (=> (not res!95370) (not e!75648))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115425 (= res!95370 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115426 () Bool)

(assert (=> b!115426 (= e!75644 (invariant!0 (currentBit!5394 thiss!1305) (currentByte!5399 thiss!1305) (size!2361 (buf!2771 (_2!5017 lt!176197)))))))

(declare-fun b!115427 () Bool)

(assert (=> b!115427 (= e!75646 e!75650)))

(declare-fun res!95369 () Bool)

(assert (=> b!115427 (=> (not res!95369) (not e!75650))))

(declare-fun lt!176193 () (_ BitVec 64))

(assert (=> b!115427 (= res!95369 (= lt!176195 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176193)))))

(assert (=> b!115427 (= lt!176195 (bitIndex!0 (size!2361 (buf!2771 (_2!5017 lt!176196))) (currentByte!5399 (_2!5017 lt!176196)) (currentBit!5394 (_2!5017 lt!176196))))))

(assert (=> b!115427 (= lt!176193 (bitIndex!0 (size!2361 (buf!2771 thiss!1305)) (currentByte!5399 thiss!1305) (currentBit!5394 thiss!1305)))))

(declare-fun b!115428 () Bool)

(declare-fun e!75645 () Bool)

(declare-fun array_inv!2163 (array!5205) Bool)

(assert (=> b!115428 (= e!75645 (array_inv!2163 (buf!2771 thiss!1305)))))

(declare-fun b!115429 () Bool)

(assert (=> b!115429 (= e!75649 (= (_2!5016 lt!176202) (_2!5016 lt!176194)))))

(declare-fun b!115424 () Bool)

(assert (=> b!115424 (= e!75650 e!75651)))

(declare-fun res!95379 () Bool)

(assert (=> b!115424 (=> (not res!95379) (not e!75651))))

(assert (=> b!115424 (= res!95379 (and (= (_2!5016 lt!176200) lt!176204) (= (_1!5016 lt!176200) (_2!5017 lt!176196))))))

(declare-fun readerFrom!0 (BitStream!4196 (_ BitVec 32) (_ BitVec 32)) BitStream!4196)

(assert (=> b!115424 (= lt!176200 (readBitPure!0 (readerFrom!0 (_2!5017 lt!176196) (currentBit!5394 thiss!1305) (currentByte!5399 thiss!1305))))))

(declare-fun res!95372 () Bool)

(assert (=> start!22860 (=> (not res!95372) (not e!75648))))

(assert (=> start!22860 (= res!95372 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22860 e!75648))

(assert (=> start!22860 true))

(declare-fun inv!12 (BitStream!4196) Bool)

(assert (=> start!22860 (and (inv!12 thiss!1305) e!75645)))

(assert (= (and start!22860 res!95372) b!115422))

(assert (= (and b!115422 res!95378) b!115425))

(assert (= (and b!115425 res!95370) b!115419))

(assert (= (and b!115419 res!95373) b!115421))

(assert (= (and b!115421 res!95376) b!115427))

(assert (= (and b!115427 res!95369) b!115423))

(assert (= (and b!115423 res!95375) b!115424))

(assert (= (and b!115424 res!95379) b!115418))

(assert (= (and b!115421 res!95371) b!115420))

(assert (= (and b!115420 res!95377) b!115426))

(assert (= (and b!115421 res!95374) b!115429))

(assert (= start!22860 b!115428))

(declare-fun m!172763 () Bool)

(assert (=> b!115420 m!172763))

(declare-fun m!172765 () Bool)

(assert (=> b!115428 m!172765))

(declare-fun m!172767 () Bool)

(assert (=> b!115424 m!172767))

(assert (=> b!115424 m!172767))

(declare-fun m!172769 () Bool)

(assert (=> b!115424 m!172769))

(declare-fun m!172771 () Bool)

(assert (=> b!115425 m!172771))

(declare-fun m!172773 () Bool)

(assert (=> b!115422 m!172773))

(declare-fun m!172775 () Bool)

(assert (=> b!115427 m!172775))

(declare-fun m!172777 () Bool)

(assert (=> b!115427 m!172777))

(declare-fun m!172779 () Bool)

(assert (=> b!115421 m!172779))

(declare-fun m!172781 () Bool)

(assert (=> b!115421 m!172781))

(declare-fun m!172783 () Bool)

(assert (=> b!115421 m!172783))

(declare-fun m!172785 () Bool)

(assert (=> b!115421 m!172785))

(declare-fun m!172787 () Bool)

(assert (=> b!115421 m!172787))

(declare-fun m!172789 () Bool)

(assert (=> b!115421 m!172789))

(declare-fun m!172791 () Bool)

(assert (=> b!115421 m!172791))

(declare-fun m!172793 () Bool)

(assert (=> b!115421 m!172793))

(declare-fun m!172795 () Bool)

(assert (=> b!115421 m!172795))

(declare-fun m!172797 () Bool)

(assert (=> b!115421 m!172797))

(declare-fun m!172799 () Bool)

(assert (=> b!115421 m!172799))

(declare-fun m!172801 () Bool)

(assert (=> b!115421 m!172801))

(declare-fun m!172803 () Bool)

(assert (=> b!115423 m!172803))

(declare-fun m!172805 () Bool)

(assert (=> b!115426 m!172805))

(declare-fun m!172807 () Bool)

(assert (=> b!115418 m!172807))

(declare-fun m!172809 () Bool)

(assert (=> start!22860 m!172809))

(push 1)

(assert (not start!22860))

(assert (not b!115427))

(assert (not b!115428))

(assert (not b!115423))

(assert (not b!115421))

(assert (not b!115418))

(assert (not b!115425))

(assert (not b!115422))

(assert (not b!115424))

(assert (not b!115420))

(assert (not b!115426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

