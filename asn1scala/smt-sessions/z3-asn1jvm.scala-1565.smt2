; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44090 () Bool)

(assert start!44090)

(declare-fun b!210070 () Bool)

(declare-fun res!176377 () Bool)

(declare-fun e!143355 () Bool)

(assert (=> b!210070 (=> (not res!176377) (not e!143355))))

(declare-datatypes ((array!10483 0))(
  ( (array!10484 (arr!5537 (Array (_ BitVec 32) (_ BitVec 8))) (size!4607 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8322 0))(
  ( (BitStream!8323 (buf!5124 array!10483) (currentByte!9666 (_ BitVec 32)) (currentBit!9661 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8322)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210070 (= res!176377 (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204))))))

(declare-fun b!210071 () Bool)

(declare-fun res!176367 () Bool)

(declare-fun e!143350 () Bool)

(assert (=> b!210071 (=> (not res!176367) (not e!143350))))

(declare-datatypes ((Unit!14964 0))(
  ( (Unit!14965) )
))
(declare-datatypes ((tuple2!18010 0))(
  ( (tuple2!18011 (_1!9660 Unit!14964) (_2!9660 BitStream!8322)) )
))
(declare-fun lt!329398 () tuple2!18010)

(declare-fun isPrefixOf!0 (BitStream!8322 BitStream!8322) Bool)

(assert (=> b!210071 (= res!176367 (isPrefixOf!0 thiss!1204 (_2!9660 lt!329398)))))

(declare-fun b!210072 () Bool)

(declare-fun e!143347 () Bool)

(assert (=> b!210072 (= e!143347 e!143350)))

(declare-fun res!176374 () Bool)

(assert (=> b!210072 (=> (not res!176374) (not e!143350))))

(declare-fun lt!329396 () (_ BitVec 64))

(declare-fun lt!329407 () (_ BitVec 64))

(assert (=> b!210072 (= res!176374 (= lt!329396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329407)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210072 (= lt!329396 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(assert (=> b!210072 (= lt!329407 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(declare-fun b!210073 () Bool)

(declare-fun res!176370 () Bool)

(declare-fun e!143349 () Bool)

(assert (=> b!210073 (=> res!176370 e!143349)))

(declare-fun lt!329411 () tuple2!18010)

(assert (=> b!210073 (= res!176370 (not (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!329411))))))

(declare-fun b!210074 () Bool)

(declare-fun e!143348 () Bool)

(assert (=> b!210074 (= e!143348 (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329411)))))))

(declare-fun b!210075 () Bool)

(declare-fun res!176369 () Bool)

(assert (=> b!210075 (=> res!176369 e!143349)))

(declare-fun lt!329413 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!329414 () (_ BitVec 64))

(assert (=> b!210075 (= res!176369 (or (not (= (size!4607 (buf!5124 (_2!9660 lt!329411))) (size!4607 (buf!5124 thiss!1204)))) (not (= lt!329414 (bvsub (bvadd lt!329413 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!210076 () Bool)

(declare-fun e!143358 () Bool)

(declare-datatypes ((tuple2!18012 0))(
  ( (tuple2!18013 (_1!9661 BitStream!8322) (_2!9661 Bool)) )
))
(declare-fun lt!329393 () tuple2!18012)

(assert (=> b!210076 (= e!143358 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329393))) (currentByte!9666 (_1!9661 lt!329393)) (currentBit!9661 (_1!9661 lt!329393))) lt!329396))))

(declare-fun b!210077 () Bool)

(declare-fun res!176365 () Bool)

(assert (=> b!210077 (=> (not res!176365) (not e!143355))))

(assert (=> b!210077 (= res!176365 (not (= i!590 nBits!348)))))

(declare-fun b!210078 () Bool)

(declare-fun e!143353 () Bool)

(declare-fun lt!329403 () tuple2!18012)

(declare-fun lt!329395 () tuple2!18012)

(assert (=> b!210078 (= e!143353 (= (_2!9661 lt!329403) (_2!9661 lt!329395)))))

(declare-fun res!176380 () Bool)

(declare-fun e!143357 () Bool)

(assert (=> start!44090 (=> (not res!176380) (not e!143357))))

(assert (=> start!44090 (= res!176380 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44090 e!143357))

(assert (=> start!44090 true))

(declare-fun e!143356 () Bool)

(declare-fun inv!12 (BitStream!8322) Bool)

(assert (=> start!44090 (and (inv!12 thiss!1204) e!143356)))

(declare-fun b!210079 () Bool)

(declare-fun e!143354 () Bool)

(assert (=> b!210079 (= e!143355 (not e!143354))))

(declare-fun res!176371 () Bool)

(assert (=> b!210079 (=> res!176371 e!143354)))

(declare-fun lt!329392 () (_ BitVec 64))

(assert (=> b!210079 (= res!176371 (not (= lt!329392 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329413))))))

(assert (=> b!210079 (= lt!329392 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(assert (=> b!210079 (= lt!329413 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(assert (=> b!210079 e!143347))

(declare-fun res!176372 () Bool)

(assert (=> b!210079 (=> (not res!176372) (not e!143347))))

(assert (=> b!210079 (= res!176372 (= (size!4607 (buf!5124 thiss!1204)) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(declare-fun lt!329397 () Bool)

(declare-fun appendBit!0 (BitStream!8322 Bool) tuple2!18010)

(assert (=> b!210079 (= lt!329398 (appendBit!0 thiss!1204 lt!329397))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!329389 () (_ BitVec 64))

(assert (=> b!210079 (= lt!329397 (not (= (bvand v!189 lt!329389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210079 (= lt!329389 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!210080 () Bool)

(declare-fun res!176373 () Bool)

(assert (=> b!210080 (=> res!176373 e!143349)))

(assert (=> b!210080 (= res!176373 (not (invariant!0 (currentBit!9661 (_2!9660 lt!329411)) (currentByte!9666 (_2!9660 lt!329411)) (size!4607 (buf!5124 (_2!9660 lt!329411))))))))

(declare-fun b!210081 () Bool)

(assert (=> b!210081 (= e!143357 e!143355)))

(declare-fun res!176375 () Bool)

(assert (=> b!210081 (=> (not res!176375) (not e!143355))))

(declare-fun lt!329404 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210081 (= res!176375 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)) lt!329404))))

(assert (=> b!210081 (= lt!329404 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210082 () Bool)

(assert (=> b!210082 (= e!143354 e!143349)))

(declare-fun res!176378 () Bool)

(assert (=> b!210082 (=> res!176378 e!143349)))

(assert (=> b!210082 (= res!176378 (not (= lt!329414 (bvsub (bvsub (bvadd lt!329392 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!210082 (= lt!329414 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411))))))

(assert (=> b!210082 (isPrefixOf!0 thiss!1204 (_2!9660 lt!329411))))

(declare-fun lt!329405 () Unit!14964)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8322 BitStream!8322 BitStream!8322) Unit!14964)

(assert (=> b!210082 (= lt!329405 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9660 lt!329398) (_2!9660 lt!329411)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18010)

(assert (=> b!210082 (= lt!329411 (appendBitsLSBFirstLoopTR!0 (_2!9660 lt!329398) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!210083 () Bool)

(declare-fun array_inv!4348 (array!10483) Bool)

(assert (=> b!210083 (= e!143356 (array_inv!4348 (buf!5124 thiss!1204)))))

(declare-fun b!210084 () Bool)

(declare-fun res!176376 () Bool)

(assert (=> b!210084 (=> res!176376 e!143349)))

(assert (=> b!210084 (= res!176376 (not (isPrefixOf!0 thiss!1204 (_2!9660 lt!329398))))))

(declare-fun b!210085 () Bool)

(assert (=> b!210085 (= e!143350 e!143358)))

(declare-fun res!176381 () Bool)

(assert (=> b!210085 (=> (not res!176381) (not e!143358))))

(assert (=> b!210085 (= res!176381 (and (= (_2!9661 lt!329393) lt!329397) (= (_1!9661 lt!329393) (_2!9660 lt!329398))))))

(declare-fun readBitPure!0 (BitStream!8322) tuple2!18012)

(declare-fun readerFrom!0 (BitStream!8322 (_ BitVec 32) (_ BitVec 32)) BitStream!8322)

(assert (=> b!210085 (= lt!329393 (readBitPure!0 (readerFrom!0 (_2!9660 lt!329398) (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204))))))

(declare-fun e!143351 () Bool)

(declare-datatypes ((tuple2!18014 0))(
  ( (tuple2!18015 (_1!9662 BitStream!8322) (_2!9662 BitStream!8322)) )
))
(declare-fun lt!329399 () tuple2!18014)

(declare-fun b!210086 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8322 (_ BitVec 64)) BitStream!8322)

(assert (=> b!210086 (= e!143351 (= (_1!9662 lt!329399) (withMovedBitIndex!0 (_2!9662 lt!329399) (bvsub lt!329413 lt!329414))))))

(declare-datatypes ((tuple2!18016 0))(
  ( (tuple2!18017 (_1!9663 BitStream!8322) (_2!9663 (_ BitVec 64))) )
))
(declare-fun lt!329401 () tuple2!18016)

(declare-fun lt!329406 () tuple2!18016)

(assert (=> b!210086 (and (= (_2!9663 lt!329401) (_2!9663 lt!329406)) (= (_1!9663 lt!329401) (_1!9663 lt!329406)))))

(declare-fun lt!329410 () (_ BitVec 64))

(declare-fun lt!329402 () Unit!14964)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14964)

(assert (=> b!210086 (= lt!329402 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410))))

(declare-fun lt!329388 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18016)

(assert (=> b!210086 (= lt!329406 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388))))

(declare-fun b!210087 () Bool)

(assert (=> b!210087 (= e!143349 e!143351)))

(declare-fun res!176368 () Bool)

(assert (=> b!210087 (=> res!176368 e!143351)))

(declare-fun lt!329412 () tuple2!18014)

(assert (=> b!210087 (= res!176368 (not (= (_1!9663 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!329412) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388)) (_2!9662 lt!329412))))))

(declare-fun lt!329400 () (_ BitVec 64))

(assert (=> b!210087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!329400)))

(declare-fun lt!329409 () Unit!14964)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8322 array!10483 (_ BitVec 64)) Unit!14964)

(assert (=> b!210087 (= lt!329409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!329411)) lt!329400))))

(assert (=> b!210087 (= lt!329400 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!329408 () tuple2!18012)

(assert (=> b!210087 (= lt!329388 (bvor lt!329410 (ite (_2!9661 lt!329408) lt!329389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210087 (= lt!329401 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410))))

(assert (=> b!210087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)) lt!329404)))

(declare-fun lt!329391 () Unit!14964)

(assert (=> b!210087 (= lt!329391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5124 (_2!9660 lt!329411)) lt!329404))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210087 (= lt!329410 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!210087 (= (_2!9661 lt!329408) lt!329397)))

(assert (=> b!210087 (= lt!329408 (readBitPure!0 (_1!9662 lt!329399)))))

(declare-fun reader!0 (BitStream!8322 BitStream!8322) tuple2!18014)

(assert (=> b!210087 (= lt!329412 (reader!0 (_2!9660 lt!329398) (_2!9660 lt!329411)))))

(assert (=> b!210087 (= lt!329399 (reader!0 thiss!1204 (_2!9660 lt!329411)))))

(assert (=> b!210087 e!143353))

(declare-fun res!176379 () Bool)

(assert (=> b!210087 (=> (not res!176379) (not e!143353))))

(assert (=> b!210087 (= res!176379 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329403))) (currentByte!9666 (_1!9661 lt!329403)) (currentBit!9661 (_1!9661 lt!329403))) (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329395))) (currentByte!9666 (_1!9661 lt!329395)) (currentBit!9661 (_1!9661 lt!329395)))))))

(declare-fun lt!329394 () Unit!14964)

(declare-fun lt!329390 () BitStream!8322)

(declare-fun readBitPrefixLemma!0 (BitStream!8322 BitStream!8322) Unit!14964)

(assert (=> b!210087 (= lt!329394 (readBitPrefixLemma!0 lt!329390 (_2!9660 lt!329411)))))

(assert (=> b!210087 (= lt!329395 (readBitPure!0 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))))))

(assert (=> b!210087 (= lt!329403 (readBitPure!0 lt!329390))))

(assert (=> b!210087 e!143348))

(declare-fun res!176366 () Bool)

(assert (=> b!210087 (=> (not res!176366) (not e!143348))))

(assert (=> b!210087 (= res!176366 (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (=> b!210087 (= lt!329390 (BitStream!8323 (buf!5124 (_2!9660 lt!329398)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(assert (= (and start!44090 res!176380) b!210081))

(assert (= (and b!210081 res!176375) b!210070))

(assert (= (and b!210070 res!176377) b!210077))

(assert (= (and b!210077 res!176365) b!210079))

(assert (= (and b!210079 res!176372) b!210072))

(assert (= (and b!210072 res!176374) b!210071))

(assert (= (and b!210071 res!176367) b!210085))

(assert (= (and b!210085 res!176381) b!210076))

(assert (= (and b!210079 (not res!176371)) b!210082))

(assert (= (and b!210082 (not res!176378)) b!210080))

(assert (= (and b!210080 (not res!176373)) b!210075))

(assert (= (and b!210075 (not res!176369)) b!210073))

(assert (= (and b!210073 (not res!176370)) b!210084))

(assert (= (and b!210084 (not res!176376)) b!210087))

(assert (= (and b!210087 res!176366) b!210074))

(assert (= (and b!210087 res!176379) b!210078))

(assert (= (and b!210087 (not res!176368)) b!210086))

(assert (= start!44090 b!210083))

(declare-fun m!323359 () Bool)

(assert (=> b!210087 m!323359))

(declare-fun m!323361 () Bool)

(assert (=> b!210087 m!323361))

(declare-fun m!323363 () Bool)

(assert (=> b!210087 m!323363))

(declare-fun m!323365 () Bool)

(assert (=> b!210087 m!323365))

(declare-fun m!323367 () Bool)

(assert (=> b!210087 m!323367))

(declare-fun m!323369 () Bool)

(assert (=> b!210087 m!323369))

(declare-fun m!323371 () Bool)

(assert (=> b!210087 m!323371))

(declare-fun m!323373 () Bool)

(assert (=> b!210087 m!323373))

(declare-fun m!323375 () Bool)

(assert (=> b!210087 m!323375))

(declare-fun m!323377 () Bool)

(assert (=> b!210087 m!323377))

(declare-fun m!323379 () Bool)

(assert (=> b!210087 m!323379))

(declare-fun m!323381 () Bool)

(assert (=> b!210087 m!323381))

(declare-fun m!323383 () Bool)

(assert (=> b!210087 m!323383))

(declare-fun m!323385 () Bool)

(assert (=> b!210087 m!323385))

(declare-fun m!323387 () Bool)

(assert (=> b!210087 m!323387))

(declare-fun m!323389 () Bool)

(assert (=> b!210087 m!323389))

(declare-fun m!323391 () Bool)

(assert (=> b!210081 m!323391))

(declare-fun m!323393 () Bool)

(assert (=> b!210084 m!323393))

(declare-fun m!323395 () Bool)

(assert (=> b!210080 m!323395))

(assert (=> b!210071 m!323393))

(declare-fun m!323397 () Bool)

(assert (=> start!44090 m!323397))

(declare-fun m!323399 () Bool)

(assert (=> b!210083 m!323399))

(declare-fun m!323401 () Bool)

(assert (=> b!210082 m!323401))

(declare-fun m!323403 () Bool)

(assert (=> b!210082 m!323403))

(declare-fun m!323405 () Bool)

(assert (=> b!210082 m!323405))

(declare-fun m!323407 () Bool)

(assert (=> b!210082 m!323407))

(declare-fun m!323409 () Bool)

(assert (=> b!210070 m!323409))

(declare-fun m!323411 () Bool)

(assert (=> b!210074 m!323411))

(declare-fun m!323413 () Bool)

(assert (=> b!210085 m!323413))

(assert (=> b!210085 m!323413))

(declare-fun m!323415 () Bool)

(assert (=> b!210085 m!323415))

(declare-fun m!323417 () Bool)

(assert (=> b!210072 m!323417))

(declare-fun m!323419 () Bool)

(assert (=> b!210072 m!323419))

(assert (=> b!210079 m!323417))

(assert (=> b!210079 m!323419))

(declare-fun m!323421 () Bool)

(assert (=> b!210079 m!323421))

(declare-fun m!323423 () Bool)

(assert (=> b!210086 m!323423))

(declare-fun m!323425 () Bool)

(assert (=> b!210086 m!323425))

(declare-fun m!323427 () Bool)

(assert (=> b!210086 m!323427))

(assert (=> b!210086 m!323427))

(declare-fun m!323429 () Bool)

(assert (=> b!210086 m!323429))

(declare-fun m!323431 () Bool)

(assert (=> b!210073 m!323431))

(declare-fun m!323433 () Bool)

(assert (=> b!210076 m!323433))

(check-sat (not b!210080) (not b!210070) (not start!44090) (not b!210076) (not b!210082) (not b!210086) (not b!210079) (not b!210072) (not b!210071) (not b!210073) (not b!210074) (not b!210083) (not b!210087) (not b!210081) (not b!210084) (not b!210085))
(check-sat)
(get-model)

(declare-fun d!71113 () Bool)

(declare-fun res!176524 () Bool)

(declare-fun e!143453 () Bool)

(assert (=> d!71113 (=> (not res!176524) (not e!143453))))

(assert (=> d!71113 (= res!176524 (= (size!4607 (buf!5124 (_2!9660 lt!329398))) (size!4607 (buf!5124 (_2!9660 lt!329411)))))))

(assert (=> d!71113 (= (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!329411)) e!143453)))

(declare-fun b!210239 () Bool)

(declare-fun res!176523 () Bool)

(assert (=> b!210239 (=> (not res!176523) (not e!143453))))

(assert (=> b!210239 (= res!176523 (bvsle (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411)))))))

(declare-fun b!210240 () Bool)

(declare-fun e!143452 () Bool)

(assert (=> b!210240 (= e!143453 e!143452)))

(declare-fun res!176525 () Bool)

(assert (=> b!210240 (=> res!176525 e!143452)))

(assert (=> b!210240 (= res!176525 (= (size!4607 (buf!5124 (_2!9660 lt!329398))) #b00000000000000000000000000000000))))

(declare-fun b!210241 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10483 array!10483 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210241 (= e!143452 (arrayBitRangesEq!0 (buf!5124 (_2!9660 lt!329398)) (buf!5124 (_2!9660 lt!329411)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398)))))))

(assert (= (and d!71113 res!176524) b!210239))

(assert (= (and b!210239 res!176523) b!210240))

(assert (= (and b!210240 (not res!176525)) b!210241))

(assert (=> b!210239 m!323417))

(assert (=> b!210239 m!323401))

(assert (=> b!210241 m!323417))

(assert (=> b!210241 m!323417))

(declare-fun m!323673 () Bool)

(assert (=> b!210241 m!323673))

(assert (=> b!210073 d!71113))

(declare-fun d!71115 () Bool)

(declare-fun e!143456 () Bool)

(assert (=> d!71115 e!143456))

(declare-fun res!176530 () Bool)

(assert (=> d!71115 (=> (not res!176530) (not e!143456))))

(declare-fun lt!329735 () (_ BitVec 64))

(declare-fun lt!329736 () (_ BitVec 64))

(declare-fun lt!329737 () (_ BitVec 64))

(assert (=> d!71115 (= res!176530 (= lt!329735 (bvsub lt!329736 lt!329737)))))

(assert (=> d!71115 (or (= (bvand lt!329736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329736 lt!329737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71115 (= lt!329737 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329398)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398)))))))

(declare-fun lt!329734 () (_ BitVec 64))

(declare-fun lt!329738 () (_ BitVec 64))

(assert (=> d!71115 (= lt!329736 (bvmul lt!329734 lt!329738))))

(assert (=> d!71115 (or (= lt!329734 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329738 (bvsdiv (bvmul lt!329734 lt!329738) lt!329734)))))

(assert (=> d!71115 (= lt!329738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71115 (= lt!329734 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (=> d!71115 (= lt!329735 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398)))))))

(assert (=> d!71115 (invariant!0 (currentBit!9661 (_2!9660 lt!329398)) (currentByte!9666 (_2!9660 lt!329398)) (size!4607 (buf!5124 (_2!9660 lt!329398))))))

(assert (=> d!71115 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) lt!329735)))

(declare-fun b!210246 () Bool)

(declare-fun res!176531 () Bool)

(assert (=> b!210246 (=> (not res!176531) (not e!143456))))

(assert (=> b!210246 (= res!176531 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329735))))

(declare-fun b!210247 () Bool)

(declare-fun lt!329739 () (_ BitVec 64))

(assert (=> b!210247 (= e!143456 (bvsle lt!329735 (bvmul lt!329739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210247 (or (= lt!329739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329739)))))

(assert (=> b!210247 (= lt!329739 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (= (and d!71115 res!176530) b!210246))

(assert (= (and b!210246 res!176531) b!210247))

(declare-fun m!323675 () Bool)

(assert (=> d!71115 m!323675))

(declare-fun m!323677 () Bool)

(assert (=> d!71115 m!323677))

(assert (=> b!210072 d!71115))

(declare-fun d!71117 () Bool)

(declare-fun e!143457 () Bool)

(assert (=> d!71117 e!143457))

(declare-fun res!176532 () Bool)

(assert (=> d!71117 (=> (not res!176532) (not e!143457))))

(declare-fun lt!329743 () (_ BitVec 64))

(declare-fun lt!329741 () (_ BitVec 64))

(declare-fun lt!329742 () (_ BitVec 64))

(assert (=> d!71117 (= res!176532 (= lt!329741 (bvsub lt!329742 lt!329743)))))

(assert (=> d!71117 (or (= (bvand lt!329742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329742 lt!329743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71117 (= lt!329743 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204))))))

(declare-fun lt!329740 () (_ BitVec 64))

(declare-fun lt!329744 () (_ BitVec 64))

(assert (=> d!71117 (= lt!329742 (bvmul lt!329740 lt!329744))))

(assert (=> d!71117 (or (= lt!329740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329744 (bvsdiv (bvmul lt!329740 lt!329744) lt!329740)))))

(assert (=> d!71117 (= lt!329744 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71117 (= lt!329740 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))))))

(assert (=> d!71117 (= lt!329741 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 thiss!1204))))))

(assert (=> d!71117 (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204)))))

(assert (=> d!71117 (= (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)) lt!329741)))

(declare-fun b!210248 () Bool)

(declare-fun res!176533 () Bool)

(assert (=> b!210248 (=> (not res!176533) (not e!143457))))

(assert (=> b!210248 (= res!176533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329741))))

