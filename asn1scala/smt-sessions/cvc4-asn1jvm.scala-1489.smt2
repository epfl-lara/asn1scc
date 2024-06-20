; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41268 () Bool)

(assert start!41268)

(declare-fun b!191987 () Bool)

(declare-fun e!132319 () Bool)

(declare-fun e!132314 () Bool)

(assert (=> b!191987 (= e!132319 e!132314)))

(declare-fun res!160301 () Bool)

(assert (=> b!191987 (=> (not res!160301) (not e!132314))))

(declare-datatypes ((array!9942 0))(
  ( (array!9943 (arr!5313 (Array (_ BitVec 32) (_ BitVec 8))) (size!4383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7874 0))(
  ( (BitStream!7875 (buf!4863 array!9942) (currentByte!9147 (_ BitVec 32)) (currentBit!9142 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16596 0))(
  ( (tuple2!16597 (_1!8943 BitStream!7874) (_2!8943 Bool)) )
))
(declare-fun lt!298630 () tuple2!16596)

(declare-fun lt!298623 () Bool)

(declare-datatypes ((Unit!13643 0))(
  ( (Unit!13644) )
))
(declare-datatypes ((tuple2!16598 0))(
  ( (tuple2!16599 (_1!8944 Unit!13643) (_2!8944 BitStream!7874)) )
))
(declare-fun lt!298640 () tuple2!16598)

(assert (=> b!191987 (= res!160301 (and (= (_2!8943 lt!298630) lt!298623) (= (_1!8943 lt!298630) (_2!8944 lt!298640))))))

(declare-fun thiss!1204 () BitStream!7874)

(declare-fun readBitPure!0 (BitStream!7874) tuple2!16596)

(declare-fun readerFrom!0 (BitStream!7874 (_ BitVec 32) (_ BitVec 32)) BitStream!7874)

(assert (=> b!191987 (= lt!298630 (readBitPure!0 (readerFrom!0 (_2!8944 lt!298640) (currentBit!9142 thiss!1204) (currentByte!9147 thiss!1204))))))

(declare-fun b!191988 () Bool)

(declare-fun e!132322 () Bool)

(assert (=> b!191988 (= e!132322 e!132319)))

(declare-fun res!160291 () Bool)

(assert (=> b!191988 (=> (not res!160291) (not e!132319))))

(declare-fun lt!298641 () (_ BitVec 64))

(declare-fun lt!298624 () (_ BitVec 64))

(assert (=> b!191988 (= res!160291 (= lt!298641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298624)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191988 (= lt!298641 (bitIndex!0 (size!4383 (buf!4863 (_2!8944 lt!298640))) (currentByte!9147 (_2!8944 lt!298640)) (currentBit!9142 (_2!8944 lt!298640))))))

(assert (=> b!191988 (= lt!298624 (bitIndex!0 (size!4383 (buf!4863 thiss!1204)) (currentByte!9147 thiss!1204) (currentBit!9142 thiss!1204)))))

(declare-fun b!191989 () Bool)

(declare-fun e!132320 () Bool)

(declare-fun e!132318 () Bool)

(assert (=> b!191989 (= e!132320 e!132318)))

(declare-fun res!160287 () Bool)

(assert (=> b!191989 (=> res!160287 e!132318)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!298629 () (_ BitVec 64))

(declare-fun lt!298632 () (_ BitVec 64))

(assert (=> b!191989 (= res!160287 (not (= lt!298629 (bvsub (bvsub (bvadd lt!298632 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!298650 () tuple2!16598)

(assert (=> b!191989 (= lt!298629 (bitIndex!0 (size!4383 (buf!4863 (_2!8944 lt!298650))) (currentByte!9147 (_2!8944 lt!298650)) (currentBit!9142 (_2!8944 lt!298650))))))

(declare-fun isPrefixOf!0 (BitStream!7874 BitStream!7874) Bool)

(assert (=> b!191989 (isPrefixOf!0 thiss!1204 (_2!8944 lt!298650))))

(declare-fun lt!298637 () Unit!13643)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7874 BitStream!7874 BitStream!7874) Unit!13643)

(assert (=> b!191989 (= lt!298637 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8944 lt!298640) (_2!8944 lt!298650)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7874 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16598)

(assert (=> b!191989 (= lt!298650 (appendBitsLSBFirstLoopTR!0 (_2!8944 lt!298640) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!191990 () Bool)

(declare-fun res!160293 () Bool)

(declare-fun e!132325 () Bool)

(assert (=> b!191990 (=> (not res!160293) (not e!132325))))

(declare-datatypes ((tuple2!16600 0))(
  ( (tuple2!16601 (_1!8945 BitStream!7874) (_2!8945 (_ BitVec 64))) )
))
(declare-fun lt!298644 () tuple2!16600)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191990 (= res!160293 (= (_2!8945 lt!298644) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!191991 () Bool)

(assert (=> b!191991 (= e!132314 (= (bitIndex!0 (size!4383 (buf!4863 (_1!8943 lt!298630))) (currentByte!9147 (_1!8943 lt!298630)) (currentBit!9142 (_1!8943 lt!298630))) lt!298641))))

(declare-fun b!191992 () Bool)

(declare-fun res!160300 () Bool)

(declare-fun e!132326 () Bool)

(assert (=> b!191992 (=> (not res!160300) (not e!132326))))

(declare-fun lt!298643 () (_ BitVec 64))

(declare-datatypes ((tuple2!16602 0))(
  ( (tuple2!16603 (_1!8946 BitStream!7874) (_2!8946 BitStream!7874)) )
))
(declare-fun lt!298647 () tuple2!16602)

(declare-fun withMovedBitIndex!0 (BitStream!7874 (_ BitVec 64)) BitStream!7874)

(assert (=> b!191992 (= res!160300 (= (_1!8946 lt!298647) (withMovedBitIndex!0 (_2!8946 lt!298647) (bvsub lt!298643 lt!298629))))))

(declare-fun b!191993 () Bool)

(declare-fun res!160280 () Bool)

(assert (=> b!191993 (=> res!160280 e!132318)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191993 (= res!160280 (not (invariant!0 (currentBit!9142 (_2!8944 lt!298650)) (currentByte!9147 (_2!8944 lt!298650)) (size!4383 (buf!4863 (_2!8944 lt!298650))))))))

(declare-fun b!191994 () Bool)

(declare-fun res!160283 () Bool)

(assert (=> b!191994 (=> res!160283 e!132318)))

(assert (=> b!191994 (= res!160283 (not (isPrefixOf!0 (_2!8944 lt!298640) (_2!8944 lt!298650))))))

(declare-fun b!191996 () Bool)

(declare-fun e!132313 () Bool)

(assert (=> b!191996 (= e!132318 e!132313)))

(declare-fun res!160281 () Bool)

(assert (=> b!191996 (=> res!160281 e!132313)))

(declare-fun lt!298627 () tuple2!16600)

(declare-fun lt!298648 () tuple2!16602)

(assert (=> b!191996 (= res!160281 (not (= (_1!8945 lt!298627) (_2!8946 lt!298648))))))

(declare-fun lt!298651 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16600)

(assert (=> b!191996 (= lt!298627 (readNBitsLSBFirstsLoopPure!0 (_1!8946 lt!298648) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298651))))

(declare-fun lt!298649 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!191996 (validate_offset_bits!1 ((_ sign_extend 32) (size!4383 (buf!4863 (_2!8944 lt!298650)))) ((_ sign_extend 32) (currentByte!9147 (_2!8944 lt!298640))) ((_ sign_extend 32) (currentBit!9142 (_2!8944 lt!298640))) lt!298649)))

(declare-fun lt!298638 () Unit!13643)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7874 array!9942 (_ BitVec 64)) Unit!13643)

(assert (=> b!191996 (= lt!298638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8944 lt!298640) (buf!4863 (_2!8944 lt!298650)) lt!298649))))

(assert (=> b!191996 (= lt!298649 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!298639 () (_ BitVec 64))

(declare-fun lt!298635 () (_ BitVec 64))

(declare-fun lt!298636 () tuple2!16596)

(assert (=> b!191996 (= lt!298651 (bvor lt!298635 (ite (_2!8943 lt!298636) lt!298639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191996 (= lt!298644 (readNBitsLSBFirstsLoopPure!0 (_1!8946 lt!298647) nBits!348 i!590 lt!298635))))

(declare-fun lt!298631 () (_ BitVec 64))

(assert (=> b!191996 (validate_offset_bits!1 ((_ sign_extend 32) (size!4383 (buf!4863 (_2!8944 lt!298650)))) ((_ sign_extend 32) (currentByte!9147 thiss!1204)) ((_ sign_extend 32) (currentBit!9142 thiss!1204)) lt!298631)))

(declare-fun lt!298646 () Unit!13643)

(assert (=> b!191996 (= lt!298646 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4863 (_2!8944 lt!298650)) lt!298631))))

(assert (=> b!191996 (= lt!298635 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!191996 (= (_2!8943 lt!298636) lt!298623)))

(assert (=> b!191996 (= lt!298636 (readBitPure!0 (_1!8946 lt!298647)))))

(declare-fun reader!0 (BitStream!7874 BitStream!7874) tuple2!16602)

(assert (=> b!191996 (= lt!298648 (reader!0 (_2!8944 lt!298640) (_2!8944 lt!298650)))))

(assert (=> b!191996 (= lt!298647 (reader!0 thiss!1204 (_2!8944 lt!298650)))))

(declare-fun e!132321 () Bool)

(assert (=> b!191996 e!132321))

(declare-fun res!160294 () Bool)

(assert (=> b!191996 (=> (not res!160294) (not e!132321))))

(declare-fun lt!298645 () tuple2!16596)

(declare-fun lt!298628 () tuple2!16596)

(assert (=> b!191996 (= res!160294 (= (bitIndex!0 (size!4383 (buf!4863 (_1!8943 lt!298645))) (currentByte!9147 (_1!8943 lt!298645)) (currentBit!9142 (_1!8943 lt!298645))) (bitIndex!0 (size!4383 (buf!4863 (_1!8943 lt!298628))) (currentByte!9147 (_1!8943 lt!298628)) (currentBit!9142 (_1!8943 lt!298628)))))))

(declare-fun lt!298625 () Unit!13643)

(declare-fun lt!298634 () BitStream!7874)

(declare-fun readBitPrefixLemma!0 (BitStream!7874 BitStream!7874) Unit!13643)

(assert (=> b!191996 (= lt!298625 (readBitPrefixLemma!0 lt!298634 (_2!8944 lt!298650)))))

(assert (=> b!191996 (= lt!298628 (readBitPure!0 (BitStream!7875 (buf!4863 (_2!8944 lt!298650)) (currentByte!9147 thiss!1204) (currentBit!9142 thiss!1204))))))

(assert (=> b!191996 (= lt!298645 (readBitPure!0 lt!298634))))

(declare-fun e!132315 () Bool)

(assert (=> b!191996 e!132315))

(declare-fun res!160298 () Bool)

(assert (=> b!191996 (=> (not res!160298) (not e!132315))))

(assert (=> b!191996 (= res!160298 (invariant!0 (currentBit!9142 thiss!1204) (currentByte!9147 thiss!1204) (size!4383 (buf!4863 (_2!8944 lt!298640)))))))

(assert (=> b!191996 (= lt!298634 (BitStream!7875 (buf!4863 (_2!8944 lt!298640)) (currentByte!9147 thiss!1204) (currentBit!9142 thiss!1204)))))

(declare-fun b!191997 () Bool)

(declare-fun lt!298642 () BitStream!7874)

(assert (=> b!191997 (= e!132326 (and (= lt!298643 (bvsub lt!298632 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8946 lt!298648) lt!298642)) (= (_2!8945 lt!298644) (_2!8945 lt!298627)))))))

(declare-fun b!191998 () Bool)

(declare-fun res!160288 () Bool)

(declare-fun e!132312 () Bool)

(assert (=> b!191998 (=> (not res!160288) (not e!132312))))

(assert (=> b!191998 (= res!160288 (invariant!0 (currentBit!9142 thiss!1204) (currentByte!9147 thiss!1204) (size!4383 (buf!4863 thiss!1204))))))

(declare-fun b!191999 () Bool)

(assert (=> b!191999 (= e!132312 (not e!132320))))

(declare-fun res!160286 () Bool)

(assert (=> b!191999 (=> res!160286 e!132320)))

(assert (=> b!191999 (= res!160286 (not (= lt!298632 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298643))))))

(assert (=> b!191999 (= lt!298632 (bitIndex!0 (size!4383 (buf!4863 (_2!8944 lt!298640))) (currentByte!9147 (_2!8944 lt!298640)) (currentBit!9142 (_2!8944 lt!298640))))))

(assert (=> b!191999 (= lt!298643 (bitIndex!0 (size!4383 (buf!4863 thiss!1204)) (currentByte!9147 thiss!1204) (currentBit!9142 thiss!1204)))))

(assert (=> b!191999 e!132322))

(declare-fun res!160289 () Bool)

(assert (=> b!191999 (=> (not res!160289) (not e!132322))))

(assert (=> b!191999 (= res!160289 (= (size!4383 (buf!4863 thiss!1204)) (size!4383 (buf!4863 (_2!8944 lt!298640)))))))

(declare-fun appendBit!0 (BitStream!7874 Bool) tuple2!16598)

(assert (=> b!191999 (= lt!298640 (appendBit!0 thiss!1204 lt!298623))))

(assert (=> b!191999 (= lt!298623 (not (= (bvand v!189 lt!298639) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191999 (= lt!298639 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192000 () Bool)

(declare-fun e!132316 () Bool)

(assert (=> b!192000 (= e!132316 true)))

(assert (=> b!192000 e!132325))

(declare-fun res!160279 () Bool)

(assert (=> b!192000 (=> (not res!160279) (not e!132325))))

(assert (=> b!192000 (= res!160279 (= (size!4383 (buf!4863 thiss!1204)) (size!4383 (buf!4863 (_2!8944 lt!298650)))))))

(declare-fun b!192001 () Bool)

(declare-fun res!160302 () Bool)

(assert (=> b!192001 (=> (not res!160302) (not e!132319))))

(assert (=> b!192001 (= res!160302 (isPrefixOf!0 thiss!1204 (_2!8944 lt!298640)))))

(declare-fun b!192002 () Bool)

(assert (=> b!192002 (= e!132313 e!132316)))

(declare-fun res!160296 () Bool)

(assert (=> b!192002 (=> res!160296 e!132316)))

(assert (=> b!192002 (= res!160296 (not (= (_1!8946 lt!298648) lt!298642)))))

(assert (=> b!192002 e!132326))

(declare-fun res!160292 () Bool)

(assert (=> b!192002 (=> (not res!160292) (not e!132326))))

(declare-fun lt!298633 () tuple2!16600)

(assert (=> b!192002 (= res!160292 (and (= (_2!8945 lt!298644) (_2!8945 lt!298633)) (= (_1!8945 lt!298644) (_1!8945 lt!298633))))))

(declare-fun lt!298626 () Unit!13643)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13643)

(assert (=> b!192002 (= lt!298626 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8946 lt!298647) nBits!348 i!590 lt!298635))))

(assert (=> b!192002 (= lt!298633 (readNBitsLSBFirstsLoopPure!0 lt!298642 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298651))))

(assert (=> b!192002 (= lt!298642 (withMovedBitIndex!0 (_1!8946 lt!298647) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192003 () Bool)

(assert (=> b!192003 (= e!132321 (= (_2!8943 lt!298645) (_2!8943 lt!298628)))))

(declare-fun b!192004 () Bool)

(declare-fun e!132323 () Bool)

(declare-fun array_inv!4124 (array!9942) Bool)

(assert (=> b!192004 (= e!132323 (array_inv!4124 (buf!4863 thiss!1204)))))

(declare-fun b!192005 () Bool)

(declare-fun res!160285 () Bool)

(assert (=> b!192005 (=> res!160285 e!132318)))

(assert (=> b!192005 (= res!160285 (or (not (= (size!4383 (buf!4863 (_2!8944 lt!298650))) (size!4383 (buf!4863 thiss!1204)))) (not (= lt!298629 (bvsub (bvadd lt!298643 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192006 () Bool)

(declare-fun res!160282 () Bool)

(assert (=> b!192006 (=> res!160282 e!132318)))

(assert (=> b!192006 (= res!160282 (not (isPrefixOf!0 thiss!1204 (_2!8944 lt!298640))))))

(declare-fun b!192007 () Bool)

(declare-fun res!160295 () Bool)

(assert (=> b!192007 (=> (not res!160295) (not e!132312))))

(assert (=> b!192007 (= res!160295 (not (= i!590 nBits!348)))))

(declare-fun b!192008 () Bool)

(declare-fun res!160290 () Bool)

(assert (=> b!192008 (=> (not res!160290) (not e!132326))))

(assert (=> b!192008 (= res!160290 (= (_1!8946 lt!298648) (withMovedBitIndex!0 (_2!8946 lt!298648) (bvsub lt!298632 lt!298629))))))

(declare-fun res!160297 () Bool)

(declare-fun e!132324 () Bool)

(assert (=> start!41268 (=> (not res!160297) (not e!132324))))

(assert (=> start!41268 (= res!160297 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41268 e!132324))

(assert (=> start!41268 true))

(declare-fun inv!12 (BitStream!7874) Bool)

(assert (=> start!41268 (and (inv!12 thiss!1204) e!132323)))

(declare-fun b!191995 () Bool)

(assert (=> b!191995 (= e!132324 e!132312)))

(declare-fun res!160284 () Bool)

(assert (=> b!191995 (=> (not res!160284) (not e!132312))))

(assert (=> b!191995 (= res!160284 (validate_offset_bits!1 ((_ sign_extend 32) (size!4383 (buf!4863 thiss!1204))) ((_ sign_extend 32) (currentByte!9147 thiss!1204)) ((_ sign_extend 32) (currentBit!9142 thiss!1204)) lt!298631))))

(assert (=> b!191995 (= lt!298631 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192009 () Bool)

(assert (=> b!192009 (= e!132325 (= (_1!8945 lt!298644) (_2!8946 lt!298647)))))

(declare-fun b!192010 () Bool)

(assert (=> b!192010 (= e!132315 (invariant!0 (currentBit!9142 thiss!1204) (currentByte!9147 thiss!1204) (size!4383 (buf!4863 (_2!8944 lt!298650)))))))

(declare-fun b!192011 () Bool)

(declare-fun res!160299 () Bool)

(assert (=> b!192011 (=> res!160299 e!132316)))

(assert (=> b!192011 (= res!160299 (not (= (bitIndex!0 (size!4383 (buf!4863 (_1!8945 lt!298644))) (currentByte!9147 (_1!8945 lt!298644)) (currentBit!9142 (_1!8945 lt!298644))) (bitIndex!0 (size!4383 (buf!4863 (_2!8946 lt!298647))) (currentByte!9147 (_2!8946 lt!298647)) (currentBit!9142 (_2!8946 lt!298647))))))))

(assert (= (and start!41268 res!160297) b!191995))

(assert (= (and b!191995 res!160284) b!191998))

(assert (= (and b!191998 res!160288) b!192007))

(assert (= (and b!192007 res!160295) b!191999))

(assert (= (and b!191999 res!160289) b!191988))

(assert (= (and b!191988 res!160291) b!192001))

(assert (= (and b!192001 res!160302) b!191987))

(assert (= (and b!191987 res!160301) b!191991))

(assert (= (and b!191999 (not res!160286)) b!191989))

(assert (= (and b!191989 (not res!160287)) b!191993))

(assert (= (and b!191993 (not res!160280)) b!192005))

(assert (= (and b!192005 (not res!160285)) b!191994))

(assert (= (and b!191994 (not res!160283)) b!192006))

(assert (= (and b!192006 (not res!160282)) b!191996))

(assert (= (and b!191996 res!160298) b!192010))

(assert (= (and b!191996 res!160294) b!192003))

(assert (= (and b!191996 (not res!160281)) b!192002))

(assert (= (and b!192002 res!160292) b!191992))

(assert (= (and b!191992 res!160300) b!192008))

(assert (= (and b!192008 res!160290) b!191997))

(assert (= (and b!192002 (not res!160296)) b!192011))

(assert (= (and b!192011 (not res!160299)) b!192000))

(assert (= (and b!192000 res!160279) b!191990))

(assert (= (and b!191990 res!160293) b!192009))

(assert (= start!41268 b!192004))

(declare-fun m!298103 () Bool)

(assert (=> b!191990 m!298103))

(declare-fun m!298105 () Bool)

(assert (=> b!192004 m!298105))

(declare-fun m!298107 () Bool)

(assert (=> b!192011 m!298107))

(declare-fun m!298109 () Bool)

(assert (=> b!192011 m!298109))

(declare-fun m!298111 () Bool)

(assert (=> b!192006 m!298111))

(declare-fun m!298113 () Bool)

(assert (=> b!191992 m!298113))

(declare-fun m!298115 () Bool)

(assert (=> b!191998 m!298115))

(declare-fun m!298117 () Bool)

(assert (=> b!191989 m!298117))

(declare-fun m!298119 () Bool)

(assert (=> b!191989 m!298119))

(declare-fun m!298121 () Bool)

(assert (=> b!191989 m!298121))

(declare-fun m!298123 () Bool)

(assert (=> b!191989 m!298123))

(declare-fun m!298125 () Bool)

(assert (=> b!191991 m!298125))

(declare-fun m!298127 () Bool)

(assert (=> start!41268 m!298127))

(declare-fun m!298129 () Bool)

(assert (=> b!191996 m!298129))

(declare-fun m!298131 () Bool)

(assert (=> b!191996 m!298131))

(declare-fun m!298133 () Bool)

(assert (=> b!191996 m!298133))

(declare-fun m!298135 () Bool)

(assert (=> b!191996 m!298135))

(declare-fun m!298137 () Bool)

(assert (=> b!191996 m!298137))

(declare-fun m!298139 () Bool)

(assert (=> b!191996 m!298139))

(declare-fun m!298141 () Bool)

(assert (=> b!191996 m!298141))

(declare-fun m!298143 () Bool)

(assert (=> b!191996 m!298143))

(declare-fun m!298145 () Bool)

(assert (=> b!191996 m!298145))

(declare-fun m!298147 () Bool)

(assert (=> b!191996 m!298147))

(declare-fun m!298149 () Bool)

(assert (=> b!191996 m!298149))

(declare-fun m!298151 () Bool)

(assert (=> b!191996 m!298151))

(declare-fun m!298153 () Bool)

(assert (=> b!191996 m!298153))

(declare-fun m!298155 () Bool)

(assert (=> b!191996 m!298155))

(declare-fun m!298157 () Bool)

(assert (=> b!191996 m!298157))

(declare-fun m!298159 () Bool)

(assert (=> b!191996 m!298159))

(declare-fun m!298161 () Bool)

(assert (=> b!191987 m!298161))

(assert (=> b!191987 m!298161))

(declare-fun m!298163 () Bool)

(assert (=> b!191987 m!298163))

(declare-fun m!298165 () Bool)

(assert (=> b!192002 m!298165))

(declare-fun m!298167 () Bool)

(assert (=> b!192002 m!298167))

(declare-fun m!298169 () Bool)

(assert (=> b!192002 m!298169))

(declare-fun m!298171 () Bool)

(assert (=> b!191988 m!298171))

(declare-fun m!298173 () Bool)

(assert (=> b!191988 m!298173))

(assert (=> b!191999 m!298171))

(assert (=> b!191999 m!298173))

(declare-fun m!298175 () Bool)

(assert (=> b!191999 m!298175))

(declare-fun m!298177 () Bool)

(assert (=> b!191993 m!298177))

(assert (=> b!192001 m!298111))

(declare-fun m!298179 () Bool)

(assert (=> b!191994 m!298179))

(declare-fun m!298181 () Bool)

(assert (=> b!192010 m!298181))

(declare-fun m!298183 () Bool)

(assert (=> b!192008 m!298183))

(declare-fun m!298185 () Bool)

(assert (=> b!191995 m!298185))

(push 1)

(assert (not start!41268))

(assert (not b!191994))

(assert (not b!191988))

(assert (not b!191987))

(assert (not b!192010))

(assert (not b!192004))

(assert (not b!191995))

(assert (not b!192011))

(assert (not b!192006))

(assert (not b!191992))

(assert (not b!191990))

(assert (not b!191989))

(assert (not b!191998))

(assert (not b!192002))

(assert (not b!191991))

(assert (not b!192008))

(assert (not b!191999))

(assert (not b!192001))

(assert (not b!191993))

(assert (not b!191996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

