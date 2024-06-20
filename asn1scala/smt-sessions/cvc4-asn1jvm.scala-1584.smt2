; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45262 () Bool)

(assert start!45262)

(declare-fun res!183610 () Bool)

(declare-fun e!148254 () Bool)

(assert (=> start!45262 (=> (not res!183610) (not e!148254))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!45262 (= res!183610 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45262 e!148254))

(assert (=> start!45262 true))

(declare-datatypes ((array!10626 0))(
  ( (array!10627 (arr!5595 (Array (_ BitVec 32) (_ BitVec 8))) (size!4665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8438 0))(
  ( (BitStream!8439 (buf!5212 array!10626) (currentByte!9811 (_ BitVec 32)) (currentBit!9806 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8438)

(declare-fun e!148242 () Bool)

(declare-fun inv!12 (BitStream!8438) Bool)

(assert (=> start!45262 (and (inv!12 thiss!1204) e!148242)))

(declare-fun b!218142 () Bool)

(declare-fun res!183591 () Bool)

(declare-fun e!148245 () Bool)

(assert (=> b!218142 (=> res!183591 e!148245)))

(declare-datatypes ((tuple2!18582 0))(
  ( (tuple2!18583 (_1!9949 BitStream!8438) (_2!9949 (_ BitVec 64))) )
))
(declare-fun lt!345781 () tuple2!18582)

(declare-datatypes ((tuple2!18584 0))(
  ( (tuple2!18585 (_1!9950 BitStream!8438) (_2!9950 BitStream!8438)) )
))
(declare-fun lt!345786 () tuple2!18584)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218142 (= res!183591 (not (= (bitIndex!0 (size!4665 (buf!5212 (_1!9949 lt!345781))) (currentByte!9811 (_1!9949 lt!345781)) (currentBit!9806 (_1!9949 lt!345781))) (bitIndex!0 (size!4665 (buf!5212 (_2!9950 lt!345786))) (currentByte!9811 (_2!9950 lt!345786)) (currentBit!9806 (_2!9950 lt!345786))))))))

(declare-fun b!218143 () Bool)

(declare-fun e!148253 () Bool)

(declare-fun e!148247 () Bool)

(assert (=> b!218143 (= e!148253 (not e!148247))))

(declare-fun res!183595 () Bool)

(assert (=> b!218143 (=> res!183595 e!148247)))

(declare-fun lt!345792 () (_ BitVec 64))

(declare-fun lt!345778 () (_ BitVec 64))

(assert (=> b!218143 (= res!183595 (not (= lt!345792 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!345778))))))

(declare-datatypes ((Unit!15527 0))(
  ( (Unit!15528) )
))
(declare-datatypes ((tuple2!18586 0))(
  ( (tuple2!18587 (_1!9951 Unit!15527) (_2!9951 BitStream!8438)) )
))
(declare-fun lt!345779 () tuple2!18586)

(assert (=> b!218143 (= lt!345792 (bitIndex!0 (size!4665 (buf!5212 (_2!9951 lt!345779))) (currentByte!9811 (_2!9951 lt!345779)) (currentBit!9806 (_2!9951 lt!345779))))))

(assert (=> b!218143 (= lt!345778 (bitIndex!0 (size!4665 (buf!5212 thiss!1204)) (currentByte!9811 thiss!1204) (currentBit!9806 thiss!1204)))))

(declare-fun e!148244 () Bool)

(assert (=> b!218143 e!148244))

(declare-fun res!183594 () Bool)

(assert (=> b!218143 (=> (not res!183594) (not e!148244))))

(assert (=> b!218143 (= res!183594 (= (size!4665 (buf!5212 thiss!1204)) (size!4665 (buf!5212 (_2!9951 lt!345779)))))))

(declare-fun lt!345790 () Bool)

(declare-fun appendBit!0 (BitStream!8438 Bool) tuple2!18586)

(assert (=> b!218143 (= lt!345779 (appendBit!0 thiss!1204 lt!345790))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!345785 () (_ BitVec 64))

(assert (=> b!218143 (= lt!345790 (not (= (bvand v!189 lt!345785) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218143 (= lt!345785 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!218144 () Bool)

(declare-fun res!183601 () Bool)

(declare-fun e!148252 () Bool)

(assert (=> b!218144 (=> (not res!183601) (not e!148252))))

(declare-fun isPrefixOf!0 (BitStream!8438 BitStream!8438) Bool)

(assert (=> b!218144 (= res!183601 (isPrefixOf!0 thiss!1204 (_2!9951 lt!345779)))))

(declare-fun b!218145 () Bool)

(declare-fun res!183604 () Bool)

(assert (=> b!218145 (=> (not res!183604) (not e!148253))))

(assert (=> b!218145 (= res!183604 (not (= i!590 nBits!348)))))

(declare-fun b!218146 () Bool)

(declare-fun res!183607 () Bool)

(declare-fun e!148250 () Bool)

(assert (=> b!218146 (=> res!183607 e!148250)))

(declare-fun lt!345797 () (_ BitVec 64))

(declare-fun lt!345775 () tuple2!18586)

(assert (=> b!218146 (= res!183607 (or (not (= (size!4665 (buf!5212 (_2!9951 lt!345775))) (size!4665 (buf!5212 thiss!1204)))) (not (= lt!345797 (bvsub (bvadd lt!345778 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!218147 () Bool)

(declare-fun e!148243 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218147 (= e!148243 (invariant!0 (currentBit!9806 thiss!1204) (currentByte!9811 thiss!1204) (size!4665 (buf!5212 (_2!9951 lt!345775)))))))

(declare-fun b!218148 () Bool)

(declare-fun e!148241 () Bool)

(declare-datatypes ((tuple2!18588 0))(
  ( (tuple2!18589 (_1!9952 BitStream!8438) (_2!9952 Bool)) )
))
(declare-fun lt!345798 () tuple2!18588)

(declare-fun lt!345795 () (_ BitVec 64))

(assert (=> b!218148 (= e!148241 (= (bitIndex!0 (size!4665 (buf!5212 (_1!9952 lt!345798))) (currentByte!9811 (_1!9952 lt!345798)) (currentBit!9806 (_1!9952 lt!345798))) lt!345795))))

(declare-fun b!218149 () Bool)

(assert (=> b!218149 (= e!148254 e!148253)))

(declare-fun res!183589 () Bool)

(assert (=> b!218149 (=> (not res!183589) (not e!148253))))

(declare-fun lt!345772 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218149 (= res!183589 (validate_offset_bits!1 ((_ sign_extend 32) (size!4665 (buf!5212 thiss!1204))) ((_ sign_extend 32) (currentByte!9811 thiss!1204)) ((_ sign_extend 32) (currentBit!9806 thiss!1204)) lt!345772))))

(assert (=> b!218149 (= lt!345772 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun lt!345780 () BitStream!8438)

(declare-fun e!148246 () Bool)

(declare-fun b!218150 () Bool)

(declare-fun lt!345793 () tuple2!18582)

(declare-fun lt!345783 () tuple2!18584)

(assert (=> b!218150 (= e!148246 (and (= lt!345778 (bvsub lt!345792 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9950 lt!345783) lt!345780)) (= (_2!9949 lt!345781) (_2!9949 lt!345793)))))))

(declare-fun b!218151 () Bool)

(assert (=> b!218151 (= e!148247 e!148250)))

(declare-fun res!183596 () Bool)

(assert (=> b!218151 (=> res!183596 e!148250)))

(assert (=> b!218151 (= res!183596 (not (= lt!345797 (bvsub (bvsub (bvadd lt!345792 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!218151 (= lt!345797 (bitIndex!0 (size!4665 (buf!5212 (_2!9951 lt!345775))) (currentByte!9811 (_2!9951 lt!345775)) (currentBit!9806 (_2!9951 lt!345775))))))

(assert (=> b!218151 (isPrefixOf!0 thiss!1204 (_2!9951 lt!345775))))

(declare-fun lt!345794 () Unit!15527)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8438 BitStream!8438 BitStream!8438) Unit!15527)

(assert (=> b!218151 (= lt!345794 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9951 lt!345779) (_2!9951 lt!345775)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8438 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18586)

(assert (=> b!218151 (= lt!345775 (appendBitsLSBFirstLoopTR!0 (_2!9951 lt!345779) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218152 () Bool)

(declare-fun res!183588 () Bool)

(declare-fun e!148249 () Bool)

(assert (=> b!218152 (=> (not res!183588) (not e!148249))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218152 (= res!183588 (= (_2!9949 lt!345781) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218153 () Bool)

(assert (=> b!218153 (= e!148244 e!148252)))

(declare-fun res!183603 () Bool)

(assert (=> b!218153 (=> (not res!183603) (not e!148252))))

(declare-fun lt!345799 () (_ BitVec 64))

(assert (=> b!218153 (= res!183603 (= lt!345795 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!345799)))))

(assert (=> b!218153 (= lt!345795 (bitIndex!0 (size!4665 (buf!5212 (_2!9951 lt!345779))) (currentByte!9811 (_2!9951 lt!345779)) (currentBit!9806 (_2!9951 lt!345779))))))

(assert (=> b!218153 (= lt!345799 (bitIndex!0 (size!4665 (buf!5212 thiss!1204)) (currentByte!9811 thiss!1204) (currentBit!9806 thiss!1204)))))

(declare-fun b!218154 () Bool)

(declare-fun res!183611 () Bool)

(assert (=> b!218154 (=> res!183611 e!148250)))

(assert (=> b!218154 (= res!183611 (not (invariant!0 (currentBit!9806 (_2!9951 lt!345775)) (currentByte!9811 (_2!9951 lt!345775)) (size!4665 (buf!5212 (_2!9951 lt!345775))))))))

(declare-fun b!218155 () Bool)

(declare-fun e!148240 () Bool)

(declare-fun lt!345796 () tuple2!18588)

(declare-fun lt!345773 () tuple2!18588)

(assert (=> b!218155 (= e!148240 (= (_2!9952 lt!345796) (_2!9952 lt!345773)))))

(declare-fun b!218156 () Bool)

(assert (=> b!218156 (= e!148252 e!148241)))

(declare-fun res!183590 () Bool)

(assert (=> b!218156 (=> (not res!183590) (not e!148241))))

(assert (=> b!218156 (= res!183590 (and (= (_2!9952 lt!345798) lt!345790) (= (_1!9952 lt!345798) (_2!9951 lt!345779))))))

(declare-fun readBitPure!0 (BitStream!8438) tuple2!18588)

(declare-fun readerFrom!0 (BitStream!8438 (_ BitVec 32) (_ BitVec 32)) BitStream!8438)

(assert (=> b!218156 (= lt!345798 (readBitPure!0 (readerFrom!0 (_2!9951 lt!345779) (currentBit!9806 thiss!1204) (currentByte!9811 thiss!1204))))))

(declare-fun b!218157 () Bool)

(declare-fun res!183599 () Bool)

(assert (=> b!218157 (=> res!183599 e!148250)))

(assert (=> b!218157 (= res!183599 (not (isPrefixOf!0 thiss!1204 (_2!9951 lt!345779))))))

(declare-fun b!218158 () Bool)

(declare-fun res!183609 () Bool)

(assert (=> b!218158 (=> (not res!183609) (not e!148246))))

(declare-fun withMovedBitIndex!0 (BitStream!8438 (_ BitVec 64)) BitStream!8438)

(assert (=> b!218158 (= res!183609 (= (_1!9950 lt!345783) (withMovedBitIndex!0 (_2!9950 lt!345783) (bvsub lt!345792 lt!345797))))))

(declare-fun b!218159 () Bool)

(declare-fun res!183605 () Bool)

(assert (=> b!218159 (=> (not res!183605) (not e!148253))))

(assert (=> b!218159 (= res!183605 (invariant!0 (currentBit!9806 thiss!1204) (currentByte!9811 thiss!1204) (size!4665 (buf!5212 thiss!1204))))))

(declare-fun b!218160 () Bool)

(assert (=> b!218160 (= e!148249 (= (_1!9949 lt!345781) (_2!9950 lt!345786)))))

(declare-fun b!218161 () Bool)

(declare-fun array_inv!4406 (array!10626) Bool)

(assert (=> b!218161 (= e!148242 (array_inv!4406 (buf!5212 thiss!1204)))))

(declare-fun b!218162 () Bool)

(declare-fun res!183592 () Bool)

(assert (=> b!218162 (=> res!183592 e!148250)))

(assert (=> b!218162 (= res!183592 (not (isPrefixOf!0 (_2!9951 lt!345779) (_2!9951 lt!345775))))))

(declare-fun b!218163 () Bool)

(declare-fun res!183597 () Bool)

(assert (=> b!218163 (=> (not res!183597) (not e!148246))))

(assert (=> b!218163 (= res!183597 (= (_1!9950 lt!345786) (withMovedBitIndex!0 (_2!9950 lt!345786) (bvsub lt!345778 lt!345797))))))

(declare-fun b!218164 () Bool)

(declare-fun e!148248 () Bool)

(assert (=> b!218164 (= e!148250 e!148248)))

(declare-fun res!183602 () Bool)

(assert (=> b!218164 (=> res!183602 e!148248)))

(assert (=> b!218164 (= res!183602 (not (= (_1!9949 lt!345793) (_2!9950 lt!345783))))))

(declare-fun lt!345788 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18582)

(assert (=> b!218164 (= lt!345793 (readNBitsLSBFirstsLoopPure!0 (_1!9950 lt!345783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345788))))

(declare-fun lt!345789 () (_ BitVec 64))

(assert (=> b!218164 (validate_offset_bits!1 ((_ sign_extend 32) (size!4665 (buf!5212 (_2!9951 lt!345775)))) ((_ sign_extend 32) (currentByte!9811 (_2!9951 lt!345779))) ((_ sign_extend 32) (currentBit!9806 (_2!9951 lt!345779))) lt!345789)))

(declare-fun lt!345776 () Unit!15527)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8438 array!10626 (_ BitVec 64)) Unit!15527)

(assert (=> b!218164 (= lt!345776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9951 lt!345779) (buf!5212 (_2!9951 lt!345775)) lt!345789))))

(assert (=> b!218164 (= lt!345789 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!345800 () tuple2!18588)

(declare-fun lt!345784 () (_ BitVec 64))

(assert (=> b!218164 (= lt!345788 (bvor lt!345784 (ite (_2!9952 lt!345800) lt!345785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218164 (= lt!345781 (readNBitsLSBFirstsLoopPure!0 (_1!9950 lt!345786) nBits!348 i!590 lt!345784))))

(assert (=> b!218164 (validate_offset_bits!1 ((_ sign_extend 32) (size!4665 (buf!5212 (_2!9951 lt!345775)))) ((_ sign_extend 32) (currentByte!9811 thiss!1204)) ((_ sign_extend 32) (currentBit!9806 thiss!1204)) lt!345772)))

(declare-fun lt!345774 () Unit!15527)

(assert (=> b!218164 (= lt!345774 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5212 (_2!9951 lt!345775)) lt!345772))))

(assert (=> b!218164 (= lt!345784 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218164 (= (_2!9952 lt!345800) lt!345790)))

(assert (=> b!218164 (= lt!345800 (readBitPure!0 (_1!9950 lt!345786)))))

(declare-fun reader!0 (BitStream!8438 BitStream!8438) tuple2!18584)

(assert (=> b!218164 (= lt!345783 (reader!0 (_2!9951 lt!345779) (_2!9951 lt!345775)))))

(assert (=> b!218164 (= lt!345786 (reader!0 thiss!1204 (_2!9951 lt!345775)))))

(assert (=> b!218164 e!148240))

(declare-fun res!183600 () Bool)

(assert (=> b!218164 (=> (not res!183600) (not e!148240))))

(assert (=> b!218164 (= res!183600 (= (bitIndex!0 (size!4665 (buf!5212 (_1!9952 lt!345796))) (currentByte!9811 (_1!9952 lt!345796)) (currentBit!9806 (_1!9952 lt!345796))) (bitIndex!0 (size!4665 (buf!5212 (_1!9952 lt!345773))) (currentByte!9811 (_1!9952 lt!345773)) (currentBit!9806 (_1!9952 lt!345773)))))))

(declare-fun lt!345787 () Unit!15527)

(declare-fun lt!345782 () BitStream!8438)

(declare-fun readBitPrefixLemma!0 (BitStream!8438 BitStream!8438) Unit!15527)

(assert (=> b!218164 (= lt!345787 (readBitPrefixLemma!0 lt!345782 (_2!9951 lt!345775)))))

(assert (=> b!218164 (= lt!345773 (readBitPure!0 (BitStream!8439 (buf!5212 (_2!9951 lt!345775)) (currentByte!9811 thiss!1204) (currentBit!9806 thiss!1204))))))

(assert (=> b!218164 (= lt!345796 (readBitPure!0 lt!345782))))

(assert (=> b!218164 e!148243))

(declare-fun res!183593 () Bool)

(assert (=> b!218164 (=> (not res!183593) (not e!148243))))

(assert (=> b!218164 (= res!183593 (invariant!0 (currentBit!9806 thiss!1204) (currentByte!9811 thiss!1204) (size!4665 (buf!5212 (_2!9951 lt!345779)))))))

(assert (=> b!218164 (= lt!345782 (BitStream!8439 (buf!5212 (_2!9951 lt!345779)) (currentByte!9811 thiss!1204) (currentBit!9806 thiss!1204)))))

(declare-fun b!218165 () Bool)

(assert (=> b!218165 (= e!148245 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(assert (=> b!218165 e!148249))

(declare-fun res!183608 () Bool)

(assert (=> b!218165 (=> (not res!183608) (not e!148249))))

(assert (=> b!218165 (= res!183608 (= (size!4665 (buf!5212 thiss!1204)) (size!4665 (buf!5212 (_2!9951 lt!345775)))))))

(declare-fun b!218166 () Bool)

(assert (=> b!218166 (= e!148248 e!148245)))

(declare-fun res!183598 () Bool)

(assert (=> b!218166 (=> res!183598 e!148245)))

(assert (=> b!218166 (= res!183598 (not (= (_1!9950 lt!345783) lt!345780)))))

(assert (=> b!218166 e!148246))

(declare-fun res!183606 () Bool)

(assert (=> b!218166 (=> (not res!183606) (not e!148246))))

(declare-fun lt!345791 () tuple2!18582)

(assert (=> b!218166 (= res!183606 (and (= (_2!9949 lt!345781) (_2!9949 lt!345791)) (= (_1!9949 lt!345781) (_1!9949 lt!345791))))))

(declare-fun lt!345777 () Unit!15527)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15527)

(assert (=> b!218166 (= lt!345777 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9950 lt!345786) nBits!348 i!590 lt!345784))))

(assert (=> b!218166 (= lt!345791 (readNBitsLSBFirstsLoopPure!0 lt!345780 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345788))))

(assert (=> b!218166 (= lt!345780 (withMovedBitIndex!0 (_1!9950 lt!345786) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!45262 res!183610) b!218149))

(assert (= (and b!218149 res!183589) b!218159))

(assert (= (and b!218159 res!183605) b!218145))

(assert (= (and b!218145 res!183604) b!218143))

(assert (= (and b!218143 res!183594) b!218153))

(assert (= (and b!218153 res!183603) b!218144))

(assert (= (and b!218144 res!183601) b!218156))

(assert (= (and b!218156 res!183590) b!218148))

(assert (= (and b!218143 (not res!183595)) b!218151))

(assert (= (and b!218151 (not res!183596)) b!218154))

(assert (= (and b!218154 (not res!183611)) b!218146))

(assert (= (and b!218146 (not res!183607)) b!218162))

(assert (= (and b!218162 (not res!183592)) b!218157))

(assert (= (and b!218157 (not res!183599)) b!218164))

(assert (= (and b!218164 res!183593) b!218147))

(assert (= (and b!218164 res!183600) b!218155))

(assert (= (and b!218164 (not res!183602)) b!218166))

(assert (= (and b!218166 res!183606) b!218163))

(assert (= (and b!218163 res!183597) b!218158))

(assert (= (and b!218158 res!183609) b!218150))

(assert (= (and b!218166 (not res!183598)) b!218142))

(assert (= (and b!218142 (not res!183591)) b!218165))

(assert (= (and b!218165 res!183608) b!218152))

(assert (= (and b!218152 res!183588) b!218160))

(assert (= start!45262 b!218161))

(declare-fun m!336603 () Bool)

(assert (=> b!218153 m!336603))

(declare-fun m!336605 () Bool)

(assert (=> b!218153 m!336605))

(declare-fun m!336607 () Bool)

(assert (=> b!218151 m!336607))

(declare-fun m!336609 () Bool)

(assert (=> b!218151 m!336609))

(declare-fun m!336611 () Bool)

(assert (=> b!218151 m!336611))

(declare-fun m!336613 () Bool)

(assert (=> b!218151 m!336613))

(declare-fun m!336615 () Bool)

(assert (=> start!45262 m!336615))

(assert (=> b!218143 m!336603))

(assert (=> b!218143 m!336605))

(declare-fun m!336617 () Bool)

(assert (=> b!218143 m!336617))

(declare-fun m!336619 () Bool)

(assert (=> b!218149 m!336619))

(declare-fun m!336621 () Bool)

(assert (=> b!218166 m!336621))

(declare-fun m!336623 () Bool)

(assert (=> b!218166 m!336623))

(declare-fun m!336625 () Bool)

(assert (=> b!218166 m!336625))

(declare-fun m!336627 () Bool)

(assert (=> b!218159 m!336627))

(declare-fun m!336629 () Bool)

(assert (=> b!218163 m!336629))

(declare-fun m!336631 () Bool)

(assert (=> b!218157 m!336631))

(declare-fun m!336633 () Bool)

(assert (=> b!218164 m!336633))

(declare-fun m!336635 () Bool)

(assert (=> b!218164 m!336635))

(declare-fun m!336637 () Bool)

(assert (=> b!218164 m!336637))

(declare-fun m!336639 () Bool)

(assert (=> b!218164 m!336639))

(declare-fun m!336641 () Bool)

(assert (=> b!218164 m!336641))

(declare-fun m!336643 () Bool)

(assert (=> b!218164 m!336643))

(declare-fun m!336645 () Bool)

(assert (=> b!218164 m!336645))

(declare-fun m!336647 () Bool)

(assert (=> b!218164 m!336647))

(declare-fun m!336649 () Bool)

(assert (=> b!218164 m!336649))

(declare-fun m!336651 () Bool)

(assert (=> b!218164 m!336651))

(declare-fun m!336653 () Bool)

(assert (=> b!218164 m!336653))

(declare-fun m!336655 () Bool)

(assert (=> b!218164 m!336655))

(declare-fun m!336657 () Bool)

(assert (=> b!218164 m!336657))

(declare-fun m!336659 () Bool)

(assert (=> b!218164 m!336659))

(declare-fun m!336661 () Bool)

(assert (=> b!218164 m!336661))

(declare-fun m!336663 () Bool)

(assert (=> b!218164 m!336663))

(declare-fun m!336665 () Bool)

(assert (=> b!218156 m!336665))

(assert (=> b!218156 m!336665))

(declare-fun m!336667 () Bool)

(assert (=> b!218156 m!336667))

(declare-fun m!336669 () Bool)

(assert (=> b!218158 m!336669))

(declare-fun m!336671 () Bool)

(assert (=> b!218162 m!336671))

(declare-fun m!336673 () Bool)

(assert (=> b!218142 m!336673))

(declare-fun m!336675 () Bool)

(assert (=> b!218142 m!336675))

(declare-fun m!336677 () Bool)

(assert (=> b!218152 m!336677))

(declare-fun m!336679 () Bool)

(assert (=> b!218148 m!336679))

(declare-fun m!336681 () Bool)

(assert (=> b!218161 m!336681))

(assert (=> b!218144 m!336631))

(declare-fun m!336683 () Bool)

(assert (=> b!218147 m!336683))

(declare-fun m!336685 () Bool)

(assert (=> b!218154 m!336685))

(push 1)

(assert (not b!218152))

(assert (not b!218161))

(assert (not b!218164))

(assert (not b!218144))

(assert (not b!218149))

(assert (not b!218153))

(assert (not b!218157))

(assert (not b!218156))

(assert (not b!218162))

(assert (not b!218142))

(assert (not b!218151))

(assert (not b!218154))

(assert (not b!218143))

(assert (not b!218148))

(assert (not b!218158))

(assert (not b!218163))

(assert (not b!218166))

(assert (not b!218147))

(assert (not start!45262))

(assert (not b!218159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

