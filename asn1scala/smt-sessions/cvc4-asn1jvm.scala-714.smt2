; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20000 () Bool)

(assert start!20000)

(declare-fun b!99776 () Bool)

(declare-fun e!65306 () Bool)

(declare-datatypes ((array!4699 0))(
  ( (array!4700 (arr!2738 (Array (_ BitVec 32) (_ BitVec 8))) (size!2145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3764 0))(
  ( (BitStream!3765 (buf!2502 array!4699) (currentByte!4948 (_ BitVec 32)) (currentBit!4943 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3764)

(declare-fun array_inv!1947 (array!4699) Bool)

(assert (=> b!99776 (= e!65306 (array_inv!1947 (buf!2502 thiss!1305)))))

(declare-fun b!99777 () Bool)

(declare-fun res!81893 () Bool)

(declare-fun e!65303 () Bool)

(assert (=> b!99777 (=> res!81893 e!65303)))

(declare-datatypes ((Unit!6117 0))(
  ( (Unit!6118) )
))
(declare-datatypes ((tuple2!8046 0))(
  ( (tuple2!8047 (_1!4278 Unit!6117) (_2!4278 BitStream!3764)) )
))
(declare-fun lt!144527 () tuple2!8046)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99777 (= res!81893 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2145 (buf!2502 (_2!4278 lt!144527)))) ((_ sign_extend 32) (currentByte!4948 thiss!1305)) ((_ sign_extend 32) (currentBit!4943 thiss!1305)))))))

(declare-fun b!99778 () Bool)

(declare-fun e!65305 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99778 (= e!65305 (invariant!0 (currentBit!4943 thiss!1305) (currentByte!4948 thiss!1305) (size!2145 (buf!2502 (_2!4278 lt!144527)))))))

(declare-fun b!99779 () Bool)

(declare-fun res!81885 () Bool)

(declare-fun e!65307 () Bool)