(declare-fun b!210249 () Bool)

(declare-fun lt!329745 () (_ BitVec 64))

(assert (=> b!210249 (= e!143457 (bvsle lt!329741 (bvmul lt!329745 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210249 (or (= lt!329745 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329745 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329745)))))

(assert (=> b!210249 (= lt!329745 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))))))

(assert (= (and d!71117 res!176532) b!210248))

(assert (= (and b!210248 res!176533) b!210249))

(declare-fun m!323679 () Bool)

(assert (=> d!71117 m!323679))

(assert (=> d!71117 m!323409))

(assert (=> b!210072 d!71117))

(declare-fun d!71119 () Bool)

(assert (=> d!71119 (= (array_inv!4348 (buf!5124 thiss!1204)) (bvsge (size!4607 (buf!5124 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210083 d!71119))

(declare-fun d!71121 () Bool)

(declare-fun e!143458 () Bool)

(assert (=> d!71121 e!143458))

(declare-fun res!176534 () Bool)

(assert (=> d!71121 (=> (not res!176534) (not e!143458))))

(declare-fun lt!329747 () (_ BitVec 64))

(declare-fun lt!329749 () (_ BitVec 64))

(declare-fun lt!329748 () (_ BitVec 64))

(assert (=> d!71121 (= res!176534 (= lt!329747 (bvsub lt!329748 lt!329749)))))

(assert (=> d!71121 (or (= (bvand lt!329748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329748 lt!329749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71121 (= lt!329749 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329411))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329411)))))))

(declare-fun lt!329746 () (_ BitVec 64))

(declare-fun lt!329750 () (_ BitVec 64))

(assert (=> d!71121 (= lt!329748 (bvmul lt!329746 lt!329750))))

(assert (=> d!71121 (or (= lt!329746 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329750 (bvsdiv (bvmul lt!329746 lt!329750) lt!329746)))))

(assert (=> d!71121 (= lt!329750 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71121 (= lt!329746 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))))))

(assert (=> d!71121 (= lt!329747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329411))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329411)))))))

(assert (=> d!71121 (invariant!0 (currentBit!9661 (_2!9660 lt!329411)) (currentByte!9666 (_2!9660 lt!329411)) (size!4607 (buf!5124 (_2!9660 lt!329411))))))

