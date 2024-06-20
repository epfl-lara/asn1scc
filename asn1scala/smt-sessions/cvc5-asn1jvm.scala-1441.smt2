; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39596 () Bool)

(assert start!39596)

(declare-fun b!178354 () Bool)

(declare-fun e!124213 () Bool)

(declare-fun e!124214 () Bool)

(assert (=> b!178354 (= e!124213 (not e!124214))))

(declare-fun res!147907 () Bool)

(assert (=> b!178354 (=> res!147907 e!124214)))

(declare-fun lt!274078 () (_ BitVec 64))

(declare-fun lt!274073 () (_ BitVec 64))

(assert (=> b!178354 (= res!147907 (not (= lt!274078 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274073))))))

(declare-datatypes ((array!9611 0))(
  ( (array!9612 (arr!5167 (Array (_ BitVec 32) (_ BitVec 8))) (size!4237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7582 0))(
  ( (BitStream!7583 (buf!4680 array!9611) (currentByte!8878 (_ BitVec 32)) (currentBit!8873 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12854 0))(
  ( (Unit!12855) )
))
(declare-datatypes ((tuple2!15380 0))(
  ( (tuple2!15381 (_1!8335 Unit!12854) (_2!8335 BitStream!7582)) )
))
(declare-fun lt!274081 () tuple2!15380)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178354 (= lt!274078 (bitIndex!0 (size!4237 (buf!4680 (_2!8335 lt!274081))) (currentByte!8878 (_2!8335 lt!274081)) (currentBit!8873 (_2!8335 lt!274081))))))

(declare-fun thiss!1204 () BitStream!7582)

(assert (=> b!178354 (= lt!274073 (bitIndex!0 (size!4237 (buf!4680 thiss!1204)) (currentByte!8878 thiss!1204) (currentBit!8873 thiss!1204)))))

(declare-fun e!124219 () Bool)

(assert (=> b!178354 e!124219))

(declare-fun res!147906 () Bool)

(assert (=> b!178354 (=> (not res!147906) (not e!124219))))

(assert (=> b!178354 (= res!147906 (= (size!4237 (buf!4680 thiss!1204)) (size!4237 (buf!4680 (_2!8335 lt!274081)))))))

(declare-fun lt!274075 () Bool)

(declare-fun appendBit!0 (BitStream!7582 Bool) tuple2!15380)

(assert (=> b!178354 (= lt!274081 (appendBit!0 thiss!1204 lt!274075))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!178354 (= lt!274075 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178355 () Bool)

(declare-fun e!124215 () Bool)

(assert (=> b!178355 (= e!124215 true)))

(declare-datatypes ((tuple2!15382 0))(
  ( (tuple2!15383 (_1!8336 BitStream!7582) (_2!8336 Bool)) )
))
(declare-fun lt!274076 () tuple2!15382)

(declare-fun lt!274080 () tuple2!15380)

(declare-fun readBitPure!0 (BitStream!7582) tuple2!15382)

(assert (=> b!178355 (= lt!274076 (readBitPure!0 (BitStream!7583 (buf!4680 (_2!8335 lt!274080)) (currentByte!8878 thiss!1204) (currentBit!8873 thiss!1204))))))

(declare-fun lt!274079 () tuple2!15382)

(assert (=> b!178355 (= lt!274079 (readBitPure!0 (BitStream!7583 (buf!4680 (_2!8335 lt!274081)) (currentByte!8878 thiss!1204) (currentBit!8873 thiss!1204))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178355 (invariant!0 (currentBit!8873 thiss!1204) (currentByte!8878 thiss!1204) (size!4237 (buf!4680 (_2!8335 lt!274080))))))

(declare-fun b!178356 () Bool)

(declare-fun res!147913 () Bool)

(declare-fun e!124216 () Bool)

(assert (=> b!178356 (=> res!147913 e!124216)))

(declare-fun isPrefixOf!0 (BitStream!7582 BitStream!7582) Bool)

(assert (=> b!178356 (= res!147913 (not (isPrefixOf!0 thiss!1204 (_2!8335 lt!274081))))))

(declare-fun res!147902 () Bool)

(assert (=> start!39596 (=> (not res!147902) (not e!124213))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39596 (= res!147902 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39596 e!124213))

(assert (=> start!39596 true))

(declare-fun e!124211 () Bool)

(declare-fun inv!12 (BitStream!7582) Bool)

(assert (=> start!39596 (and (inv!12 thiss!1204) e!124211)))

(declare-fun b!178357 () Bool)

(declare-fun res!147914 () Bool)

(declare-fun e!124212 () Bool)

(assert (=> b!178357 (=> (not res!147914) (not e!124212))))

(assert (=> b!178357 (= res!147914 (isPrefixOf!0 thiss!1204 (_2!8335 lt!274081)))))

(declare-fun b!178358 () Bool)

(declare-fun res!147915 () Bool)

(assert (=> b!178358 (=> res!147915 e!124215)))

(declare-fun arrayBitRangesEq!0 (array!9611 array!9611 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178358 (= res!147915 (not (arrayBitRangesEq!0 (buf!4680 (_2!8335 lt!274081)) (buf!4680 (_2!8335 lt!274080)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4237 (buf!4680 (_2!8335 lt!274081))) (currentByte!8878 thiss!1204) (currentBit!8873 thiss!1204))))))))

(declare-fun b!178359 () Bool)

(declare-fun res!147911 () Bool)

(assert (=> b!178359 (=> res!147911 e!124216)))

(assert (=> b!178359 (= res!147911 (not (isPrefixOf!0 (_2!8335 lt!274081) (_2!8335 lt!274080))))))

(declare-fun b!178360 () Bool)

(declare-fun res!147903 () Bool)

(assert (=> b!178360 (=> (not res!147903) (not e!124213))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178360 (= res!147903 (validate_offset_bits!1 ((_ sign_extend 32) (size!4237 (buf!4680 thiss!1204))) ((_ sign_extend 32) (currentByte!8878 thiss!1204)) ((_ sign_extend 32) (currentBit!8873 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178361 () Bool)

(assert (=> b!178361 (= e!124214 e!124216)))

(declare-fun res!147899 () Bool)

(assert (=> b!178361 (=> res!147899 e!124216)))

(declare-fun lt!274077 () (_ BitVec 64))

(assert (=> b!178361 (= res!147899 (not (= lt!274077 (bvsub (bvsub (bvadd lt!274078 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178361 (= lt!274077 (bitIndex!0 (size!4237 (buf!4680 (_2!8335 lt!274080))) (currentByte!8878 (_2!8335 lt!274080)) (currentBit!8873 (_2!8335 lt!274080))))))

(assert (=> b!178361 (isPrefixOf!0 thiss!1204 (_2!8335 lt!274080))))

(declare-fun lt!274072 () Unit!12854)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7582 BitStream!7582 BitStream!7582) Unit!12854)

(assert (=> b!178361 (= lt!274072 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8335 lt!274081) (_2!8335 lt!274080)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7582 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15380)

(assert (=> b!178361 (= lt!274080 (appendBitsLSBFirstLoopTR!0 (_2!8335 lt!274081) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178362 () Bool)

(declare-fun e!124217 () Bool)

(declare-fun lt!274082 () tuple2!15382)

(declare-fun lt!274071 () (_ BitVec 64))

(assert (=> b!178362 (= e!124217 (= (bitIndex!0 (size!4237 (buf!4680 (_1!8336 lt!274082))) (currentByte!8878 (_1!8336 lt!274082)) (currentBit!8873 (_1!8336 lt!274082))) lt!274071))))

(declare-fun b!178363 () Bool)

(declare-fun res!147910 () Bool)

(assert (=> b!178363 (=> res!147910 e!124216)))

(assert (=> b!178363 (= res!147910 (or (not (= (size!4237 (buf!4680 (_2!8335 lt!274080))) (size!4237 (buf!4680 thiss!1204)))) (not (= lt!274077 (bvsub (bvadd lt!274073 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178364 () Bool)

(assert (=> b!178364 (= e!124212 e!124217)))

(declare-fun res!147904 () Bool)

(assert (=> b!178364 (=> (not res!147904) (not e!124217))))

(assert (=> b!178364 (= res!147904 (and (= (_2!8336 lt!274082) lt!274075) (= (_1!8336 lt!274082) (_2!8335 lt!274081))))))

(declare-fun readerFrom!0 (BitStream!7582 (_ BitVec 32) (_ BitVec 32)) BitStream!7582)

(assert (=> b!178364 (= lt!274082 (readBitPure!0 (readerFrom!0 (_2!8335 lt!274081) (currentBit!8873 thiss!1204) (currentByte!8878 thiss!1204))))))

(declare-fun b!178365 () Bool)

(assert (=> b!178365 (= e!124219 e!124212)))

(declare-fun res!147900 () Bool)

(assert (=> b!178365 (=> (not res!147900) (not e!124212))))

(declare-fun lt!274074 () (_ BitVec 64))

(assert (=> b!178365 (= res!147900 (= lt!274071 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274074)))))

(assert (=> b!178365 (= lt!274071 (bitIndex!0 (size!4237 (buf!4680 (_2!8335 lt!274081))) (currentByte!8878 (_2!8335 lt!274081)) (currentBit!8873 (_2!8335 lt!274081))))))

(assert (=> b!178365 (= lt!274074 (bitIndex!0 (size!4237 (buf!4680 thiss!1204)) (currentByte!8878 thiss!1204) (currentBit!8873 thiss!1204)))))

(declare-fun b!178366 () Bool)

(declare-fun res!147909 () Bool)

(assert (=> b!178366 (=> (not res!147909) (not e!124213))))

(assert (=> b!178366 (= res!147909 (not (= i!590 nBits!348)))))

(declare-fun b!178367 () Bool)

(declare-fun res!147905 () Bool)

(assert (=> b!178367 (=> res!147905 e!124216)))

(assert (=> b!178367 (= res!147905 (not (invariant!0 (currentBit!8873 (_2!8335 lt!274080)) (currentByte!8878 (_2!8335 lt!274080)) (size!4237 (buf!4680 (_2!8335 lt!274080))))))))

(declare-fun b!178368 () Bool)

(assert (=> b!178368 (= e!124216 e!124215)))

(declare-fun res!147912 () Bool)

(assert (=> b!178368 (=> res!147912 e!124215)))

(assert (=> b!178368 (= res!147912 (not (= (size!4237 (buf!4680 (_2!8335 lt!274081))) (size!4237 (buf!4680 (_2!8335 lt!274080))))))))

(assert (=> b!178368 (invariant!0 (currentBit!8873 thiss!1204) (currentByte!8878 thiss!1204) (size!4237 (buf!4680 (_2!8335 lt!274081))))))

(declare-fun b!178369 () Bool)

(declare-fun res!147908 () Bool)

(assert (=> b!178369 (=> res!147908 e!124215)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178369 (= res!147908 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4237 (buf!4680 (_2!8335 lt!274081)))) ((_ sign_extend 32) (currentByte!8878 thiss!1204)) ((_ sign_extend 32) (currentBit!8873 thiss!1204)))))))

(declare-fun b!178370 () Bool)

(declare-fun array_inv!3978 (array!9611) Bool)

(assert (=> b!178370 (= e!124211 (array_inv!3978 (buf!4680 thiss!1204)))))

(declare-fun b!178371 () Bool)

(declare-fun res!147901 () Bool)

(assert (=> b!178371 (=> (not res!147901) (not e!124213))))

(assert (=> b!178371 (= res!147901 (invariant!0 (currentBit!8873 thiss!1204) (currentByte!8878 thiss!1204) (size!4237 (buf!4680 thiss!1204))))))

(assert (= (and start!39596 res!147902) b!178360))

(assert (= (and b!178360 res!147903) b!178371))

(assert (= (and b!178371 res!147901) b!178366))

(assert (= (and b!178366 res!147909) b!178354))

(assert (= (and b!178354 res!147906) b!178365))

(assert (= (and b!178365 res!147900) b!178357))

(assert (= (and b!178357 res!147914) b!178364))

(assert (= (and b!178364 res!147904) b!178362))

(assert (= (and b!178354 (not res!147907)) b!178361))

(assert (= (and b!178361 (not res!147899)) b!178367))

(assert (= (and b!178367 (not res!147905)) b!178363))

(assert (= (and b!178363 (not res!147910)) b!178359))

(assert (= (and b!178359 (not res!147911)) b!178356))

(assert (= (and b!178356 (not res!147913)) b!178368))

(assert (= (and b!178368 (not res!147912)) b!178369))

(assert (= (and b!178369 (not res!147908)) b!178358))

(assert (= (and b!178358 (not res!147915)) b!178355))

(assert (= start!39596 b!178370))

(declare-fun m!278491 () Bool)

(assert (=> b!178359 m!278491))

(declare-fun m!278493 () Bool)

(assert (=> b!178369 m!278493))

(declare-fun m!278495 () Bool)

(assert (=> b!178358 m!278495))

(declare-fun m!278497 () Bool)

(assert (=> b!178358 m!278497))

(declare-fun m!278499 () Bool)

(assert (=> b!178367 m!278499))

(declare-fun m!278501 () Bool)

(assert (=> start!39596 m!278501))

(declare-fun m!278503 () Bool)

(assert (=> b!178354 m!278503))

(declare-fun m!278505 () Bool)

(assert (=> b!178354 m!278505))

(declare-fun m!278507 () Bool)

(assert (=> b!178354 m!278507))

(declare-fun m!278509 () Bool)

(assert (=> b!178362 m!278509))

(declare-fun m!278511 () Bool)

(assert (=> b!178355 m!278511))

(declare-fun m!278513 () Bool)

(assert (=> b!178355 m!278513))

(declare-fun m!278515 () Bool)

(assert (=> b!178355 m!278515))

(declare-fun m!278517 () Bool)

(assert (=> b!178368 m!278517))

(declare-fun m!278519 () Bool)

(assert (=> b!178361 m!278519))

(declare-fun m!278521 () Bool)

(assert (=> b!178361 m!278521))

(declare-fun m!278523 () Bool)

(assert (=> b!178361 m!278523))

(declare-fun m!278525 () Bool)

(assert (=> b!178361 m!278525))

(declare-fun m!278527 () Bool)

(assert (=> b!178357 m!278527))

(assert (=> b!178356 m!278527))

(declare-fun m!278529 () Bool)

(assert (=> b!178371 m!278529))

(declare-fun m!278531 () Bool)

(assert (=> b!178364 m!278531))

(assert (=> b!178364 m!278531))

(declare-fun m!278533 () Bool)

(assert (=> b!178364 m!278533))

(declare-fun m!278535 () Bool)

(assert (=> b!178360 m!278535))

(assert (=> b!178365 m!278503))

(assert (=> b!178365 m!278505))

(declare-fun m!278537 () Bool)

(assert (=> b!178370 m!278537))

(push 1)

(assert (not b!178369))

(assert (not b!178362))

(assert (not b!178355))

(assert (not b!178364))

(assert (not b!178370))

(assert (not b!178354))

(assert (not b!178357))

(assert (not start!39596))

(assert (not b!178359))

(assert (not b!178361))

(assert (not b!178371))

(assert (not b!178358))

(assert (not b!178367))

(assert (not b!178365))

(assert (not b!178368))

(assert (not b!178360))

(assert (not b!178356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