(assert (=> b!99779 (=> (not res!81885) (not e!65307))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99779 (= res!81885 (validate_offset_bits!1 ((_ sign_extend 32) (size!2145 (buf!2502 thiss!1305))) ((_ sign_extend 32) (currentByte!4948 thiss!1305)) ((_ sign_extend 32) (currentBit!4943 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99781 () Bool)

(declare-fun res!81888 () Bool)

(assert (=> b!99781 (=> (not res!81888) (not e!65307))))

(assert (=> b!99781 (= res!81888 (bvslt i!615 nBits!396))))

(declare-fun b!99782 () Bool)

(assert (=> b!99782 (= e!65303 true)))

(declare-datatypes ((tuple2!8048 0))(
  ( (tuple2!8049 (_1!4279 BitStream!3764) (_2!4279 Bool)) )
))
(declare-fun lt!144522 () tuple2!8048)

(declare-fun lt!144526 () tuple2!8046)

(declare-fun readBitPure!0 (BitStream!3764) tuple2!8048)

(assert (=> b!99782 (= lt!144522 (readBitPure!0 (BitStream!3765 (buf!2502 (_2!4278 lt!144526)) (currentByte!4948 thiss!1305) (currentBit!4943 thiss!1305))))))

(declare-fun lt!144521 () tuple2!8048)

(assert (=> b!99782 (= lt!144521 (readBitPure!0 (BitStream!3765 (buf!2502 (_2!4278 lt!144527)) (currentByte!4948 thiss!1305) (currentBit!4943 thiss!1305))))))

(assert (=> b!99782 (invariant!0 (currentBit!4943 thiss!1305) (currentByte!4948 thiss!1305) (size!2145 (buf!2502 (_2!4278 lt!144526))))))

(declare-fun b!99783 () Bool)

(declare-fun e!65309 () Bool)

(declare-fun lt!144523 () tuple2!8048)

(declare-fun lt!144525 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99783 (= e!65309 (= (bitIndex!0 (size!2145 (buf!2502 (_1!4279 lt!144523))) (currentByte!4948 (_1!4279 lt!144523)) (currentBit!4943 (_1!4279 lt!144523))) lt!144525))))

(declare-fun b!99784 () Bool)

(assert (=> b!99784 (= e!65307 (not e!65303))))

(declare-fun res!81890 () Bool)

(assert (=> b!99784 (=> res!81890 e!65303)))

(assert (=> b!99784 (= res!81890 (not (= (size!2145 (buf!2502 (_2!4278 lt!144527))) (size!2145 (buf!2502 (_2!4278 lt!144526))))))))

(assert (=> b!99784 e!65305))

(declare-fun res!81895 () Bool)

(assert (=> b!99784 (=> (not res!81895) (not e!65305))))

(declare-fun isPrefixOf!0 (BitStream!3764 BitStream!3764) Bool)

(assert (=> b!99784 (= res!81895 (isPrefixOf!0 thiss!1305 (_2!4278 lt!144526)))))

(declare-fun lt!144524 () Unit!6117)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3764 BitStream!3764 BitStream!3764) Unit!6117)

(assert (=> b!99784 (= lt!144524 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4278 lt!144527) (_2!4278 lt!144526)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8046)

(assert (=> b!99784 (= lt!144526 (appendNLeastSignificantBitsLoop!0 (_2!4278 lt!144527) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65304 () Bool)

(assert (=> b!99784 e!65304))

(declare-fun res!81886 () Bool)

(assert (=> b!99784 (=> (not res!81886) (not e!65304))))

(assert (=> b!99784 (= res!81886 (= (size!2145 (buf!2502 thiss!1305)) (size!2145 (buf!2502 (_2!4278 lt!144527)))))))

(declare-fun lt!144529 () Bool)

(declare-fun appendBit!0 (BitStream!3764 Bool) tuple2!8046)

(assert (=> b!99784 (= lt!144527 (appendBit!0 thiss!1305 lt!144529))))

(assert (=> b!99784 (= lt!144529 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99785 () Bool)

(declare-fun res!81896 () Bool)

(declare-fun e!65308 () Bool)

(assert (=> b!99785 (=> (not res!81896) (not e!65308))))

(assert (=> b!99785 (= res!81896 (isPrefixOf!0 thiss!1305 (_2!4278 lt!144527)))))

(declare-fun b!99786 () Bool)

(assert (=> b!99786 (= e!65304 e!65308)))

(declare-fun res!81889 () Bool)

(assert (=> b!99786 (=> (not res!81889) (not e!65308))))

(declare-fun lt!144528 () (_ BitVec 64))

(assert (=> b!99786 (= res!81889 (= lt!144525 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144528)))))

(assert (=> b!99786 (= lt!144525 (bitIndex!0 (size!2145 (buf!2502 (_2!4278 lt!144527))) (currentByte!4948 (_2!4278 lt!144527)) (currentBit!4943 (_2!4278 lt!144527))))))

(assert (=> b!99786 (= lt!144528 (bitIndex!0 (size!2145 (buf!2502 thiss!1305)) (currentByte!4948 thiss!1305) (currentBit!4943 thiss!1305)))))

(declare-fun b!99787 () Bool)

(declare-fun res!81887 () Bool)

(assert (=> b!99787 (=> res!81887 e!65303)))

(declare-fun arrayBitRangesEq!0 (array!4699 array!4699 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99787 (= res!81887 (not (arrayBitRangesEq!0 (buf!2502 (_2!4278 lt!144527)) (buf!2502 (_2!4278 lt!144526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2145 (buf!2502 (_2!4278 lt!144527))) (currentByte!4948 thiss!1305) (currentBit!4943 thiss!1305))))))))

(declare-fun b!99788 () Bool)

(assert (=> b!99788 (= e!65308 e!65309)))

(declare-fun res!81894 () Bool)

(assert (=> b!99788 (=> (not res!81894) (not e!65309))))

(assert (=> b!99788 (= res!81894 (and (= (_2!4279 lt!144523) lt!144529) (= (_1!4279 lt!144523) (_2!4278 lt!144527))))))

(declare-fun readerFrom!0 (BitStream!3764 (_ BitVec 32) (_ BitVec 32)) BitStream!3764)

(assert (=> b!99788 (= lt!144523 (readBitPure!0 (readerFrom!0 (_2!4278 lt!144527) (currentBit!4943 thiss!1305) (currentByte!4948 thiss!1305))))))

(declare-fun res!81892 () Bool)

(assert (=> start!20000 (=> (not res!81892) (not e!65307))))

(assert (=> start!20000 (= res!81892 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20000 e!65307))

(assert (=> start!20000 true))

(declare-fun inv!12 (BitStream!3764) Bool)

(assert (=> start!20000 (and (inv!12 thiss!1305) e!65306)))

(declare-fun b!99780 () Bool)

(declare-fun res!81891 () Bool)

(assert (=> b!99780 (=> (not res!81891) (not e!65307))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99780 (= res!81891 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20000 res!81892) b!99779))

(assert (= (and b!99779 res!81885) b!99780))

(assert (= (and b!99780 res!81891) b!99781))

(assert (= (and b!99781 res!81888) b!99784))

(assert (= (and b!99784 res!81886) b!99786))

(assert (= (and b!99786 res!81889) b!99785))

(assert (= (and b!99785 res!81896) b!99788))

(assert (= (and b!99788 res!81894) b!99783))

(assert (= (and b!99784 res!81895) b!99778))

(assert (= (and b!99784 (not res!81890)) b!99777))

(assert (= (and b!99777 (not res!81893)) b!99787))

(assert (= (and b!99787 (not res!81887)) b!99782))

(assert (= start!20000 b!99776))

(declare-fun m!145105 () Bool)

(assert (=> b!99779 m!145105))

(declare-fun m!145107 () Bool)

(assert (=> b!99783 m!145107))

(declare-fun m!145109 () Bool)

(assert (=> b!99776 m!145109))

(declare-fun m!145111 () Bool)

(assert (=> b!99787 m!145111))

(declare-fun m!145113 () Bool)

(assert (=> b!99787 m!145113))

(declare-fun m!145115 () Bool)

(assert (=> b!99786 m!145115))

(declare-fun m!145117 () Bool)

(assert (=> b!99786 m!145117))

(declare-fun m!145119 () Bool)

(assert (=> b!99780 m!145119))

(declare-fun m!145121 () Bool)

(assert (=> b!99784 m!145121))

(declare-fun m!145123 () Bool)

(assert (=> b!99784 m!145123))

(declare-fun m!145125 () Bool)

(assert (=> b!99784 m!145125))

(declare-fun m!145127 () Bool)

(assert (=> b!99784 m!145127))

(declare-fun m!145129 () Bool)

(assert (=> b!99785 m!145129))

(declare-fun m!145131 () Bool)

(assert (=> b!99782 m!145131))

(declare-fun m!145133 () Bool)

(assert (=> b!99782 m!145133))

(declare-fun m!145135 () Bool)

(assert (=> b!99782 m!145135))

(declare-fun m!145137 () Bool)

(assert (=> b!99788 m!145137))

(assert (=> b!99788 m!145137))

(declare-fun m!145139 () Bool)

(assert (=> b!99788 m!145139))

(declare-fun m!145141 () Bool)

(assert (=> b!99777 m!145141))

(declare-fun m!145143 () Bool)

(assert (=> start!20000 m!145143))

(declare-fun m!145145 () Bool)

(assert (=> b!99778 m!145145))

(push 1)

(assert (not b!99783))

(assert (not b!99782))

(assert (not start!20000))

(assert (not b!99788))

(assert (not b!99786))

(assert (not b!99784))

(assert (not b!99787))

(assert (not b!99785))

(assert (not b!99776))

(assert (not b!99779))

(assert (not b!99777))

(assert (not b!99780))

(assert (not b!99778))

(check-sat)