(assert (=> d!71121 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411))) lt!329747)))

(declare-fun b!210250 () Bool)

(declare-fun res!176535 () Bool)

(assert (=> b!210250 (=> (not res!176535) (not e!143458))))

(assert (=> b!210250 (= res!176535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329747))))

(declare-fun b!210251 () Bool)

(declare-fun lt!329751 () (_ BitVec 64))

(assert (=> b!210251 (= e!143458 (bvsle lt!329747 (bvmul lt!329751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210251 (or (= lt!329751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329751)))))

(assert (=> b!210251 (= lt!329751 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))))))

(assert (= (and d!71121 res!176534) b!210250))

(assert (= (and b!210250 res!176535) b!210251))

(declare-fun m!323681 () Bool)

(assert (=> d!71121 m!323681))

(assert (=> d!71121 m!323395))

(assert (=> b!210082 d!71121))

(declare-fun d!71123 () Bool)

(declare-fun res!176537 () Bool)

(declare-fun e!143460 () Bool)

(assert (=> d!71123 (=> (not res!176537) (not e!143460))))

(assert (=> d!71123 (= res!176537 (= (size!4607 (buf!5124 thiss!1204)) (size!4607 (buf!5124 (_2!9660 lt!329411)))))))

(assert (=> d!71123 (= (isPrefixOf!0 thiss!1204 (_2!9660 lt!329411)) e!143460)))

(declare-fun b!210252 () Bool)

(declare-fun res!176536 () Bool)

(assert (=> b!210252 (=> (not res!176536) (not e!143460))))

(assert (=> b!210252 (= res!176536 (bvsle (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411)))))))

(declare-fun b!210253 () Bool)

(declare-fun e!143459 () Bool)

(assert (=> b!210253 (= e!143460 e!143459)))

(declare-fun res!176538 () Bool)

(assert (=> b!210253 (=> res!176538 e!143459)))

(assert (=> b!210253 (= res!176538 (= (size!4607 (buf!5124 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210254 () Bool)

(assert (=> b!210254 (= e!143459 (arrayBitRangesEq!0 (buf!5124 thiss!1204) (buf!5124 (_2!9660 lt!329411)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))))))

(assert (= (and d!71123 res!176537) b!210252))

(assert (= (and b!210252 res!176536) b!210253))

(assert (= (and b!210253 (not res!176538)) b!210254))

(assert (=> b!210252 m!323419))

(assert (=> b!210252 m!323401))

(assert (=> b!210254 m!323419))

(assert (=> b!210254 m!323419))

(declare-fun m!323683 () Bool)

(assert (=> b!210254 m!323683))

(assert (=> b!210082 d!71123))

(declare-fun d!71125 () Bool)

(assert (=> d!71125 (isPrefixOf!0 thiss!1204 (_2!9660 lt!329411))))

(declare-fun lt!329754 () Unit!14964)

(declare-fun choose!30 (BitStream!8322 BitStream!8322 BitStream!8322) Unit!14964)

(assert (=> d!71125 (= lt!329754 (choose!30 thiss!1204 (_2!9660 lt!329398) (_2!9660 lt!329411)))))

(assert (=> d!71125 (isPrefixOf!0 thiss!1204 (_2!9660 lt!329398))))

(assert (=> d!71125 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9660 lt!329398) (_2!9660 lt!329411)) lt!329754)))

(declare-fun bs!17466 () Bool)

(assert (= bs!17466 d!71125))

(assert (=> bs!17466 m!323403))

(declare-fun m!323685 () Bool)

(assert (=> bs!17466 m!323685))

(assert (=> bs!17466 m!323393))

(assert (=> b!210082 d!71125))

(declare-fun b!210440 () Bool)

(declare-fun res!176683 () Bool)

(declare-fun lt!330399 () tuple2!18010)

(assert (=> b!210440 (= res!176683 (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!330399)))))

(declare-fun e!143571 () Bool)

(assert (=> b!210440 (=> (not res!176683) (not e!143571))))

(declare-fun b!210442 () Bool)

(declare-fun res!176692 () Bool)

(declare-fun e!143567 () Bool)

(assert (=> b!210442 (=> (not res!176692) (not e!143567))))

(declare-fun lt!330415 () tuple2!18010)

(assert (=> b!210442 (= res!176692 (= (size!4607 (buf!5124 (_2!9660 lt!329398))) (size!4607 (buf!5124 (_2!9660 lt!330415)))))))

(declare-fun b!210443 () Bool)

(declare-fun res!176689 () Bool)

(assert (=> b!210443 (=> (not res!176689) (not e!143567))))

(assert (=> b!210443 (= res!176689 (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!330415)))))

(declare-fun b!210444 () Bool)

(declare-fun e!143568 () Bool)

(declare-fun lt!330407 () tuple2!18016)

(declare-fun lt!330385 () tuple2!18014)

(assert (=> b!210444 (= e!143568 (= (_1!9663 lt!330407) (_2!9662 lt!330385)))))

(declare-fun c!10353 () Bool)

(declare-fun call!3315 () Bool)

(declare-fun lt!330386 () tuple2!18010)

(declare-fun bm!3312 () Bool)

(assert (=> bm!3312 (= call!3315 (isPrefixOf!0 (_2!9660 lt!329398) (ite c!10353 (_2!9660 lt!329398) (_2!9660 lt!330386))))))

(declare-fun b!210445 () Bool)

(declare-fun e!143564 () Bool)

(declare-fun lt!330396 () tuple2!18016)

(declare-fun lt!330422 () tuple2!18014)

(assert (=> b!210445 (= e!143564 (= (_1!9663 lt!330396) (_2!9662 lt!330422)))))

(declare-fun b!210446 () Bool)

(declare-fun res!176693 () Bool)

(assert (=> b!210446 (= res!176693 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330399))) (currentByte!9666 (_2!9660 lt!330399)) (currentBit!9661 (_2!9660 lt!330399))) (bvadd (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!210446 (=> (not res!176693) (not e!143571))))

(declare-fun b!210447 () Bool)

(declare-fun res!176684 () Bool)

(assert (=> b!210447 (=> (not res!176684) (not e!143567))))

(declare-fun lt!330419 () (_ BitVec 64))

(declare-fun lt!330403 () (_ BitVec 64))

(assert (=> b!210447 (= res!176684 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330415))) (currentByte!9666 (_2!9660 lt!330415)) (currentBit!9661 (_2!9660 lt!330415))) (bvsub lt!330419 lt!330403)))))

(assert (=> b!210447 (or (= (bvand lt!330419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330419 lt!330403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210447 (= lt!330403 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!330372 () (_ BitVec 64))

(declare-fun lt!330380 () (_ BitVec 64))

(assert (=> b!210447 (= lt!330419 (bvadd lt!330372 lt!330380))))

(assert (=> b!210447 (or (not (= (bvand lt!330372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330380 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330372 lt!330380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210447 (= lt!330380 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210447 (= lt!330372 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(declare-fun b!210448 () Bool)

(declare-fun e!143570 () Bool)

(declare-fun lt!330375 () (_ BitVec 64))

(assert (=> b!210448 (= e!143570 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329398)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!330375))))

(declare-fun b!210441 () Bool)

(declare-fun e!143565 () (_ BitVec 64))

(assert (=> b!210441 (= e!143565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!71127 () Bool)

(assert (=> d!71127 e!143567))

(declare-fun res!176691 () Bool)

(assert (=> d!71127 (=> (not res!176691) (not e!143567))))

(assert (=> d!71127 (= res!176691 (invariant!0 (currentBit!9661 (_2!9660 lt!330415)) (currentByte!9666 (_2!9660 lt!330415)) (size!4607 (buf!5124 (_2!9660 lt!330415)))))))

(declare-fun e!143572 () tuple2!18010)

(assert (=> d!71127 (= lt!330415 e!143572)))

(assert (=> d!71127 (= c!10353 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71127 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71127 (= (appendBitsLSBFirstLoopTR!0 (_2!9660 lt!329398) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!330415)))

(declare-fun b!210449 () Bool)

(declare-fun Unit!14994 () Unit!14964)

(assert (=> b!210449 (= e!143572 (tuple2!18011 Unit!14994 (_2!9660 lt!329398)))))

(declare-fun lt!330390 () Unit!14964)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8322) Unit!14964)

(assert (=> b!210449 (= lt!330390 (lemmaIsPrefixRefl!0 (_2!9660 lt!329398)))))

(assert (=> b!210449 call!3315))

(declare-fun lt!330410 () Unit!14964)

(assert (=> b!210449 (= lt!330410 lt!330390)))

(declare-fun b!210450 () Bool)

(declare-fun lt!330374 () tuple2!18012)

(assert (=> b!210450 (= lt!330374 (readBitPure!0 (readerFrom!0 (_2!9660 lt!330399) (currentBit!9661 (_2!9660 lt!329398)) (currentByte!9666 (_2!9660 lt!329398)))))))

(declare-fun lt!330416 () Bool)

(declare-fun res!176687 () Bool)

(assert (=> b!210450 (= res!176687 (and (= (_2!9661 lt!330374) lt!330416) (= (_1!9661 lt!330374) (_2!9660 lt!330399))))))

(declare-fun e!143569 () Bool)

(assert (=> b!210450 (=> (not res!176687) (not e!143569))))

(assert (=> b!210450 (= e!143571 e!143569)))

(declare-fun b!210451 () Bool)

(declare-fun e!143566 () Bool)

(declare-fun lt!330398 () tuple2!18012)

(declare-fun lt!330393 () tuple2!18012)

(assert (=> b!210451 (= e!143566 (= (_2!9661 lt!330398) (_2!9661 lt!330393)))))

(declare-fun b!210452 () Bool)

(assert (=> b!210452 (= e!143572 (tuple2!18011 (_1!9660 lt!330386) (_2!9660 lt!330386)))))

(assert (=> b!210452 (= lt!330416 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210452 (= lt!330399 (appendBit!0 (_2!9660 lt!329398) lt!330416))))

(declare-fun res!176694 () Bool)

(assert (=> b!210452 (= res!176694 (= (size!4607 (buf!5124 (_2!9660 lt!329398))) (size!4607 (buf!5124 (_2!9660 lt!330399)))))))

(assert (=> b!210452 (=> (not res!176694) (not e!143571))))

(assert (=> b!210452 e!143571))

(declare-fun lt!330401 () tuple2!18010)

(assert (=> b!210452 (= lt!330401 lt!330399)))

(assert (=> b!210452 (= lt!330386 (appendBitsLSBFirstLoopTR!0 (_2!9660 lt!330401) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!330408 () Unit!14964)

(assert (=> b!210452 (= lt!330408 (lemmaIsPrefixTransitive!0 (_2!9660 lt!329398) (_2!9660 lt!330401) (_2!9660 lt!330386)))))

(assert (=> b!210452 call!3315))

(declare-fun lt!330378 () Unit!14964)

(assert (=> b!210452 (= lt!330378 lt!330408)))

(assert (=> b!210452 (invariant!0 (currentBit!9661 (_2!9660 lt!329398)) (currentByte!9666 (_2!9660 lt!329398)) (size!4607 (buf!5124 (_2!9660 lt!330401))))))

(declare-fun lt!330388 () BitStream!8322)

(assert (=> b!210452 (= lt!330388 (BitStream!8323 (buf!5124 (_2!9660 lt!330401)) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(assert (=> b!210452 (invariant!0 (currentBit!9661 lt!330388) (currentByte!9666 lt!330388) (size!4607 (buf!5124 (_2!9660 lt!330386))))))

(declare-fun lt!330402 () BitStream!8322)

(assert (=> b!210452 (= lt!330402 (BitStream!8323 (buf!5124 (_2!9660 lt!330386)) (currentByte!9666 lt!330388) (currentBit!9661 lt!330388)))))

(assert (=> b!210452 (= lt!330398 (readBitPure!0 lt!330388))))

(assert (=> b!210452 (= lt!330393 (readBitPure!0 lt!330402))))

(declare-fun lt!330423 () Unit!14964)

(assert (=> b!210452 (= lt!330423 (readBitPrefixLemma!0 lt!330388 (_2!9660 lt!330386)))))

(declare-fun res!176690 () Bool)

(assert (=> b!210452 (= res!176690 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330398))) (currentByte!9666 (_1!9661 lt!330398)) (currentBit!9661 (_1!9661 lt!330398))) (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330393))) (currentByte!9666 (_1!9661 lt!330393)) (currentBit!9661 (_1!9661 lt!330393)))))))

(assert (=> b!210452 (=> (not res!176690) (not e!143566))))

(assert (=> b!210452 e!143566))

(declare-fun lt!330404 () Unit!14964)

(assert (=> b!210452 (= lt!330404 lt!330423)))

(declare-fun lt!330384 () tuple2!18014)

(assert (=> b!210452 (= lt!330384 (reader!0 (_2!9660 lt!329398) (_2!9660 lt!330386)))))

(declare-fun lt!330395 () tuple2!18014)

(assert (=> b!210452 (= lt!330395 (reader!0 (_2!9660 lt!330401) (_2!9660 lt!330386)))))

(declare-fun lt!330420 () tuple2!18012)

(assert (=> b!210452 (= lt!330420 (readBitPure!0 (_1!9662 lt!330384)))))

(assert (=> b!210452 (= (_2!9661 lt!330420) lt!330416)))

(declare-fun lt!330392 () Unit!14964)

(declare-fun Unit!14995 () Unit!14964)

(assert (=> b!210452 (= lt!330392 Unit!14995)))

(declare-fun lt!330382 () (_ BitVec 64))

(assert (=> b!210452 (= lt!330382 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330409 () (_ BitVec 64))

(assert (=> b!210452 (= lt!330409 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330381 () Unit!14964)

(assert (=> b!210452 (= lt!330381 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!330386)) lt!330409))))

(assert (=> b!210452 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!330386)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!330409)))

(declare-fun lt!330391 () Unit!14964)

(assert (=> b!210452 (= lt!330391 lt!330381)))

(declare-fun lt!330387 () tuple2!18016)

(assert (=> b!210452 (= lt!330387 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!330384) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330382))))

(declare-fun lt!330394 () (_ BitVec 64))

(assert (=> b!210452 (= lt!330394 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!330421 () Unit!14964)

(assert (=> b!210452 (= lt!330421 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!330401) (buf!5124 (_2!9660 lt!330386)) lt!330394))))

(assert (=> b!210452 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!330386)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!330401))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!330401))) lt!330394)))

(declare-fun lt!330383 () Unit!14964)

(assert (=> b!210452 (= lt!330383 lt!330421)))

(declare-fun lt!330417 () tuple2!18016)

(assert (=> b!210452 (= lt!330417 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!330395) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!330382 (ite (_2!9661 lt!330420) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!330413 () tuple2!18016)

(assert (=> b!210452 (= lt!330413 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!330384) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330382))))

(declare-fun c!10354 () Bool)

(assert (=> b!210452 (= c!10354 (_2!9661 (readBitPure!0 (_1!9662 lt!330384))))))

(declare-fun lt!330377 () tuple2!18016)

(assert (=> b!210452 (= lt!330377 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9662 lt!330384) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!330382 e!143565)))))

