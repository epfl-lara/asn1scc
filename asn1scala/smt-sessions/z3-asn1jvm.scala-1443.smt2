; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39610 () Bool)

(assert start!39610)

(declare-fun b!178732 () Bool)

(declare-fun e!124407 () Bool)

(declare-fun e!124400 () Bool)

(assert (=> b!178732 (= e!124407 e!124400)))

(declare-fun res!148267 () Bool)

(assert (=> b!178732 (=> res!148267 e!124400)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!274324 () (_ BitVec 64))

(declare-fun lt!274331 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178732 (= res!148267 (not (= lt!274331 (bvsub (bvsub (bvadd lt!274324 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9625 0))(
  ( (array!9626 (arr!5174 (Array (_ BitVec 32) (_ BitVec 8))) (size!4244 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7596 0))(
  ( (BitStream!7597 (buf!4687 array!9625) (currentByte!8885 (_ BitVec 32)) (currentBit!8880 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12868 0))(
  ( (Unit!12869) )
))
(declare-datatypes ((tuple2!15408 0))(
  ( (tuple2!15409 (_1!8349 Unit!12868) (_2!8349 BitStream!7596)) )
))
(declare-fun lt!274325 () tuple2!15408)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178732 (= lt!274331 (bitIndex!0 (size!4244 (buf!4687 (_2!8349 lt!274325))) (currentByte!8885 (_2!8349 lt!274325)) (currentBit!8880 (_2!8349 lt!274325))))))

(declare-fun thiss!1204 () BitStream!7596)

(declare-fun isPrefixOf!0 (BitStream!7596 BitStream!7596) Bool)

(assert (=> b!178732 (isPrefixOf!0 thiss!1204 (_2!8349 lt!274325))))

(declare-fun lt!274334 () Unit!12868)

(declare-fun lt!274329 () tuple2!15408)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7596 BitStream!7596 BitStream!7596) Unit!12868)

(assert (=> b!178732 (= lt!274334 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8349 lt!274329) (_2!8349 lt!274325)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15408)

(assert (=> b!178732 (= lt!274325 (appendBitsLSBFirstLoopTR!0 (_2!8349 lt!274329) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178733 () Bool)

(declare-fun e!124406 () Bool)

(declare-fun e!124405 () Bool)

(assert (=> b!178733 (= e!124406 e!124405)))

(declare-fun res!148260 () Bool)

(assert (=> b!178733 (=> (not res!148260) (not e!124405))))

(declare-fun lt!274333 () (_ BitVec 64))

(declare-fun lt!274328 () (_ BitVec 64))

(assert (=> b!178733 (= res!148260 (= lt!274333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274328)))))

(assert (=> b!178733 (= lt!274333 (bitIndex!0 (size!4244 (buf!4687 (_2!8349 lt!274329))) (currentByte!8885 (_2!8349 lt!274329)) (currentBit!8880 (_2!8349 lt!274329))))))

(assert (=> b!178733 (= lt!274328 (bitIndex!0 (size!4244 (buf!4687 thiss!1204)) (currentByte!8885 thiss!1204) (currentBit!8880 thiss!1204)))))

(declare-fun b!178734 () Bool)

(declare-fun e!124403 () Bool)

(declare-fun array_inv!3985 (array!9625) Bool)

(assert (=> b!178734 (= e!124403 (array_inv!3985 (buf!4687 thiss!1204)))))

(declare-fun b!178735 () Bool)

(declare-fun res!148271 () Bool)

(assert (=> b!178735 (=> res!148271 e!124400)))

(assert (=> b!178735 (= res!148271 (not (isPrefixOf!0 (_2!8349 lt!274329) (_2!8349 lt!274325))))))

(declare-fun b!178736 () Bool)

(declare-fun e!124402 () Bool)

(assert (=> b!178736 (= e!124400 e!124402)))

(declare-fun res!148256 () Bool)

(assert (=> b!178736 (=> res!148256 e!124402)))

(assert (=> b!178736 (= res!148256 (not (= (size!4244 (buf!4687 (_2!8349 lt!274329))) (size!4244 (buf!4687 (_2!8349 lt!274325))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178736 (invariant!0 (currentBit!8880 thiss!1204) (currentByte!8885 thiss!1204) (size!4244 (buf!4687 (_2!8349 lt!274329))))))

(declare-fun b!178737 () Bool)

(declare-fun res!148261 () Bool)

(declare-fun e!124401 () Bool)

(assert (=> b!178737 (=> (not res!148261) (not e!124401))))

(assert (=> b!178737 (= res!148261 (not (= i!590 nBits!348)))))

(declare-fun res!148265 () Bool)

(assert (=> start!39610 (=> (not res!148265) (not e!124401))))

(assert (=> start!39610 (= res!148265 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39610 e!124401))

(assert (=> start!39610 true))

(declare-fun inv!12 (BitStream!7596) Bool)

(assert (=> start!39610 (and (inv!12 thiss!1204) e!124403)))

(declare-fun b!178738 () Bool)

(declare-fun res!148270 () Bool)

(assert (=> b!178738 (=> (not res!148270) (not e!124401))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178738 (= res!148270 (validate_offset_bits!1 ((_ sign_extend 32) (size!4244 (buf!4687 thiss!1204))) ((_ sign_extend 32) (currentByte!8885 thiss!1204)) ((_ sign_extend 32) (currentBit!8880 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178739 () Bool)

(declare-fun res!148266 () Bool)

(assert (=> b!178739 (=> (not res!148266) (not e!124405))))

(assert (=> b!178739 (= res!148266 (isPrefixOf!0 thiss!1204 (_2!8349 lt!274329)))))

(declare-fun b!178740 () Bool)

(declare-fun res!148269 () Bool)

(assert (=> b!178740 (=> res!148269 e!124400)))

(assert (=> b!178740 (= res!148269 (not (invariant!0 (currentBit!8880 (_2!8349 lt!274325)) (currentByte!8885 (_2!8349 lt!274325)) (size!4244 (buf!4687 (_2!8349 lt!274325))))))))

(declare-fun b!178741 () Bool)

(declare-fun res!148259 () Bool)

(assert (=> b!178741 (=> res!148259 e!124402)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178741 (= res!148259 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4244 (buf!4687 (_2!8349 lt!274329)))) ((_ sign_extend 32) (currentByte!8885 thiss!1204)) ((_ sign_extend 32) (currentBit!8880 thiss!1204)))))))

(declare-fun b!178742 () Bool)

(declare-fun e!124408 () Bool)

(assert (=> b!178742 (= e!124405 e!124408)))

(declare-fun res!148264 () Bool)

(assert (=> b!178742 (=> (not res!148264) (not e!124408))))

(declare-fun lt!274332 () Bool)

(declare-datatypes ((tuple2!15410 0))(
  ( (tuple2!15411 (_1!8350 BitStream!7596) (_2!8350 Bool)) )
))
(declare-fun lt!274330 () tuple2!15410)

(assert (=> b!178742 (= res!148264 (and (= (_2!8350 lt!274330) lt!274332) (= (_1!8350 lt!274330) (_2!8349 lt!274329))))))

(declare-fun readBitPure!0 (BitStream!7596) tuple2!15410)

(declare-fun readerFrom!0 (BitStream!7596 (_ BitVec 32) (_ BitVec 32)) BitStream!7596)

(assert (=> b!178742 (= lt!274330 (readBitPure!0 (readerFrom!0 (_2!8349 lt!274329) (currentBit!8880 thiss!1204) (currentByte!8885 thiss!1204))))))

(declare-fun b!178743 () Bool)

(assert (=> b!178743 (= e!124401 (not e!124407))))

(declare-fun res!148258 () Bool)

(assert (=> b!178743 (=> res!148258 e!124407)))

(declare-fun lt!274326 () (_ BitVec 64))

(assert (=> b!178743 (= res!148258 (not (= lt!274324 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274326))))))

(assert (=> b!178743 (= lt!274324 (bitIndex!0 (size!4244 (buf!4687 (_2!8349 lt!274329))) (currentByte!8885 (_2!8349 lt!274329)) (currentBit!8880 (_2!8349 lt!274329))))))

(assert (=> b!178743 (= lt!274326 (bitIndex!0 (size!4244 (buf!4687 thiss!1204)) (currentByte!8885 thiss!1204) (currentBit!8880 thiss!1204)))))

(assert (=> b!178743 e!124406))

(declare-fun res!148257 () Bool)

(assert (=> b!178743 (=> (not res!148257) (not e!124406))))

(assert (=> b!178743 (= res!148257 (= (size!4244 (buf!4687 thiss!1204)) (size!4244 (buf!4687 (_2!8349 lt!274329)))))))

(declare-fun appendBit!0 (BitStream!7596 Bool) tuple2!15408)

(assert (=> b!178743 (= lt!274329 (appendBit!0 thiss!1204 lt!274332))))

(assert (=> b!178743 (= lt!274332 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178744 () Bool)

(declare-fun res!148272 () Bool)

(assert (=> b!178744 (=> res!148272 e!124400)))

(assert (=> b!178744 (= res!148272 (or (not (= (size!4244 (buf!4687 (_2!8349 lt!274325))) (size!4244 (buf!4687 thiss!1204)))) (not (= lt!274331 (bvsub (bvadd lt!274326 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178745 () Bool)

(declare-fun res!148268 () Bool)

(assert (=> b!178745 (=> res!148268 e!124400)))

(assert (=> b!178745 (= res!148268 (not (isPrefixOf!0 thiss!1204 (_2!8349 lt!274329))))))

(declare-fun b!178746 () Bool)

(assert (=> b!178746 (= e!124402 true)))

(declare-fun lt!274323 () tuple2!15410)

(assert (=> b!178746 (= lt!274323 (readBitPure!0 (BitStream!7597 (buf!4687 (_2!8349 lt!274325)) (currentByte!8885 thiss!1204) (currentBit!8880 thiss!1204))))))

(declare-fun lt!274327 () tuple2!15410)

(assert (=> b!178746 (= lt!274327 (readBitPure!0 (BitStream!7597 (buf!4687 (_2!8349 lt!274329)) (currentByte!8885 thiss!1204) (currentBit!8880 thiss!1204))))))

(assert (=> b!178746 (invariant!0 (currentBit!8880 thiss!1204) (currentByte!8885 thiss!1204) (size!4244 (buf!4687 (_2!8349 lt!274325))))))

(declare-fun b!178747 () Bool)

(declare-fun res!148262 () Bool)

(assert (=> b!178747 (=> res!148262 e!124402)))

(declare-fun arrayBitRangesEq!0 (array!9625 array!9625 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178747 (= res!148262 (not (arrayBitRangesEq!0 (buf!4687 (_2!8349 lt!274329)) (buf!4687 (_2!8349 lt!274325)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4244 (buf!4687 (_2!8349 lt!274329))) (currentByte!8885 thiss!1204) (currentBit!8880 thiss!1204))))))))

(declare-fun b!178748 () Bool)

(declare-fun res!148263 () Bool)

(assert (=> b!178748 (=> (not res!148263) (not e!124401))))

(assert (=> b!178748 (= res!148263 (invariant!0 (currentBit!8880 thiss!1204) (currentByte!8885 thiss!1204) (size!4244 (buf!4687 thiss!1204))))))

(declare-fun b!178749 () Bool)

(assert (=> b!178749 (= e!124408 (= (bitIndex!0 (size!4244 (buf!4687 (_1!8350 lt!274330))) (currentByte!8885 (_1!8350 lt!274330)) (currentBit!8880 (_1!8350 lt!274330))) lt!274333))))

(assert (= (and start!39610 res!148265) b!178738))

(assert (= (and b!178738 res!148270) b!178748))

(assert (= (and b!178748 res!148263) b!178737))

(assert (= (and b!178737 res!148261) b!178743))

(assert (= (and b!178743 res!148257) b!178733))

(assert (= (and b!178733 res!148260) b!178739))

(assert (= (and b!178739 res!148266) b!178742))

(assert (= (and b!178742 res!148264) b!178749))

(assert (= (and b!178743 (not res!148258)) b!178732))

(assert (= (and b!178732 (not res!148267)) b!178740))

(assert (= (and b!178740 (not res!148269)) b!178744))

(assert (= (and b!178744 (not res!148272)) b!178735))

(assert (= (and b!178735 (not res!148271)) b!178745))

(assert (= (and b!178745 (not res!148268)) b!178736))

(assert (= (and b!178736 (not res!148256)) b!178741))

(assert (= (and b!178741 (not res!148259)) b!178747))

(assert (= (and b!178747 (not res!148262)) b!178746))

(assert (= start!39610 b!178734))

(declare-fun m!278827 () Bool)

(assert (=> b!178735 m!278827))

(declare-fun m!278829 () Bool)

(assert (=> b!178747 m!278829))

(declare-fun m!278831 () Bool)

(assert (=> b!178747 m!278831))

(declare-fun m!278833 () Bool)

(assert (=> b!178740 m!278833))

(declare-fun m!278835 () Bool)

(assert (=> b!178749 m!278835))

(declare-fun m!278837 () Bool)

(assert (=> b!178746 m!278837))

(declare-fun m!278839 () Bool)

(assert (=> b!178746 m!278839))

(declare-fun m!278841 () Bool)

(assert (=> b!178746 m!278841))

(declare-fun m!278843 () Bool)

(assert (=> b!178738 m!278843))

(declare-fun m!278845 () Bool)

(assert (=> b!178745 m!278845))

(declare-fun m!278847 () Bool)

(assert (=> b!178736 m!278847))

(declare-fun m!278849 () Bool)

(assert (=> b!178733 m!278849))

(declare-fun m!278851 () Bool)

(assert (=> b!178733 m!278851))

(declare-fun m!278853 () Bool)

(assert (=> b!178734 m!278853))

(assert (=> b!178743 m!278849))

(assert (=> b!178743 m!278851))

(declare-fun m!278855 () Bool)

(assert (=> b!178743 m!278855))

(declare-fun m!278857 () Bool)

(assert (=> b!178742 m!278857))

(assert (=> b!178742 m!278857))

(declare-fun m!278859 () Bool)

(assert (=> b!178742 m!278859))

(declare-fun m!278861 () Bool)

(assert (=> b!178748 m!278861))

(assert (=> b!178739 m!278845))

(declare-fun m!278863 () Bool)

(assert (=> b!178732 m!278863))

(declare-fun m!278865 () Bool)

(assert (=> b!178732 m!278865))

(declare-fun m!278867 () Bool)

(assert (=> b!178732 m!278867))

(declare-fun m!278869 () Bool)

(assert (=> b!178732 m!278869))

(declare-fun m!278871 () Bool)

(assert (=> start!39610 m!278871))

(declare-fun m!278873 () Bool)

(assert (=> b!178741 m!278873))

(check-sat (not b!178741) (not b!178747) (not b!178735) (not b!178749) (not b!178742) (not start!39610) (not b!178738) (not b!178748) (not b!178740) (not b!178733) (not b!178739) (not b!178732) (not b!178743) (not b!178746) (not b!178734) (not b!178745) (not b!178736))
