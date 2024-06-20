; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39616 () Bool)

(assert start!39616)

(declare-fun b!178889 () Bool)

(declare-fun e!124486 () Bool)

(declare-fun e!124493 () Bool)

(assert (=> b!178889 (= e!124486 e!124493)))

(declare-fun res!148411 () Bool)

(assert (=> b!178889 (=> res!148411 e!124493)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!274446 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!274450 () (_ BitVec 64))

(assert (=> b!178889 (= res!148411 (not (= lt!274450 (bvsub (bvsub (bvadd lt!274446 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9631 0))(
  ( (array!9632 (arr!5177 (Array (_ BitVec 32) (_ BitVec 8))) (size!4247 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7602 0))(
  ( (BitStream!7603 (buf!4690 array!9631) (currentByte!8888 (_ BitVec 32)) (currentBit!8883 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12874 0))(
  ( (Unit!12875) )
))
(declare-datatypes ((tuple2!15420 0))(
  ( (tuple2!15421 (_1!8355 Unit!12874) (_2!8355 BitStream!7602)) )
))
(declare-fun lt!274441 () tuple2!15420)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178889 (= lt!274450 (bitIndex!0 (size!4247 (buf!4690 (_2!8355 lt!274441))) (currentByte!8888 (_2!8355 lt!274441)) (currentBit!8883 (_2!8355 lt!274441))))))

(declare-fun thiss!1204 () BitStream!7602)

(declare-fun isPrefixOf!0 (BitStream!7602 BitStream!7602) Bool)

(assert (=> b!178889 (isPrefixOf!0 thiss!1204 (_2!8355 lt!274441))))

(declare-fun lt!274454 () tuple2!15420)

(declare-fun lt!274445 () Unit!12874)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7602 BitStream!7602 BitStream!7602) Unit!12874)

(assert (=> b!178889 (= lt!274445 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8355 lt!274454) (_2!8355 lt!274441)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15420)

(assert (=> b!178889 (= lt!274441 (appendBitsLSBFirstLoopTR!0 (_2!8355 lt!274454) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178890 () Bool)

(declare-fun res!148409 () Bool)

(assert (=> b!178890 (=> res!148409 e!124493)))

(declare-fun lt!274443 () (_ BitVec 64))

(assert (=> b!178890 (= res!148409 (or (not (= (size!4247 (buf!4690 (_2!8355 lt!274441))) (size!4247 (buf!4690 thiss!1204)))) (not (= lt!274450 (bvsub (bvadd lt!274443 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178891 () Bool)

(declare-fun e!124488 () Bool)

(declare-fun array_inv!3988 (array!9631) Bool)

(assert (=> b!178891 (= e!124488 (array_inv!3988 (buf!4690 thiss!1204)))))

(declare-fun res!148412 () Bool)

(declare-fun e!124492 () Bool)

(assert (=> start!39616 (=> (not res!148412) (not e!124492))))

(assert (=> start!39616 (= res!148412 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39616 e!124492))

(assert (=> start!39616 true))

(declare-fun inv!12 (BitStream!7602) Bool)

(assert (=> start!39616 (and (inv!12 thiss!1204) e!124488)))

(declare-fun b!178892 () Bool)

(declare-fun res!148418 () Bool)

(assert (=> b!178892 (=> (not res!148418) (not e!124492))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178892 (= res!148418 (invariant!0 (currentBit!8883 thiss!1204) (currentByte!8888 thiss!1204) (size!4247 (buf!4690 thiss!1204))))))

(declare-fun b!178893 () Bool)

(declare-fun res!148415 () Bool)

(assert (=> b!178893 (=> res!148415 e!124493)))

(assert (=> b!178893 (= res!148415 (not (invariant!0 (currentBit!8883 (_2!8355 lt!274441)) (currentByte!8888 (_2!8355 lt!274441)) (size!4247 (buf!4690 (_2!8355 lt!274441))))))))

(declare-fun b!178894 () Bool)

(assert (=> b!178894 (= e!124492 (not e!124486))))

(declare-fun res!148414 () Bool)

(assert (=> b!178894 (=> res!148414 e!124486)))

(assert (=> b!178894 (= res!148414 (not (= lt!274446 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274443))))))

(assert (=> b!178894 (= lt!274446 (bitIndex!0 (size!4247 (buf!4690 (_2!8355 lt!274454))) (currentByte!8888 (_2!8355 lt!274454)) (currentBit!8883 (_2!8355 lt!274454))))))

(assert (=> b!178894 (= lt!274443 (bitIndex!0 (size!4247 (buf!4690 thiss!1204)) (currentByte!8888 thiss!1204) (currentBit!8883 thiss!1204)))))

(declare-fun e!124494 () Bool)

(assert (=> b!178894 e!124494))

(declare-fun res!148413 () Bool)

(assert (=> b!178894 (=> (not res!148413) (not e!124494))))

(assert (=> b!178894 (= res!148413 (= (size!4247 (buf!4690 thiss!1204)) (size!4247 (buf!4690 (_2!8355 lt!274454)))))))

(declare-fun lt!274447 () Bool)

(declare-fun appendBit!0 (BitStream!7602 Bool) tuple2!15420)

(assert (=> b!178894 (= lt!274454 (appendBit!0 thiss!1204 lt!274447))))

(assert (=> b!178894 (= lt!274447 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178895 () Bool)

(declare-fun e!124491 () Bool)

(declare-datatypes ((tuple2!15422 0))(
  ( (tuple2!15423 (_1!8356 BitStream!7602) (_2!8356 Bool)) )
))
(declare-fun lt!274444 () tuple2!15422)

(declare-fun lt!274449 () (_ BitVec 64))

(assert (=> b!178895 (= e!124491 (= (bitIndex!0 (size!4247 (buf!4690 (_1!8356 lt!274444))) (currentByte!8888 (_1!8356 lt!274444)) (currentBit!8883 (_1!8356 lt!274444))) lt!274449))))

(declare-fun b!178896 () Bool)

(declare-fun e!124495 () Bool)

(declare-fun lt!274451 () tuple2!15422)

(declare-fun lt!274453 () tuple2!15422)

(assert (=> b!178896 (= e!124495 (= (_2!8356 lt!274451) (_2!8356 lt!274453)))))

(declare-fun b!178897 () Bool)

(declare-fun e!124489 () Bool)

(assert (=> b!178897 (= e!124489 (invariant!0 (currentBit!8883 thiss!1204) (currentByte!8888 thiss!1204) (size!4247 (buf!4690 (_2!8355 lt!274441)))))))

(declare-fun b!178898 () Bool)

(declare-fun res!148419 () Bool)

(assert (=> b!178898 (=> (not res!148419) (not e!124492))))

(assert (=> b!178898 (= res!148419 (not (= i!590 nBits!348)))))

(declare-fun b!178899 () Bool)

(declare-fun res!148404 () Bool)

(assert (=> b!178899 (=> res!148404 e!124493)))

(assert (=> b!178899 (= res!148404 (not (isPrefixOf!0 (_2!8355 lt!274454) (_2!8355 lt!274441))))))

(declare-fun b!178900 () Bool)

(declare-fun res!148405 () Bool)

(assert (=> b!178900 (=> (not res!148405) (not e!124492))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178900 (= res!148405 (validate_offset_bits!1 ((_ sign_extend 32) (size!4247 (buf!4690 thiss!1204))) ((_ sign_extend 32) (currentByte!8888 thiss!1204)) ((_ sign_extend 32) (currentBit!8883 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178901 () Bool)

(declare-fun e!124490 () Bool)

(assert (=> b!178901 (= e!124490 e!124491)))

(declare-fun res!148407 () Bool)

(assert (=> b!178901 (=> (not res!148407) (not e!124491))))

(assert (=> b!178901 (= res!148407 (and (= (_2!8356 lt!274444) lt!274447) (= (_1!8356 lt!274444) (_2!8355 lt!274454))))))

(declare-fun readBitPure!0 (BitStream!7602) tuple2!15422)

(declare-fun readerFrom!0 (BitStream!7602 (_ BitVec 32) (_ BitVec 32)) BitStream!7602)

(assert (=> b!178901 (= lt!274444 (readBitPure!0 (readerFrom!0 (_2!8355 lt!274454) (currentBit!8883 thiss!1204) (currentByte!8888 thiss!1204))))))

(declare-fun b!178902 () Bool)

(declare-fun res!148417 () Bool)

(assert (=> b!178902 (=> res!148417 e!124493)))

(assert (=> b!178902 (= res!148417 (not (isPrefixOf!0 thiss!1204 (_2!8355 lt!274454))))))

(declare-fun b!178903 () Bool)

(assert (=> b!178903 (= e!124493 true)))

(assert (=> b!178903 e!124495))

(declare-fun res!148416 () Bool)

(assert (=> b!178903 (=> (not res!148416) (not e!124495))))

(assert (=> b!178903 (= res!148416 (= (bitIndex!0 (size!4247 (buf!4690 (_1!8356 lt!274451))) (currentByte!8888 (_1!8356 lt!274451)) (currentBit!8883 (_1!8356 lt!274451))) (bitIndex!0 (size!4247 (buf!4690 (_1!8356 lt!274453))) (currentByte!8888 (_1!8356 lt!274453)) (currentBit!8883 (_1!8356 lt!274453)))))))

(declare-fun lt!274452 () Unit!12874)

(declare-fun lt!274442 () BitStream!7602)

(declare-fun readBitPrefixLemma!0 (BitStream!7602 BitStream!7602) Unit!12874)

(assert (=> b!178903 (= lt!274452 (readBitPrefixLemma!0 lt!274442 (_2!8355 lt!274441)))))

(assert (=> b!178903 (= lt!274453 (readBitPure!0 (BitStream!7603 (buf!4690 (_2!8355 lt!274441)) (currentByte!8888 thiss!1204) (currentBit!8883 thiss!1204))))))

(assert (=> b!178903 (= lt!274451 (readBitPure!0 lt!274442))))

(assert (=> b!178903 e!124489))

(declare-fun res!148410 () Bool)

(assert (=> b!178903 (=> (not res!148410) (not e!124489))))

(assert (=> b!178903 (= res!148410 (invariant!0 (currentBit!8883 thiss!1204) (currentByte!8888 thiss!1204) (size!4247 (buf!4690 (_2!8355 lt!274454)))))))

(assert (=> b!178903 (= lt!274442 (BitStream!7603 (buf!4690 (_2!8355 lt!274454)) (currentByte!8888 thiss!1204) (currentBit!8883 thiss!1204)))))

(declare-fun b!178904 () Bool)

(assert (=> b!178904 (= e!124494 e!124490)))

(declare-fun res!148406 () Bool)

(assert (=> b!178904 (=> (not res!148406) (not e!124490))))

(declare-fun lt!274448 () (_ BitVec 64))

(assert (=> b!178904 (= res!148406 (= lt!274449 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274448)))))

(assert (=> b!178904 (= lt!274449 (bitIndex!0 (size!4247 (buf!4690 (_2!8355 lt!274454))) (currentByte!8888 (_2!8355 lt!274454)) (currentBit!8883 (_2!8355 lt!274454))))))

(assert (=> b!178904 (= lt!274448 (bitIndex!0 (size!4247 (buf!4690 thiss!1204)) (currentByte!8888 thiss!1204) (currentBit!8883 thiss!1204)))))

(declare-fun b!178905 () Bool)

(declare-fun res!148408 () Bool)

(assert (=> b!178905 (=> (not res!148408) (not e!124490))))

(assert (=> b!178905 (= res!148408 (isPrefixOf!0 thiss!1204 (_2!8355 lt!274454)))))

(assert (= (and start!39616 res!148412) b!178900))

(assert (= (and b!178900 res!148405) b!178892))

(assert (= (and b!178892 res!148418) b!178898))

(assert (= (and b!178898 res!148419) b!178894))

(assert (= (and b!178894 res!148413) b!178904))

(assert (= (and b!178904 res!148406) b!178905))

(assert (= (and b!178905 res!148408) b!178901))

(assert (= (and b!178901 res!148407) b!178895))

(assert (= (and b!178894 (not res!148414)) b!178889))

(assert (= (and b!178889 (not res!148411)) b!178893))

(assert (= (and b!178893 (not res!148415)) b!178890))

(assert (= (and b!178890 (not res!148409)) b!178899))

(assert (= (and b!178899 (not res!148404)) b!178902))

(assert (= (and b!178902 (not res!148417)) b!178903))

(assert (= (and b!178903 res!148410) b!178897))

(assert (= (and b!178903 res!148416) b!178896))

(assert (= start!39616 b!178891))

(declare-fun m!278971 () Bool)

(assert (=> b!178903 m!278971))

(declare-fun m!278973 () Bool)

(assert (=> b!178903 m!278973))

(declare-fun m!278975 () Bool)

(assert (=> b!178903 m!278975))

(declare-fun m!278977 () Bool)

(assert (=> b!178903 m!278977))

(declare-fun m!278979 () Bool)

(assert (=> b!178903 m!278979))

(declare-fun m!278981 () Bool)

(assert (=> b!178903 m!278981))

(declare-fun m!278983 () Bool)

(assert (=> b!178892 m!278983))

(declare-fun m!278985 () Bool)

(assert (=> b!178894 m!278985))

(declare-fun m!278987 () Bool)

(assert (=> b!178894 m!278987))

(declare-fun m!278989 () Bool)

(assert (=> b!178894 m!278989))

(declare-fun m!278991 () Bool)

(assert (=> b!178895 m!278991))

(declare-fun m!278993 () Bool)

(assert (=> start!39616 m!278993))

(declare-fun m!278995 () Bool)

(assert (=> b!178891 m!278995))

(declare-fun m!278997 () Bool)

(assert (=> b!178900 m!278997))

(declare-fun m!278999 () Bool)

(assert (=> b!178905 m!278999))

(assert (=> b!178904 m!278985))

(assert (=> b!178904 m!278987))

(declare-fun m!279001 () Bool)

(assert (=> b!178899 m!279001))

(assert (=> b!178902 m!278999))

(declare-fun m!279003 () Bool)

(assert (=> b!178889 m!279003))

(declare-fun m!279005 () Bool)

(assert (=> b!178889 m!279005))

(declare-fun m!279007 () Bool)

(assert (=> b!178889 m!279007))

(declare-fun m!279009 () Bool)

(assert (=> b!178889 m!279009))

(declare-fun m!279011 () Bool)

(assert (=> b!178901 m!279011))

(assert (=> b!178901 m!279011))

(declare-fun m!279013 () Bool)

(assert (=> b!178901 m!279013))

(declare-fun m!279015 () Bool)

(assert (=> b!178897 m!279015))

(declare-fun m!279017 () Bool)

(assert (=> b!178893 m!279017))

(check-sat (not b!178889) (not b!178899) (not b!178892) (not b!178893) (not b!178902) (not b!178900) (not b!178904) (not b!178903) (not b!178891) (not b!178895) (not b!178905) (not b!178894) (not start!39616) (not b!178897) (not b!178901))