(declare-fun lt!330371 () Unit!14964)

(assert (=> b!210452 (= lt!330371 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9662 lt!330384) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330382))))

(assert (=> b!210452 (and (= (_2!9663 lt!330413) (_2!9663 lt!330377)) (= (_1!9663 lt!330413) (_1!9663 lt!330377)))))

(declare-fun lt!330373 () Unit!14964)

(assert (=> b!210452 (= lt!330373 lt!330371)))

(assert (=> b!210452 (= (_1!9662 lt!330384) (withMovedBitIndex!0 (_2!9662 lt!330384) (bvsub (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330386))) (currentByte!9666 (_2!9660 lt!330386)) (currentBit!9661 (_2!9660 lt!330386))))))))

(declare-fun lt!330376 () Unit!14964)

(declare-fun Unit!14996 () Unit!14964)

(assert (=> b!210452 (= lt!330376 Unit!14996)))

(assert (=> b!210452 (= (_1!9662 lt!330395) (withMovedBitIndex!0 (_2!9662 lt!330395) (bvsub (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330401))) (currentByte!9666 (_2!9660 lt!330401)) (currentBit!9661 (_2!9660 lt!330401))) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330386))) (currentByte!9666 (_2!9660 lt!330386)) (currentBit!9661 (_2!9660 lt!330386))))))))

(declare-fun lt!330400 () Unit!14964)

(declare-fun Unit!14997 () Unit!14964)

(assert (=> b!210452 (= lt!330400 Unit!14997)))

(assert (=> b!210452 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) (bvsub (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330401))) (currentByte!9666 (_2!9660 lt!330401)) (currentBit!9661 (_2!9660 lt!330401))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!330406 () Unit!14964)

(declare-fun Unit!14998 () Unit!14964)

(assert (=> b!210452 (= lt!330406 Unit!14998)))

(assert (=> b!210452 (= (_2!9663 lt!330387) (_2!9663 lt!330417))))

(declare-fun lt!330411 () Unit!14964)

(declare-fun Unit!14999 () Unit!14964)

(assert (=> b!210452 (= lt!330411 Unit!14999)))

(assert (=> b!210452 (invariant!0 (currentBit!9661 (_2!9660 lt!330386)) (currentByte!9666 (_2!9660 lt!330386)) (size!4607 (buf!5124 (_2!9660 lt!330386))))))

(declare-fun lt!330370 () Unit!14964)

(declare-fun Unit!15000 () Unit!14964)

(assert (=> b!210452 (= lt!330370 Unit!15000)))

(assert (=> b!210452 (= (size!4607 (buf!5124 (_2!9660 lt!329398))) (size!4607 (buf!5124 (_2!9660 lt!330386))))))

(declare-fun lt!330414 () Unit!14964)

(declare-fun Unit!15001 () Unit!14964)

(assert (=> b!210452 (= lt!330414 Unit!15001)))

(assert (=> b!210452 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330386))) (currentByte!9666 (_2!9660 lt!330386)) (currentBit!9661 (_2!9660 lt!330386))) (bvsub (bvadd (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330397 () Unit!14964)

(declare-fun Unit!15002 () Unit!14964)

(assert (=> b!210452 (= lt!330397 Unit!15002)))

(declare-fun lt!330412 () Unit!14964)

(declare-fun Unit!15003 () Unit!14964)

(assert (=> b!210452 (= lt!330412 Unit!15003)))

(assert (=> b!210452 (= lt!330422 (reader!0 (_2!9660 lt!329398) (_2!9660 lt!330386)))))

(declare-fun lt!330405 () (_ BitVec 64))

(assert (=> b!210452 (= lt!330405 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330424 () Unit!14964)

(assert (=> b!210452 (= lt!330424 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!330386)) lt!330405))))

(assert (=> b!210452 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!330386)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!330405)))

(declare-fun lt!330389 () Unit!14964)

(assert (=> b!210452 (= lt!330389 lt!330424)))

(assert (=> b!210452 (= lt!330396 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!330422) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176686 () Bool)

(assert (=> b!210452 (= res!176686 (= (_2!9663 lt!330396) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210452 (=> (not res!176686) (not e!143564))))

(assert (=> b!210452 e!143564))

(declare-fun lt!330369 () Unit!14964)

(declare-fun Unit!15004 () Unit!14964)

(assert (=> b!210452 (= lt!330369 Unit!15004)))

(declare-fun b!210453 () Bool)

(assert (=> b!210453 (= e!143565 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!210454 () Bool)

(assert (=> b!210454 (= e!143567 e!143568)))

(declare-fun res!176688 () Bool)

(assert (=> b!210454 (=> (not res!176688) (not e!143568))))

(assert (=> b!210454 (= res!176688 (= (_2!9663 lt!330407) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210454 (= lt!330407 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!330385) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!330379 () Unit!14964)

(declare-fun lt!330418 () Unit!14964)

(assert (=> b!210454 (= lt!330379 lt!330418)))

(assert (=> b!210454 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!330415)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!330375)))

(assert (=> b!210454 (= lt!330418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!330415)) lt!330375))))

(assert (=> b!210454 e!143570))

(declare-fun res!176685 () Bool)

(assert (=> b!210454 (=> (not res!176685) (not e!143570))))

(assert (=> b!210454 (= res!176685 (and (= (size!4607 (buf!5124 (_2!9660 lt!329398))) (size!4607 (buf!5124 (_2!9660 lt!330415)))) (bvsge lt!330375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210454 (= lt!330375 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210454 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210454 (= lt!330385 (reader!0 (_2!9660 lt!329398) (_2!9660 lt!330415)))))

(declare-fun b!210455 () Bool)

(assert (=> b!210455 (= e!143569 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330374))) (currentByte!9666 (_1!9661 lt!330374)) (currentBit!9661 (_1!9661 lt!330374))) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330399))) (currentByte!9666 (_2!9660 lt!330399)) (currentBit!9661 (_2!9660 lt!330399)))))))

(assert (= (and d!71127 c!10353) b!210449))

(assert (= (and d!71127 (not c!10353)) b!210452))

(assert (= (and b!210452 res!176694) b!210446))

(assert (= (and b!210446 res!176693) b!210440))

(assert (= (and b!210440 res!176683) b!210450))

(assert (= (and b!210450 res!176687) b!210455))

(assert (= (and b!210452 res!176690) b!210451))

(assert (= (and b!210452 c!10354) b!210453))

(assert (= (and b!210452 (not c!10354)) b!210441))

(assert (= (and b!210452 res!176686) b!210445))

(assert (= (or b!210449 b!210452) bm!3312))

(assert (= (and d!71127 res!176691) b!210442))

(assert (= (and b!210442 res!176692) b!210447))

(assert (= (and b!210447 res!176684) b!210443))

(assert (= (and b!210443 res!176689) b!210454))

(assert (= (and b!210454 res!176685) b!210448))

(assert (= (and b!210454 res!176688) b!210444))

(declare-fun m!324009 () Bool)

(assert (=> b!210440 m!324009))

(declare-fun m!324011 () Bool)

(assert (=> b!210450 m!324011))

(assert (=> b!210450 m!324011))

(declare-fun m!324013 () Bool)

(assert (=> b!210450 m!324013))

(declare-fun m!324015 () Bool)

(assert (=> b!210454 m!324015))

(declare-fun m!324017 () Bool)

(assert (=> b!210454 m!324017))

(declare-fun m!324019 () Bool)

(assert (=> b!210454 m!324019))

(declare-fun m!324021 () Bool)

(assert (=> b!210454 m!324021))

(declare-fun m!324023 () Bool)

(assert (=> b!210454 m!324023))

(declare-fun m!324025 () Bool)

(assert (=> b!210454 m!324025))

(declare-fun m!324027 () Bool)

(assert (=> b!210455 m!324027))

(declare-fun m!324029 () Bool)

(assert (=> b!210455 m!324029))

(declare-fun m!324031 () Bool)

(assert (=> d!71127 m!324031))

(declare-fun m!324033 () Bool)

(assert (=> b!210447 m!324033))

(assert (=> b!210447 m!323417))

(declare-fun m!324035 () Bool)

(assert (=> b!210452 m!324035))

(declare-fun m!324037 () Bool)

(assert (=> b!210452 m!324037))

(declare-fun m!324039 () Bool)

(assert (=> b!210452 m!324039))

(declare-fun m!324041 () Bool)

(assert (=> b!210452 m!324041))

(declare-fun m!324043 () Bool)

(assert (=> b!210452 m!324043))

(declare-fun m!324045 () Bool)

(assert (=> b!210452 m!324045))

(declare-fun m!324047 () Bool)

(assert (=> b!210452 m!324047))

(declare-fun m!324049 () Bool)

(assert (=> b!210452 m!324049))

(declare-fun m!324051 () Bool)

(assert (=> b!210452 m!324051))

(declare-fun m!324053 () Bool)

(assert (=> b!210452 m!324053))

(declare-fun m!324055 () Bool)

(assert (=> b!210452 m!324055))

(assert (=> b!210452 m!324023))

(declare-fun m!324057 () Bool)

(assert (=> b!210452 m!324057))

(declare-fun m!324059 () Bool)

(assert (=> b!210452 m!324059))

(assert (=> b!210452 m!323417))

(assert (=> b!210452 m!324015))

(declare-fun m!324061 () Bool)

(assert (=> b!210452 m!324061))

(declare-fun m!324063 () Bool)

(assert (=> b!210452 m!324063))

(declare-fun m!324065 () Bool)

(assert (=> b!210452 m!324065))

(declare-fun m!324067 () Bool)

(assert (=> b!210452 m!324067))

(declare-fun m!324069 () Bool)

(assert (=> b!210452 m!324069))

(declare-fun m!324071 () Bool)

(assert (=> b!210452 m!324071))

(assert (=> b!210452 m!324047))

(declare-fun m!324073 () Bool)

(assert (=> b!210452 m!324073))

(declare-fun m!324075 () Bool)

(assert (=> b!210452 m!324075))

(declare-fun m!324077 () Bool)

(assert (=> b!210452 m!324077))

(declare-fun m!324079 () Bool)

(assert (=> b!210452 m!324079))

(declare-fun m!324081 () Bool)

(assert (=> b!210452 m!324081))

(declare-fun m!324083 () Bool)

(assert (=> b!210452 m!324083))

(declare-fun m!324085 () Bool)

(assert (=> b!210452 m!324085))

(declare-fun m!324087 () Bool)

(assert (=> b!210452 m!324087))

(declare-fun m!324089 () Bool)

(assert (=> b!210452 m!324089))

(declare-fun m!324091 () Bool)

(assert (=> b!210452 m!324091))

(declare-fun m!324093 () Bool)

(assert (=> b!210452 m!324093))

(declare-fun m!324095 () Bool)

(assert (=> bm!3312 m!324095))

(declare-fun m!324097 () Bool)

(assert (=> b!210443 m!324097))

(declare-fun m!324099 () Bool)

(assert (=> b!210448 m!324099))

(assert (=> b!210446 m!324029))

(assert (=> b!210446 m!323417))

(declare-fun m!324101 () Bool)

(assert (=> b!210449 m!324101))

(assert (=> b!210082 d!71127))

(declare-fun d!71195 () Bool)

(declare-fun res!176696 () Bool)

(declare-fun e!143574 () Bool)

(assert (=> d!71195 (=> (not res!176696) (not e!143574))))

(assert (=> d!71195 (= res!176696 (= (size!4607 (buf!5124 thiss!1204)) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (=> d!71195 (= (isPrefixOf!0 thiss!1204 (_2!9660 lt!329398)) e!143574)))

(declare-fun b!210456 () Bool)

(declare-fun res!176695 () Bool)

(assert (=> b!210456 (=> (not res!176695) (not e!143574))))

(assert (=> b!210456 (= res!176695 (bvsle (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398)))))))

(declare-fun b!210457 () Bool)

(declare-fun e!143573 () Bool)

(assert (=> b!210457 (= e!143574 e!143573)))

(declare-fun res!176697 () Bool)

(assert (=> b!210457 (=> res!176697 e!143573)))

(assert (=> b!210457 (= res!176697 (= (size!4607 (buf!5124 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210458 () Bool)

(assert (=> b!210458 (= e!143573 (arrayBitRangesEq!0 (buf!5124 thiss!1204) (buf!5124 (_2!9660 lt!329398)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))))))

(assert (= (and d!71195 res!176696) b!210456))

(assert (= (and b!210456 res!176695) b!210457))

(assert (= (and b!210457 (not res!176697)) b!210458))

(assert (=> b!210456 m!323419))

(assert (=> b!210456 m!323417))

(assert (=> b!210458 m!323419))

(assert (=> b!210458 m!323419))

(declare-fun m!324103 () Bool)

(assert (=> b!210458 m!324103))

(assert (=> b!210071 d!71195))

(declare-fun d!71197 () Bool)

(declare-fun e!143577 () Bool)

(assert (=> d!71197 e!143577))

(declare-fun res!176700 () Bool)

(assert (=> d!71197 (=> (not res!176700) (not e!143577))))

(declare-fun lt!330430 () (_ BitVec 64))

(declare-fun lt!330429 () BitStream!8322)

(assert (=> d!71197 (= res!176700 (= (bvadd lt!330430 (bvsub lt!329413 lt!329414)) (bitIndex!0 (size!4607 (buf!5124 lt!330429)) (currentByte!9666 lt!330429) (currentBit!9661 lt!330429))))))

(assert (=> d!71197 (or (not (= (bvand lt!330430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329413 lt!329414) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330430 (bvsub lt!329413 lt!329414)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71197 (= lt!330430 (bitIndex!0 (size!4607 (buf!5124 (_2!9662 lt!329399))) (currentByte!9666 (_2!9662 lt!329399)) (currentBit!9661 (_2!9662 lt!329399))))))

(declare-fun moveBitIndex!0 (BitStream!8322 (_ BitVec 64)) tuple2!18010)

(assert (=> d!71197 (= lt!330429 (_2!9660 (moveBitIndex!0 (_2!9662 lt!329399) (bvsub lt!329413 lt!329414))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8322 (_ BitVec 64)) Bool)

(assert (=> d!71197 (moveBitIndexPrecond!0 (_2!9662 lt!329399) (bvsub lt!329413 lt!329414))))

(assert (=> d!71197 (= (withMovedBitIndex!0 (_2!9662 lt!329399) (bvsub lt!329413 lt!329414)) lt!330429)))

(declare-fun b!210461 () Bool)

(assert (=> b!210461 (= e!143577 (= (size!4607 (buf!5124 (_2!9662 lt!329399))) (size!4607 (buf!5124 lt!330429))))))

(assert (= (and d!71197 res!176700) b!210461))

(declare-fun m!324105 () Bool)

(assert (=> d!71197 m!324105))

(declare-fun m!324107 () Bool)

(assert (=> d!71197 m!324107))

(declare-fun m!324109 () Bool)

(assert (=> d!71197 m!324109))

(declare-fun m!324111 () Bool)

(assert (=> d!71197 m!324111))

(assert (=> b!210086 d!71197))

(declare-fun d!71199 () Bool)

(declare-fun lt!330447 () tuple2!18016)

(declare-fun lt!330446 () tuple2!18016)

(assert (=> d!71199 (and (= (_2!9663 lt!330447) (_2!9663 lt!330446)) (= (_1!9663 lt!330447) (_1!9663 lt!330446)))))

(declare-fun lt!330448 () (_ BitVec 64))

(declare-fun lt!330445 () Unit!14964)

(declare-fun lt!330443 () Bool)

(declare-fun lt!330444 () BitStream!8322)

(declare-fun choose!56 (BitStream!8322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18016 tuple2!18016 BitStream!8322 (_ BitVec 64) Bool BitStream!8322 (_ BitVec 64) tuple2!18016 tuple2!18016 BitStream!8322 (_ BitVec 64)) Unit!14964)

(assert (=> d!71199 (= lt!330445 (choose!56 (_1!9662 lt!329399) nBits!348 i!590 lt!329410 lt!330447 (tuple2!18017 (_1!9663 lt!330447) (_2!9663 lt!330447)) (_1!9663 lt!330447) (_2!9663 lt!330447) lt!330443 lt!330444 lt!330448 lt!330446 (tuple2!18017 (_1!9663 lt!330446) (_2!9663 lt!330446)) (_1!9663 lt!330446) (_2!9663 lt!330446)))))

(assert (=> d!71199 (= lt!330446 (readNBitsLSBFirstsLoopPure!0 lt!330444 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!330448))))

(assert (=> d!71199 (= lt!330448 (bvor lt!329410 (ite lt!330443 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71199 (= lt!330444 (withMovedBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71199 (= lt!330443 (_2!9661 (readBitPure!0 (_1!9662 lt!329399))))))

(assert (=> d!71199 (= lt!330447 (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410))))

(assert (=> d!71199 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410) lt!330445)))

(declare-fun bs!17482 () Bool)

(assert (= bs!17482 d!71199))

(declare-fun m!324113 () Bool)

(assert (=> bs!17482 m!324113))

(assert (=> bs!17482 m!323361))

(assert (=> bs!17482 m!323369))

(declare-fun m!324115 () Bool)

(assert (=> bs!17482 m!324115))

(assert (=> bs!17482 m!323427))

(assert (=> b!210086 d!71199))

(declare-datatypes ((tuple2!18034 0))(
  ( (tuple2!18035 (_1!9672 (_ BitVec 64)) (_2!9672 BitStream!8322)) )
))
(declare-fun lt!330451 () tuple2!18034)

(declare-fun d!71201 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18034)

(assert (=> d!71201 (= lt!330451 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388))))

(assert (=> d!71201 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388) (tuple2!18017 (_2!9672 lt!330451) (_1!9672 lt!330451)))))

(declare-fun bs!17483 () Bool)

(assert (= bs!17483 d!71201))

(assert (=> bs!17483 m!323427))

(declare-fun m!324117 () Bool)

(assert (=> bs!17483 m!324117))

(assert (=> b!210086 d!71201))

(declare-fun d!71203 () Bool)

(declare-fun e!143578 () Bool)

(assert (=> d!71203 e!143578))

(declare-fun res!176701 () Bool)

(assert (=> d!71203 (=> (not res!176701) (not e!143578))))

(declare-fun lt!330453 () (_ BitVec 64))

(declare-fun lt!330452 () BitStream!8322)

(assert (=> d!71203 (= res!176701 (= (bvadd lt!330453 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4607 (buf!5124 lt!330452)) (currentByte!9666 lt!330452) (currentBit!9661 lt!330452))))))

(assert (=> d!71203 (or (not (= (bvand lt!330453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330453 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71203 (= lt!330453 (bitIndex!0 (size!4607 (buf!5124 (_1!9662 lt!329399))) (currentByte!9666 (_1!9662 lt!329399)) (currentBit!9661 (_1!9662 lt!329399))))))

(assert (=> d!71203 (= lt!330452 (_2!9660 (moveBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71203 (moveBitIndexPrecond!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71203 (= (withMovedBitIndex!0 (_1!9662 lt!329399) #b0000000000000000000000000000000000000000000000000000000000000001) lt!330452)))

(declare-fun b!210462 () Bool)

(assert (=> b!210462 (= e!143578 (= (size!4607 (buf!5124 (_1!9662 lt!329399))) (size!4607 (buf!5124 lt!330452))))))

(assert (= (and d!71203 res!176701) b!210462))

(declare-fun m!324119 () Bool)

(assert (=> d!71203 m!324119))

(declare-fun m!324121 () Bool)

(assert (=> d!71203 m!324121))

(declare-fun m!324123 () Bool)

(assert (=> d!71203 m!324123))

(declare-fun m!324125 () Bool)

(assert (=> d!71203 m!324125))

(assert (=> b!210086 d!71203))

(declare-fun d!71205 () Bool)

(assert (=> d!71205 (= (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329411)))) (and (bvsge (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9661 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9666 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329411)))) (and (= (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329411))))))))))

(assert (=> b!210074 d!71205))

(declare-fun d!71207 () Bool)

(declare-datatypes ((tuple2!18036 0))(
  ( (tuple2!18037 (_1!9673 Bool) (_2!9673 BitStream!8322)) )
))
(declare-fun lt!330456 () tuple2!18036)

(declare-fun readBit!0 (BitStream!8322) tuple2!18036)

(assert (=> d!71207 (= lt!330456 (readBit!0 (readerFrom!0 (_2!9660 lt!329398) (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204))))))

(assert (=> d!71207 (= (readBitPure!0 (readerFrom!0 (_2!9660 lt!329398) (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204))) (tuple2!18013 (_2!9673 lt!330456) (_1!9673 lt!330456)))))

(declare-fun bs!17484 () Bool)

(assert (= bs!17484 d!71207))

(assert (=> bs!17484 m!323413))

(declare-fun m!324127 () Bool)

(assert (=> bs!17484 m!324127))

(assert (=> b!210085 d!71207))

(declare-fun d!71209 () Bool)

(declare-fun e!143581 () Bool)

(assert (=> d!71209 e!143581))

(declare-fun res!176705 () Bool)

(assert (=> d!71209 (=> (not res!176705) (not e!143581))))

(assert (=> d!71209 (= res!176705 (invariant!0 (currentBit!9661 (_2!9660 lt!329398)) (currentByte!9666 (_2!9660 lt!329398)) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (=> d!71209 (= (readerFrom!0 (_2!9660 lt!329398) (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204)) (BitStream!8323 (buf!5124 (_2!9660 lt!329398)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(declare-fun b!210465 () Bool)

(assert (=> b!210465 (= e!143581 (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329398)))))))

(assert (= (and d!71209 res!176705) b!210465))

(assert (=> d!71209 m!323677))

(assert (=> b!210465 m!323373))

(assert (=> b!210085 d!71209))

(assert (=> b!210084 d!71195))

(declare-fun d!71211 () Bool)

(assert (=> d!71211 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204))))))

(declare-fun bs!17485 () Bool)

(assert (= bs!17485 d!71211))

(assert (=> bs!17485 m!323409))

(assert (=> start!44090 d!71211))

(declare-fun d!71213 () Bool)

(declare-fun e!143582 () Bool)

(assert (=> d!71213 e!143582))

(declare-fun res!176706 () Bool)

(assert (=> d!71213 (=> (not res!176706) (not e!143582))))

(declare-fun lt!330460 () (_ BitVec 64))

(declare-fun lt!330458 () (_ BitVec 64))

(declare-fun lt!330459 () (_ BitVec 64))

(assert (=> d!71213 (= res!176706 (= lt!330458 (bvsub lt!330459 lt!330460)))))

(assert (=> d!71213 (or (= (bvand lt!330459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330459 lt!330460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71213 (= lt!330460 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329393)))) ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329393))) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329393)))))))

(declare-fun lt!330457 () (_ BitVec 64))

(declare-fun lt!330461 () (_ BitVec 64))

(assert (=> d!71213 (= lt!330459 (bvmul lt!330457 lt!330461))))

(assert (=> d!71213 (or (= lt!330457 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330461 (bvsdiv (bvmul lt!330457 lt!330461) lt!330457)))))

(assert (=> d!71213 (= lt!330461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71213 (= lt!330457 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329393)))))))

(assert (=> d!71213 (= lt!330458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329393))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329393)))))))

(assert (=> d!71213 (invariant!0 (currentBit!9661 (_1!9661 lt!329393)) (currentByte!9666 (_1!9661 lt!329393)) (size!4607 (buf!5124 (_1!9661 lt!329393))))))

(assert (=> d!71213 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329393))) (currentByte!9666 (_1!9661 lt!329393)) (currentBit!9661 (_1!9661 lt!329393))) lt!330458)))

(declare-fun b!210466 () Bool)

(declare-fun res!176707 () Bool)

(assert (=> b!210466 (=> (not res!176707) (not e!143582))))

(assert (=> b!210466 (= res!176707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330458))))

(declare-fun b!210467 () Bool)

(declare-fun lt!330462 () (_ BitVec 64))

(assert (=> b!210467 (= e!143582 (bvsle lt!330458 (bvmul lt!330462 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210467 (or (= lt!330462 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330462 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330462)))))

(assert (=> b!210467 (= lt!330462 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329393)))))))

(assert (= (and d!71213 res!176706) b!210466))

(assert (= (and b!210466 res!176707) b!210467))

(declare-fun m!324129 () Bool)

(assert (=> d!71213 m!324129))

(declare-fun m!324131 () Bool)

(assert (=> d!71213 m!324131))

(assert (=> b!210076 d!71213))

(declare-fun d!71215 () Bool)

(assert (=> d!71215 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!329400)))

(declare-fun lt!330465 () Unit!14964)

(declare-fun choose!9 (BitStream!8322 array!10483 (_ BitVec 64) BitStream!8322) Unit!14964)

(assert (=> d!71215 (= lt!330465 (choose!9 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!329411)) lt!329400 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398)))))))

(assert (=> d!71215 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9660 lt!329398) (buf!5124 (_2!9660 lt!329411)) lt!329400) lt!330465)))

(declare-fun bs!17486 () Bool)

(assert (= bs!17486 d!71215))

(assert (=> bs!17486 m!323363))

(declare-fun m!324133 () Bool)

(assert (=> bs!17486 m!324133))

(assert (=> b!210087 d!71215))

(declare-fun d!71217 () Bool)

(assert (=> d!71217 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210087 d!71217))

(declare-fun d!71219 () Bool)

(declare-fun lt!330466 () tuple2!18036)

(assert (=> d!71219 (= lt!330466 (readBit!0 (_1!9662 lt!329399)))))

(assert (=> d!71219 (= (readBitPure!0 (_1!9662 lt!329399)) (tuple2!18013 (_2!9673 lt!330466) (_1!9673 lt!330466)))))

(declare-fun bs!17487 () Bool)

(assert (= bs!17487 d!71219))

(declare-fun m!324135 () Bool)

(assert (=> bs!17487 m!324135))

(assert (=> b!210087 d!71219))

(declare-fun d!71221 () Bool)

(declare-fun e!143588 () Bool)

(assert (=> d!71221 e!143588))

(declare-fun res!176716 () Bool)

(assert (=> d!71221 (=> (not res!176716) (not e!143588))))

(declare-fun lt!330523 () tuple2!18014)

(assert (=> d!71221 (= res!176716 (isPrefixOf!0 (_1!9662 lt!330523) (_2!9662 lt!330523)))))

(declare-fun lt!330514 () BitStream!8322)

(assert (=> d!71221 (= lt!330523 (tuple2!18015 lt!330514 (_2!9660 lt!329411)))))

(declare-fun lt!330526 () Unit!14964)

(declare-fun lt!330507 () Unit!14964)

(assert (=> d!71221 (= lt!330526 lt!330507)))

(assert (=> d!71221 (isPrefixOf!0 lt!330514 (_2!9660 lt!329411))))

(assert (=> d!71221 (= lt!330507 (lemmaIsPrefixTransitive!0 lt!330514 (_2!9660 lt!329411) (_2!9660 lt!329411)))))

(declare-fun lt!330511 () Unit!14964)

(declare-fun lt!330517 () Unit!14964)

(assert (=> d!71221 (= lt!330511 lt!330517)))

(assert (=> d!71221 (isPrefixOf!0 lt!330514 (_2!9660 lt!329411))))

(assert (=> d!71221 (= lt!330517 (lemmaIsPrefixTransitive!0 lt!330514 thiss!1204 (_2!9660 lt!329411)))))

(declare-fun lt!330512 () Unit!14964)

(declare-fun e!143587 () Unit!14964)

(assert (=> d!71221 (= lt!330512 e!143587)))

(declare-fun c!10357 () Bool)

(assert (=> d!71221 (= c!10357 (not (= (size!4607 (buf!5124 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!330508 () Unit!14964)

(declare-fun lt!330515 () Unit!14964)

(assert (=> d!71221 (= lt!330508 lt!330515)))

(assert (=> d!71221 (isPrefixOf!0 (_2!9660 lt!329411) (_2!9660 lt!329411))))

(assert (=> d!71221 (= lt!330515 (lemmaIsPrefixRefl!0 (_2!9660 lt!329411)))))

(declare-fun lt!330519 () Unit!14964)

(declare-fun lt!330509 () Unit!14964)

(assert (=> d!71221 (= lt!330519 lt!330509)))

(assert (=> d!71221 (= lt!330509 (lemmaIsPrefixRefl!0 (_2!9660 lt!329411)))))

(declare-fun lt!330521 () Unit!14964)

(declare-fun lt!330520 () Unit!14964)

(assert (=> d!71221 (= lt!330521 lt!330520)))

(assert (=> d!71221 (isPrefixOf!0 lt!330514 lt!330514)))

(assert (=> d!71221 (= lt!330520 (lemmaIsPrefixRefl!0 lt!330514))))

(declare-fun lt!330524 () Unit!14964)

(declare-fun lt!330516 () Unit!14964)

(assert (=> d!71221 (= lt!330524 lt!330516)))

(assert (=> d!71221 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71221 (= lt!330516 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71221 (= lt!330514 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(assert (=> d!71221 (isPrefixOf!0 thiss!1204 (_2!9660 lt!329411))))

(assert (=> d!71221 (= (reader!0 thiss!1204 (_2!9660 lt!329411)) lt!330523)))

(declare-fun b!210478 () Bool)

(declare-fun lt!330522 () Unit!14964)

(assert (=> b!210478 (= e!143587 lt!330522)))

(declare-fun lt!330518 () (_ BitVec 64))

(assert (=> b!210478 (= lt!330518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!330510 () (_ BitVec 64))

(assert (=> b!210478 (= lt!330510 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10483 array!10483 (_ BitVec 64) (_ BitVec 64)) Unit!14964)

(assert (=> b!210478 (= lt!330522 (arrayBitRangesEqSymmetric!0 (buf!5124 thiss!1204) (buf!5124 (_2!9660 lt!329411)) lt!330518 lt!330510))))

(assert (=> b!210478 (arrayBitRangesEq!0 (buf!5124 (_2!9660 lt!329411)) (buf!5124 thiss!1204) lt!330518 lt!330510)))

(declare-fun b!210479 () Bool)

(declare-fun Unit!15005 () Unit!14964)

(assert (=> b!210479 (= e!143587 Unit!15005)))

(declare-fun b!210480 () Bool)

(declare-fun res!176715 () Bool)

(assert (=> b!210480 (=> (not res!176715) (not e!143588))))

(assert (=> b!210480 (= res!176715 (isPrefixOf!0 (_2!9662 lt!330523) (_2!9660 lt!329411)))))

(declare-fun lt!330525 () (_ BitVec 64))

(declare-fun lt!330513 () (_ BitVec 64))

(declare-fun b!210481 () Bool)

(assert (=> b!210481 (= e!143588 (= (_1!9662 lt!330523) (withMovedBitIndex!0 (_2!9662 lt!330523) (bvsub lt!330525 lt!330513))))))

(assert (=> b!210481 (or (= (bvand lt!330525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330525 lt!330513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210481 (= lt!330513 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411))))))

(assert (=> b!210481 (= lt!330525 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(declare-fun b!210482 () Bool)

(declare-fun res!176714 () Bool)

(assert (=> b!210482 (=> (not res!176714) (not e!143588))))

(assert (=> b!210482 (= res!176714 (isPrefixOf!0 (_1!9662 lt!330523) thiss!1204))))

(assert (= (and d!71221 c!10357) b!210478))

(assert (= (and d!71221 (not c!10357)) b!210479))

(assert (= (and d!71221 res!176716) b!210482))

(assert (= (and b!210482 res!176714) b!210480))

(assert (= (and b!210480 res!176715) b!210481))

(assert (=> d!71221 m!323403))

(declare-fun m!324137 () Bool)

(assert (=> d!71221 m!324137))

(declare-fun m!324139 () Bool)

(assert (=> d!71221 m!324139))

(declare-fun m!324141 () Bool)

(assert (=> d!71221 m!324141))

(declare-fun m!324143 () Bool)

(assert (=> d!71221 m!324143))

(declare-fun m!324145 () Bool)

(assert (=> d!71221 m!324145))

(declare-fun m!324147 () Bool)

(assert (=> d!71221 m!324147))

(declare-fun m!324149 () Bool)

(assert (=> d!71221 m!324149))

(declare-fun m!324151 () Bool)

(assert (=> d!71221 m!324151))

(declare-fun m!324153 () Bool)

(assert (=> d!71221 m!324153))

(declare-fun m!324155 () Bool)

(assert (=> d!71221 m!324155))

(declare-fun m!324157 () Bool)

(assert (=> b!210480 m!324157))

(assert (=> b!210478 m!323419))

(declare-fun m!324159 () Bool)

(assert (=> b!210478 m!324159))

(declare-fun m!324161 () Bool)

(assert (=> b!210478 m!324161))

(declare-fun m!324163 () Bool)

(assert (=> b!210482 m!324163))

(declare-fun m!324165 () Bool)

(assert (=> b!210481 m!324165))

(assert (=> b!210481 m!323401))

(assert (=> b!210481 m!323419))

(assert (=> b!210087 d!71221))

(declare-fun lt!330527 () tuple2!18034)

(declare-fun d!71223 () Bool)

(assert (=> d!71223 (= lt!330527 (readNBitsLSBFirstsLoop!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410))))

(assert (=> d!71223 (= (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!329399) nBits!348 i!590 lt!329410) (tuple2!18017 (_2!9672 lt!330527) (_1!9672 lt!330527)))))

(declare-fun bs!17488 () Bool)

(assert (= bs!17488 d!71223))

(declare-fun m!324167 () Bool)

(assert (=> bs!17488 m!324167))

(assert (=> b!210087 d!71223))

(declare-fun d!71225 () Bool)

(declare-fun lt!330528 () tuple2!18036)

(assert (=> d!71225 (= lt!330528 (readBit!0 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))))))

(assert (=> d!71225 (= (readBitPure!0 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))) (tuple2!18013 (_2!9673 lt!330528) (_1!9673 lt!330528)))))

(declare-fun bs!17489 () Bool)

(assert (= bs!17489 d!71225))

(declare-fun m!324169 () Bool)

(assert (=> bs!17489 m!324169))

(assert (=> b!210087 d!71225))

(declare-fun d!71227 () Bool)

(assert (=> d!71227 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)) lt!329404) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204))) lt!329404))))

(declare-fun bs!17490 () Bool)

(assert (= bs!17490 d!71227))

(declare-fun m!324171 () Bool)

(assert (=> bs!17490 m!324171))

(assert (=> b!210087 d!71227))

(declare-fun d!71229 () Bool)

(declare-fun lt!330529 () tuple2!18036)

(assert (=> d!71229 (= lt!330529 (readBit!0 lt!329390))))

(assert (=> d!71229 (= (readBitPure!0 lt!329390) (tuple2!18013 (_2!9673 lt!330529) (_1!9673 lt!330529)))))

(declare-fun bs!17491 () Bool)

(assert (= bs!17491 d!71229))

(declare-fun m!324173 () Bool)

(assert (=> bs!17491 m!324173))

(assert (=> b!210087 d!71229))

(declare-fun d!71231 () Bool)

(declare-fun lt!330530 () tuple2!18034)

(assert (=> d!71231 (= lt!330530 (readNBitsLSBFirstsLoop!0 (_1!9662 lt!329412) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388))))

(assert (=> d!71231 (= (readNBitsLSBFirstsLoopPure!0 (_1!9662 lt!329412) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329388) (tuple2!18017 (_2!9672 lt!330530) (_1!9672 lt!330530)))))

(declare-fun bs!17492 () Bool)

(assert (= bs!17492 d!71231))

(declare-fun m!324175 () Bool)

(assert (=> bs!17492 m!324175))

(assert (=> b!210087 d!71231))

(declare-fun d!71233 () Bool)

(assert (=> d!71233 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398))) lt!329400) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 (_2!9660 lt!329398))) ((_ sign_extend 32) (currentBit!9661 (_2!9660 lt!329398)))) lt!329400))))

(declare-fun bs!17493 () Bool)

(assert (= bs!17493 d!71233))

(declare-fun m!324177 () Bool)

(assert (=> bs!17493 m!324177))

(assert (=> b!210087 d!71233))

(declare-fun d!71235 () Bool)

(assert (=> d!71235 (= (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329398)))) (and (bvsge (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9661 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9666 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329398)))) (and (= (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9666 thiss!1204) (size!4607 (buf!5124 (_2!9660 lt!329398))))))))))

(assert (=> b!210087 d!71235))

(declare-fun d!71237 () Bool)

(declare-fun e!143590 () Bool)

(assert (=> d!71237 e!143590))

(declare-fun res!176719 () Bool)

(assert (=> d!71237 (=> (not res!176719) (not e!143590))))

(declare-fun lt!330547 () tuple2!18014)

(assert (=> d!71237 (= res!176719 (isPrefixOf!0 (_1!9662 lt!330547) (_2!9662 lt!330547)))))

(declare-fun lt!330538 () BitStream!8322)

(assert (=> d!71237 (= lt!330547 (tuple2!18015 lt!330538 (_2!9660 lt!329411)))))

(declare-fun lt!330550 () Unit!14964)

(declare-fun lt!330531 () Unit!14964)

(assert (=> d!71237 (= lt!330550 lt!330531)))

(assert (=> d!71237 (isPrefixOf!0 lt!330538 (_2!9660 lt!329411))))

(assert (=> d!71237 (= lt!330531 (lemmaIsPrefixTransitive!0 lt!330538 (_2!9660 lt!329411) (_2!9660 lt!329411)))))

(declare-fun lt!330535 () Unit!14964)

(declare-fun lt!330541 () Unit!14964)

(assert (=> d!71237 (= lt!330535 lt!330541)))

(assert (=> d!71237 (isPrefixOf!0 lt!330538 (_2!9660 lt!329411))))

(assert (=> d!71237 (= lt!330541 (lemmaIsPrefixTransitive!0 lt!330538 (_2!9660 lt!329398) (_2!9660 lt!329411)))))

(declare-fun lt!330536 () Unit!14964)

(declare-fun e!143589 () Unit!14964)

(assert (=> d!71237 (= lt!330536 e!143589)))

(declare-fun c!10358 () Bool)

(assert (=> d!71237 (= c!10358 (not (= (size!4607 (buf!5124 (_2!9660 lt!329398))) #b00000000000000000000000000000000)))))

(declare-fun lt!330532 () Unit!14964)

(declare-fun lt!330539 () Unit!14964)

(assert (=> d!71237 (= lt!330532 lt!330539)))

(assert (=> d!71237 (isPrefixOf!0 (_2!9660 lt!329411) (_2!9660 lt!329411))))

(assert (=> d!71237 (= lt!330539 (lemmaIsPrefixRefl!0 (_2!9660 lt!329411)))))

(declare-fun lt!330543 () Unit!14964)

(declare-fun lt!330533 () Unit!14964)

(assert (=> d!71237 (= lt!330543 lt!330533)))

(assert (=> d!71237 (= lt!330533 (lemmaIsPrefixRefl!0 (_2!9660 lt!329411)))))

(declare-fun lt!330545 () Unit!14964)

(declare-fun lt!330544 () Unit!14964)

(assert (=> d!71237 (= lt!330545 lt!330544)))

(assert (=> d!71237 (isPrefixOf!0 lt!330538 lt!330538)))

(assert (=> d!71237 (= lt!330544 (lemmaIsPrefixRefl!0 lt!330538))))

(declare-fun lt!330548 () Unit!14964)

(declare-fun lt!330540 () Unit!14964)

(assert (=> d!71237 (= lt!330548 lt!330540)))

(assert (=> d!71237 (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!329398))))

(assert (=> d!71237 (= lt!330540 (lemmaIsPrefixRefl!0 (_2!9660 lt!329398)))))

(assert (=> d!71237 (= lt!330538 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(assert (=> d!71237 (isPrefixOf!0 (_2!9660 lt!329398) (_2!9660 lt!329411))))

(assert (=> d!71237 (= (reader!0 (_2!9660 lt!329398) (_2!9660 lt!329411)) lt!330547)))

(declare-fun b!210483 () Bool)

(declare-fun lt!330546 () Unit!14964)

(assert (=> b!210483 (= e!143589 lt!330546)))

(declare-fun lt!330542 () (_ BitVec 64))

(assert (=> b!210483 (= lt!330542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!330534 () (_ BitVec 64))

(assert (=> b!210483 (= lt!330534 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(assert (=> b!210483 (= lt!330546 (arrayBitRangesEqSymmetric!0 (buf!5124 (_2!9660 lt!329398)) (buf!5124 (_2!9660 lt!329411)) lt!330542 lt!330534))))

(assert (=> b!210483 (arrayBitRangesEq!0 (buf!5124 (_2!9660 lt!329411)) (buf!5124 (_2!9660 lt!329398)) lt!330542 lt!330534)))

(declare-fun b!210484 () Bool)

(declare-fun Unit!15006 () Unit!14964)

(assert (=> b!210484 (= e!143589 Unit!15006)))

(declare-fun b!210485 () Bool)

(declare-fun res!176718 () Bool)

(assert (=> b!210485 (=> (not res!176718) (not e!143590))))

(assert (=> b!210485 (= res!176718 (isPrefixOf!0 (_2!9662 lt!330547) (_2!9660 lt!329411)))))

(declare-fun lt!330537 () (_ BitVec 64))

(declare-fun b!210486 () Bool)

(declare-fun lt!330549 () (_ BitVec 64))

(assert (=> b!210486 (= e!143590 (= (_1!9662 lt!330547) (withMovedBitIndex!0 (_2!9662 lt!330547) (bvsub lt!330549 lt!330537))))))

(assert (=> b!210486 (or (= (bvand lt!330549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330549 lt!330537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210486 (= lt!330537 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329411))) (currentByte!9666 (_2!9660 lt!329411)) (currentBit!9661 (_2!9660 lt!329411))))))

(assert (=> b!210486 (= lt!330549 (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!329398))) (currentByte!9666 (_2!9660 lt!329398)) (currentBit!9661 (_2!9660 lt!329398))))))

(declare-fun b!210487 () Bool)

(declare-fun res!176717 () Bool)

(assert (=> b!210487 (=> (not res!176717) (not e!143590))))

(assert (=> b!210487 (= res!176717 (isPrefixOf!0 (_1!9662 lt!330547) (_2!9660 lt!329398)))))

(assert (= (and d!71237 c!10358) b!210483))

(assert (= (and d!71237 (not c!10358)) b!210484))

(assert (= (and d!71237 res!176719) b!210487))

(assert (= (and b!210487 res!176717) b!210485))

(assert (= (and b!210485 res!176718) b!210486))

(assert (=> d!71237 m!323431))

(assert (=> d!71237 m!324137))

(assert (=> d!71237 m!324139))

(declare-fun m!324179 () Bool)

(assert (=> d!71237 m!324179))

(declare-fun m!324181 () Bool)

(assert (=> d!71237 m!324181))

(declare-fun m!324183 () Bool)

(assert (=> d!71237 m!324183))

(declare-fun m!324185 () Bool)

(assert (=> d!71237 m!324185))

(declare-fun m!324187 () Bool)

(assert (=> d!71237 m!324187))

(declare-fun m!324189 () Bool)

(assert (=> d!71237 m!324189))

(assert (=> d!71237 m!324101))

(declare-fun m!324191 () Bool)

(assert (=> d!71237 m!324191))

(declare-fun m!324193 () Bool)

(assert (=> b!210485 m!324193))

(assert (=> b!210483 m!323417))

(declare-fun m!324195 () Bool)

(assert (=> b!210483 m!324195))

(declare-fun m!324197 () Bool)

(assert (=> b!210483 m!324197))

(declare-fun m!324199 () Bool)

(assert (=> b!210487 m!324199))

(declare-fun m!324201 () Bool)

(assert (=> b!210486 m!324201))

(assert (=> b!210486 m!323401))

(assert (=> b!210486 m!323417))

(assert (=> b!210087 d!71237))

(declare-fun d!71239 () Bool)

(assert (=> d!71239 (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 (_2!9660 lt!329411)))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)) lt!329404)))

(declare-fun lt!330551 () Unit!14964)

(assert (=> d!71239 (= lt!330551 (choose!9 thiss!1204 (buf!5124 (_2!9660 lt!329411)) lt!329404 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204))))))

(assert (=> d!71239 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5124 (_2!9660 lt!329411)) lt!329404) lt!330551)))

(declare-fun bs!17494 () Bool)

(assert (= bs!17494 d!71239))

(assert (=> bs!17494 m!323375))

(declare-fun m!324203 () Bool)

(assert (=> bs!17494 m!324203))

(assert (=> b!210087 d!71239))

(declare-fun d!71241 () Bool)

(declare-fun e!143593 () Bool)

(assert (=> d!71241 e!143593))

(declare-fun res!176722 () Bool)

(assert (=> d!71241 (=> (not res!176722) (not e!143593))))

(declare-fun lt!330563 () tuple2!18012)

(declare-fun lt!330562 () tuple2!18012)

(assert (=> d!71241 (= res!176722 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330563))) (currentByte!9666 (_1!9661 lt!330563)) (currentBit!9661 (_1!9661 lt!330563))) (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330562))) (currentByte!9666 (_1!9661 lt!330562)) (currentBit!9661 (_1!9661 lt!330562)))))))

(declare-fun lt!330561 () Unit!14964)

(declare-fun lt!330560 () BitStream!8322)

(declare-fun choose!50 (BitStream!8322 BitStream!8322 BitStream!8322 tuple2!18012 tuple2!18012 BitStream!8322 Bool tuple2!18012 tuple2!18012 BitStream!8322 Bool) Unit!14964)

(assert (=> d!71241 (= lt!330561 (choose!50 lt!329390 (_2!9660 lt!329411) lt!330560 lt!330563 (tuple2!18013 (_1!9661 lt!330563) (_2!9661 lt!330563)) (_1!9661 lt!330563) (_2!9661 lt!330563) lt!330562 (tuple2!18013 (_1!9661 lt!330562) (_2!9661 lt!330562)) (_1!9661 lt!330562) (_2!9661 lt!330562)))))

(assert (=> d!71241 (= lt!330562 (readBitPure!0 lt!330560))))

(assert (=> d!71241 (= lt!330563 (readBitPure!0 lt!329390))))

(assert (=> d!71241 (= lt!330560 (BitStream!8323 (buf!5124 (_2!9660 lt!329411)) (currentByte!9666 lt!329390) (currentBit!9661 lt!329390)))))

(assert (=> d!71241 (invariant!0 (currentBit!9661 lt!329390) (currentByte!9666 lt!329390) (size!4607 (buf!5124 (_2!9660 lt!329411))))))

(assert (=> d!71241 (= (readBitPrefixLemma!0 lt!329390 (_2!9660 lt!329411)) lt!330561)))

(declare-fun b!210490 () Bool)

(assert (=> b!210490 (= e!143593 (= (_2!9661 lt!330563) (_2!9661 lt!330562)))))

(assert (= (and d!71241 res!176722) b!210490))

(declare-fun m!324205 () Bool)

(assert (=> d!71241 m!324205))

(declare-fun m!324207 () Bool)

(assert (=> d!71241 m!324207))

(declare-fun m!324209 () Bool)

(assert (=> d!71241 m!324209))

(assert (=> d!71241 m!323359))

(declare-fun m!324211 () Bool)

(assert (=> d!71241 m!324211))

(declare-fun m!324213 () Bool)

(assert (=> d!71241 m!324213))

(assert (=> b!210087 d!71241))

(declare-fun d!71243 () Bool)

(declare-fun e!143594 () Bool)

(assert (=> d!71243 e!143594))

(declare-fun res!176723 () Bool)

(assert (=> d!71243 (=> (not res!176723) (not e!143594))))

(declare-fun lt!330567 () (_ BitVec 64))

(declare-fun lt!330566 () (_ BitVec 64))

(declare-fun lt!330565 () (_ BitVec 64))

(assert (=> d!71243 (= res!176723 (= lt!330565 (bvsub lt!330566 lt!330567)))))

(assert (=> d!71243 (or (= (bvand lt!330566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330566 lt!330567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71243 (= lt!330567 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329403)))) ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329403))) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329403)))))))

(declare-fun lt!330564 () (_ BitVec 64))

(declare-fun lt!330568 () (_ BitVec 64))

(assert (=> d!71243 (= lt!330566 (bvmul lt!330564 lt!330568))))

(assert (=> d!71243 (or (= lt!330564 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330568 (bvsdiv (bvmul lt!330564 lt!330568) lt!330564)))))

(assert (=> d!71243 (= lt!330568 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71243 (= lt!330564 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329403)))))))

(assert (=> d!71243 (= lt!330565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329403)))))))

(assert (=> d!71243 (invariant!0 (currentBit!9661 (_1!9661 lt!329403)) (currentByte!9666 (_1!9661 lt!329403)) (size!4607 (buf!5124 (_1!9661 lt!329403))))))

(assert (=> d!71243 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329403))) (currentByte!9666 (_1!9661 lt!329403)) (currentBit!9661 (_1!9661 lt!329403))) lt!330565)))

(declare-fun b!210491 () Bool)

(declare-fun res!176724 () Bool)

(assert (=> b!210491 (=> (not res!176724) (not e!143594))))

(assert (=> b!210491 (= res!176724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330565))))

(declare-fun b!210492 () Bool)

(declare-fun lt!330569 () (_ BitVec 64))

(assert (=> b!210492 (= e!143594 (bvsle lt!330565 (bvmul lt!330569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210492 (or (= lt!330569 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330569 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330569)))))

(assert (=> b!210492 (= lt!330569 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329403)))))))

(assert (= (and d!71243 res!176723) b!210491))

(assert (= (and b!210491 res!176724) b!210492))

(declare-fun m!324215 () Bool)

(assert (=> d!71243 m!324215))

(declare-fun m!324217 () Bool)

(assert (=> d!71243 m!324217))

(assert (=> b!210087 d!71243))

(declare-fun d!71245 () Bool)

(declare-fun e!143595 () Bool)

(assert (=> d!71245 e!143595))

(declare-fun res!176725 () Bool)

(assert (=> d!71245 (=> (not res!176725) (not e!143595))))

(declare-fun lt!330572 () (_ BitVec 64))

(declare-fun lt!330571 () (_ BitVec 64))

(declare-fun lt!330573 () (_ BitVec 64))

(assert (=> d!71245 (= res!176725 (= lt!330571 (bvsub lt!330572 lt!330573)))))

(assert (=> d!71245 (or (= (bvand lt!330572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330572 lt!330573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71245 (= lt!330573 (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329395)))) ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329395))) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329395)))))))

(declare-fun lt!330570 () (_ BitVec 64))

(declare-fun lt!330574 () (_ BitVec 64))

(assert (=> d!71245 (= lt!330572 (bvmul lt!330570 lt!330574))))

(assert (=> d!71245 (or (= lt!330570 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330574 (bvsdiv (bvmul lt!330570 lt!330574) lt!330570)))))

(assert (=> d!71245 (= lt!330574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71245 (= lt!330570 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329395)))))))

(assert (=> d!71245 (= lt!330571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9666 (_1!9661 lt!329395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9661 (_1!9661 lt!329395)))))))

(assert (=> d!71245 (invariant!0 (currentBit!9661 (_1!9661 lt!329395)) (currentByte!9666 (_1!9661 lt!329395)) (size!4607 (buf!5124 (_1!9661 lt!329395))))))

(assert (=> d!71245 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!329395))) (currentByte!9666 (_1!9661 lt!329395)) (currentBit!9661 (_1!9661 lt!329395))) lt!330571)))

(declare-fun b!210493 () Bool)

(declare-fun res!176726 () Bool)

(assert (=> b!210493 (=> (not res!176726) (not e!143595))))

(assert (=> b!210493 (= res!176726 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330571))))

(declare-fun b!210494 () Bool)

(declare-fun lt!330575 () (_ BitVec 64))

(assert (=> b!210494 (= e!143595 (bvsle lt!330571 (bvmul lt!330575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210494 (or (= lt!330575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330575)))))

(assert (=> b!210494 (= lt!330575 ((_ sign_extend 32) (size!4607 (buf!5124 (_1!9661 lt!329395)))))))

(assert (= (and d!71245 res!176725) b!210493))

(assert (= (and b!210493 res!176726) b!210494))

(declare-fun m!324219 () Bool)

(assert (=> d!71245 m!324219))

(declare-fun m!324221 () Bool)

(assert (=> d!71245 m!324221))

(assert (=> b!210087 d!71245))

(declare-fun d!71247 () Bool)

(assert (=> d!71247 (= (invariant!0 (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204))) (and (bvsge (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9661 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9666 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204))) (and (= (currentBit!9661 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9666 thiss!1204) (size!4607 (buf!5124 thiss!1204)))))))))

(assert (=> b!210070 d!71247))

(declare-fun d!71249 () Bool)

(assert (=> d!71249 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)) lt!329404) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204))) lt!329404))))

(declare-fun bs!17495 () Bool)

(assert (= bs!17495 d!71249))

(assert (=> bs!17495 m!323679))

(assert (=> b!210081 d!71249))

(declare-fun d!71251 () Bool)

(assert (=> d!71251 (= (invariant!0 (currentBit!9661 (_2!9660 lt!329411)) (currentByte!9666 (_2!9660 lt!329411)) (size!4607 (buf!5124 (_2!9660 lt!329411)))) (and (bvsge (currentBit!9661 (_2!9660 lt!329411)) #b00000000000000000000000000000000) (bvslt (currentBit!9661 (_2!9660 lt!329411)) #b00000000000000000000000000001000) (bvsge (currentByte!9666 (_2!9660 lt!329411)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9666 (_2!9660 lt!329411)) (size!4607 (buf!5124 (_2!9660 lt!329411)))) (and (= (currentBit!9661 (_2!9660 lt!329411)) #b00000000000000000000000000000000) (= (currentByte!9666 (_2!9660 lt!329411)) (size!4607 (buf!5124 (_2!9660 lt!329411))))))))))

(assert (=> b!210080 d!71251))

(assert (=> b!210079 d!71115))

(assert (=> b!210079 d!71117))

(declare-fun b!210506 () Bool)

(declare-fun e!143601 () Bool)

(declare-fun e!143600 () Bool)

(assert (=> b!210506 (= e!143601 e!143600)))

(declare-fun res!176735 () Bool)

(assert (=> b!210506 (=> (not res!176735) (not e!143600))))

(declare-fun lt!330587 () tuple2!18012)

(declare-fun lt!330585 () tuple2!18010)

(assert (=> b!210506 (= res!176735 (and (= (_2!9661 lt!330587) lt!329397) (= (_1!9661 lt!330587) (_2!9660 lt!330585))))))

(assert (=> b!210506 (= lt!330587 (readBitPure!0 (readerFrom!0 (_2!9660 lt!330585) (currentBit!9661 thiss!1204) (currentByte!9666 thiss!1204))))))

(declare-fun d!71253 () Bool)

(assert (=> d!71253 e!143601))

(declare-fun res!176736 () Bool)

(assert (=> d!71253 (=> (not res!176736) (not e!143601))))

(assert (=> d!71253 (= res!176736 (= (size!4607 (buf!5124 thiss!1204)) (size!4607 (buf!5124 (_2!9660 lt!330585)))))))

(declare-fun choose!16 (BitStream!8322 Bool) tuple2!18010)

(assert (=> d!71253 (= lt!330585 (choose!16 thiss!1204 lt!329397))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71253 (validate_offset_bit!0 ((_ sign_extend 32) (size!4607 (buf!5124 thiss!1204))) ((_ sign_extend 32) (currentByte!9666 thiss!1204)) ((_ sign_extend 32) (currentBit!9661 thiss!1204)))))

(assert (=> d!71253 (= (appendBit!0 thiss!1204 lt!329397) lt!330585)))

(declare-fun b!210505 () Bool)

(declare-fun res!176737 () Bool)

(assert (=> b!210505 (=> (not res!176737) (not e!143601))))

(assert (=> b!210505 (= res!176737 (isPrefixOf!0 thiss!1204 (_2!9660 lt!330585)))))

(declare-fun b!210504 () Bool)

(declare-fun res!176738 () Bool)

(assert (=> b!210504 (=> (not res!176738) (not e!143601))))

(declare-fun lt!330584 () (_ BitVec 64))

(declare-fun lt!330586 () (_ BitVec 64))

(assert (=> b!210504 (= res!176738 (= (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330585))) (currentByte!9666 (_2!9660 lt!330585)) (currentBit!9661 (_2!9660 lt!330585))) (bvadd lt!330586 lt!330584)))))

(assert (=> b!210504 (or (not (= (bvand lt!330586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330584 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330586 lt!330584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210504 (= lt!330584 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!210504 (= lt!330586 (bitIndex!0 (size!4607 (buf!5124 thiss!1204)) (currentByte!9666 thiss!1204) (currentBit!9661 thiss!1204)))))

(declare-fun b!210507 () Bool)

(assert (=> b!210507 (= e!143600 (= (bitIndex!0 (size!4607 (buf!5124 (_1!9661 lt!330587))) (currentByte!9666 (_1!9661 lt!330587)) (currentBit!9661 (_1!9661 lt!330587))) (bitIndex!0 (size!4607 (buf!5124 (_2!9660 lt!330585))) (currentByte!9666 (_2!9660 lt!330585)) (currentBit!9661 (_2!9660 lt!330585)))))))

(assert (= (and d!71253 res!176736) b!210504))

(assert (= (and b!210504 res!176738) b!210505))

(assert (= (and b!210505 res!176737) b!210506))

(assert (= (and b!210506 res!176735) b!210507))

(declare-fun m!324223 () Bool)

(assert (=> b!210506 m!324223))

(assert (=> b!210506 m!324223))

(declare-fun m!324225 () Bool)

(assert (=> b!210506 m!324225))

(declare-fun m!324227 () Bool)

(assert (=> d!71253 m!324227))

(declare-fun m!324229 () Bool)

(assert (=> d!71253 m!324229))

(declare-fun m!324231 () Bool)

(assert (=> b!210507 m!324231))

(declare-fun m!324233 () Bool)

(assert (=> b!210507 m!324233))

(assert (=> b!210504 m!324233))

(assert (=> b!210504 m!323419))

(declare-fun m!324235 () Bool)

(assert (=> b!210505 m!324235))

(assert (=> b!210079 d!71253))

(check-sat (not b!210448) (not d!71219) (not d!71245) (not d!71241) (not d!71233) (not d!71207) (not d!71201) (not b!210446) (not b!210252) (not d!71249) (not d!71215) (not b!210239) (not b!210465) (not d!71229) (not b!210458) (not d!71211) (not b!210487) (not b!210455) (not b!210456) (not b!210449) (not d!71203) (not d!71197) (not d!71237) (not b!210482) (not b!210478) (not d!71117) (not b!210504) (not d!71227) (not d!71231) (not b!210486) (not b!210480) (not d!71239) (not b!210440) (not d!71209) (not b!210506) (not b!210505) (not d!71127) (not d!71253) (not d!71121) (not d!71125) (not b!210452) (not d!71243) (not b!210507) (not b!210450) (not b!210241) (not d!71199) (not b!210483) (not d!71213) (not b!210447) (not b!210443) (not d!71225) (not b!210254) (not b!210485) (not d!71115) (not bm!3312) (not d!71223) (not d!71221) (not b!210481) (not b!210454))
(check-sat)
