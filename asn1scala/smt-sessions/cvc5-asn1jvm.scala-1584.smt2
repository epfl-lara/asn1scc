; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45258 () Bool)

(assert start!45258)

(declare-fun b!217992 () Bool)

(declare-fun res!183461 () Bool)

(declare-fun e!148158 () Bool)

(assert (=> b!217992 (=> (not res!183461) (not e!148158))))

(declare-datatypes ((array!10622 0))(
  ( (array!10623 (arr!5593 (Array (_ BitVec 32) (_ BitVec 8))) (size!4663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8434 0))(
  ( (BitStream!8435 (buf!5210 array!10622) (currentByte!9809 (_ BitVec 32)) (currentBit!9804 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8434)

(declare-datatypes ((Unit!15523 0))(
  ( (Unit!15524) )
))
(declare-datatypes ((tuple2!18566 0))(
  ( (tuple2!18567 (_1!9941 Unit!15523) (_2!9941 BitStream!8434)) )
))
(declare-fun lt!345611 () tuple2!18566)

(declare-fun isPrefixOf!0 (BitStream!8434 BitStream!8434) Bool)

(assert (=> b!217992 (= res!183461 (isPrefixOf!0 thiss!1204 (_2!9941 lt!345611)))))

(declare-datatypes ((tuple2!18568 0))(
  ( (tuple2!18569 (_1!9942 BitStream!8434) (_2!9942 (_ BitVec 64))) )
))
(declare-fun lt!345599 () tuple2!18568)

(declare-fun lt!345619 () BitStream!8434)

(declare-fun b!217993 () Bool)

(declare-fun lt!345624 () tuple2!18568)

(declare-fun lt!345600 () (_ BitVec 64))

(declare-fun e!148155 () Bool)

(declare-datatypes ((tuple2!18570 0))(
  ( (tuple2!18571 (_1!9943 BitStream!8434) (_2!9943 BitStream!8434)) )
))
(declare-fun lt!345610 () tuple2!18570)

(declare-fun lt!345623 () (_ BitVec 64))

(assert (=> b!217993 (= e!148155 (and (= lt!345600 (bvsub lt!345623 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9943 lt!345610) lt!345619)) (= (_2!9942 lt!345599) (_2!9942 lt!345624)))))))

(declare-fun b!217994 () Bool)

(declare-fun e!148154 () Bool)

(declare-fun lt!345605 () tuple2!18566)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!217994 (= e!148154 (invariant!0 (currentBit!9804 thiss!1204) (currentByte!9809 thiss!1204) (size!4663 (buf!5210 (_2!9941 lt!345605)))))))

(declare-fun b!217995 () Bool)

(declare-fun e!148156 () Bool)

(declare-datatypes ((tuple2!18572 0))(
  ( (tuple2!18573 (_1!9944 BitStream!8434) (_2!9944 Bool)) )
))
(declare-fun lt!345604 () tuple2!18572)

(declare-fun lt!345612 () tuple2!18572)

(assert (=> b!217995 (= e!148156 (= (_2!9944 lt!345604) (_2!9944 lt!345612)))))

(declare-fun b!217996 () Bool)

(declare-fun res!183456 () Bool)

(declare-fun e!148157 () Bool)

(assert (=> b!217996 (=> res!183456 e!148157)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!345615 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!217996 (= res!183456 (or (not (= (size!4663 (buf!5210 (_2!9941 lt!345605))) (size!4663 (buf!5210 thiss!1204)))) (not (= lt!345615 (bvsub (bvadd lt!345600 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!217997 () Bool)

(declare-fun e!148163 () Bool)

(declare-fun e!148160 () Bool)

(assert (=> b!217997 (= e!148163 (not e!148160))))

(declare-fun res!183452 () Bool)

(assert (=> b!217997 (=> res!183452 e!148160)))

(assert (=> b!217997 (= res!183452 (not (= lt!345623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!345600))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217997 (= lt!345623 (bitIndex!0 (size!4663 (buf!5210 (_2!9941 lt!345611))) (currentByte!9809 (_2!9941 lt!345611)) (currentBit!9804 (_2!9941 lt!345611))))))

(assert (=> b!217997 (= lt!345600 (bitIndex!0 (size!4663 (buf!5210 thiss!1204)) (currentByte!9809 thiss!1204) (currentBit!9804 thiss!1204)))))

(declare-fun e!148159 () Bool)

(assert (=> b!217997 e!148159))

(declare-fun res!183447 () Bool)

(assert (=> b!217997 (=> (not res!183447) (not e!148159))))

(assert (=> b!217997 (= res!183447 (= (size!4663 (buf!5210 thiss!1204)) (size!4663 (buf!5210 (_2!9941 lt!345611)))))))

(declare-fun lt!345621 () Bool)

(declare-fun appendBit!0 (BitStream!8434 Bool) tuple2!18566)

(assert (=> b!217997 (= lt!345611 (appendBit!0 thiss!1204 lt!345621))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!345606 () (_ BitVec 64))

(assert (=> b!217997 (= lt!345621 (not (= (bvand v!189 lt!345606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217997 (= lt!345606 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!217998 () Bool)

(declare-fun e!148152 () Bool)

(assert (=> b!217998 (= e!148152 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-fun e!148162 () Bool)

(assert (=> b!217998 e!148162))

(declare-fun res!183455 () Bool)

(assert (=> b!217998 (=> (not res!183455) (not e!148162))))

(assert (=> b!217998 (= res!183455 (= (size!4663 (buf!5210 thiss!1204)) (size!4663 (buf!5210 (_2!9941 lt!345605)))))))

(declare-fun b!217999 () Bool)

(declare-fun e!148150 () Bool)

(assert (=> b!217999 (= e!148158 e!148150)))

(declare-fun res!183459 () Bool)

(assert (=> b!217999 (=> (not res!183459) (not e!148150))))

(declare-fun lt!345607 () tuple2!18572)

(assert (=> b!217999 (= res!183459 (and (= (_2!9944 lt!345607) lt!345621) (= (_1!9944 lt!345607) (_2!9941 lt!345611))))))

(declare-fun readBitPure!0 (BitStream!8434) tuple2!18572)

(declare-fun readerFrom!0 (BitStream!8434 (_ BitVec 32) (_ BitVec 32)) BitStream!8434)

(assert (=> b!217999 (= lt!345607 (readBitPure!0 (readerFrom!0 (_2!9941 lt!345611) (currentBit!9804 thiss!1204) (currentByte!9809 thiss!1204))))))

(declare-fun b!218000 () Bool)

(declare-fun res!183450 () Bool)

(assert (=> b!218000 (=> (not res!183450) (not e!148155))))

(declare-fun withMovedBitIndex!0 (BitStream!8434 (_ BitVec 64)) BitStream!8434)

(assert (=> b!218000 (= res!183450 (= (_1!9943 lt!345610) (withMovedBitIndex!0 (_2!9943 lt!345610) (bvsub lt!345623 lt!345615))))))

(declare-fun b!218001 () Bool)

(declare-fun e!148153 () Bool)

(assert (=> b!218001 (= e!148153 e!148152)))

(declare-fun res!183445 () Bool)

(assert (=> b!218001 (=> res!183445 e!148152)))

(assert (=> b!218001 (= res!183445 (not (= (_1!9943 lt!345610) lt!345619)))))

(assert (=> b!218001 e!148155))

(declare-fun res!183462 () Bool)

(assert (=> b!218001 (=> (not res!183462) (not e!148155))))

(declare-fun lt!345620 () tuple2!18568)

(assert (=> b!218001 (= res!183462 (and (= (_2!9942 lt!345599) (_2!9942 lt!345620)) (= (_1!9942 lt!345599) (_1!9942 lt!345620))))))

(declare-fun lt!345616 () Unit!15523)

(declare-fun lt!345626 () (_ BitVec 64))

(declare-fun lt!345622 () tuple2!18570)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15523)

(assert (=> b!218001 (= lt!345616 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9943 lt!345622) nBits!348 i!590 lt!345626))))

(declare-fun lt!345598 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18568)

(assert (=> b!218001 (= lt!345620 (readNBitsLSBFirstsLoopPure!0 lt!345619 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345598))))

(assert (=> b!218001 (= lt!345619 (withMovedBitIndex!0 (_1!9943 lt!345622) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!218002 () Bool)

(declare-fun res!183449 () Bool)

(assert (=> b!218002 (=> (not res!183449) (not e!148162))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218002 (= res!183449 (= (_2!9942 lt!345599) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218003 () Bool)

(declare-fun res!183444 () Bool)

(assert (=> b!218003 (=> (not res!183444) (not e!148163))))

(assert (=> b!218003 (= res!183444 (not (= i!590 nBits!348)))))

(declare-fun b!218004 () Bool)

(declare-fun res!183454 () Bool)

(assert (=> b!218004 (=> res!183454 e!148152)))

(assert (=> b!218004 (= res!183454 (not (= (bitIndex!0 (size!4663 (buf!5210 (_1!9942 lt!345599))) (currentByte!9809 (_1!9942 lt!345599)) (currentBit!9804 (_1!9942 lt!345599))) (bitIndex!0 (size!4663 (buf!5210 (_2!9943 lt!345622))) (currentByte!9809 (_2!9943 lt!345622)) (currentBit!9804 (_2!9943 lt!345622))))))))

(declare-fun b!218005 () Bool)

(assert (=> b!218005 (= e!148160 e!148157)))

(declare-fun res!183448 () Bool)

(assert (=> b!218005 (=> res!183448 e!148157)))

(assert (=> b!218005 (= res!183448 (not (= lt!345615 (bvsub (bvsub (bvadd lt!345623 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!218005 (= lt!345615 (bitIndex!0 (size!4663 (buf!5210 (_2!9941 lt!345605))) (currentByte!9809 (_2!9941 lt!345605)) (currentBit!9804 (_2!9941 lt!345605))))))

(assert (=> b!218005 (isPrefixOf!0 thiss!1204 (_2!9941 lt!345605))))

(declare-fun lt!345617 () Unit!15523)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8434 BitStream!8434 BitStream!8434) Unit!15523)

(assert (=> b!218005 (= lt!345617 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9941 lt!345611) (_2!9941 lt!345605)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8434 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18566)

(assert (=> b!218005 (= lt!345605 (appendBitsLSBFirstLoopTR!0 (_2!9941 lt!345611) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218006 () Bool)

(declare-fun e!148161 () Bool)

(declare-fun array_inv!4404 (array!10622) Bool)

(assert (=> b!218006 (= e!148161 (array_inv!4404 (buf!5210 thiss!1204)))))

(declare-fun b!218007 () Bool)

(assert (=> b!218007 (= e!148157 e!148153)))

(declare-fun res!183451 () Bool)

(assert (=> b!218007 (=> res!183451 e!148153)))

(assert (=> b!218007 (= res!183451 (not (= (_1!9942 lt!345624) (_2!9943 lt!345610))))))

(assert (=> b!218007 (= lt!345624 (readNBitsLSBFirstsLoopPure!0 (_1!9943 lt!345610) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345598))))

(declare-fun lt!345613 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218007 (validate_offset_bits!1 ((_ sign_extend 32) (size!4663 (buf!5210 (_2!9941 lt!345605)))) ((_ sign_extend 32) (currentByte!9809 (_2!9941 lt!345611))) ((_ sign_extend 32) (currentBit!9804 (_2!9941 lt!345611))) lt!345613)))

(declare-fun lt!345602 () Unit!15523)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8434 array!10622 (_ BitVec 64)) Unit!15523)

(assert (=> b!218007 (= lt!345602 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9941 lt!345611) (buf!5210 (_2!9941 lt!345605)) lt!345613))))

(assert (=> b!218007 (= lt!345613 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!345618 () tuple2!18572)

(assert (=> b!218007 (= lt!345598 (bvor lt!345626 (ite (_2!9944 lt!345618) lt!345606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218007 (= lt!345599 (readNBitsLSBFirstsLoopPure!0 (_1!9943 lt!345622) nBits!348 i!590 lt!345626))))

(declare-fun lt!345625 () (_ BitVec 64))

(assert (=> b!218007 (validate_offset_bits!1 ((_ sign_extend 32) (size!4663 (buf!5210 (_2!9941 lt!345605)))) ((_ sign_extend 32) (currentByte!9809 thiss!1204)) ((_ sign_extend 32) (currentBit!9804 thiss!1204)) lt!345625)))

(declare-fun lt!345601 () Unit!15523)

(assert (=> b!218007 (= lt!345601 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5210 (_2!9941 lt!345605)) lt!345625))))

(assert (=> b!218007 (= lt!345626 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218007 (= (_2!9944 lt!345618) lt!345621)))

(assert (=> b!218007 (= lt!345618 (readBitPure!0 (_1!9943 lt!345622)))))

(declare-fun reader!0 (BitStream!8434 BitStream!8434) tuple2!18570)

(assert (=> b!218007 (= lt!345610 (reader!0 (_2!9941 lt!345611) (_2!9941 lt!345605)))))

(assert (=> b!218007 (= lt!345622 (reader!0 thiss!1204 (_2!9941 lt!345605)))))

(assert (=> b!218007 e!148156))

(declare-fun res!183467 () Bool)

(assert (=> b!218007 (=> (not res!183467) (not e!148156))))

(assert (=> b!218007 (= res!183467 (= (bitIndex!0 (size!4663 (buf!5210 (_1!9944 lt!345604))) (currentByte!9809 (_1!9944 lt!345604)) (currentBit!9804 (_1!9944 lt!345604))) (bitIndex!0 (size!4663 (buf!5210 (_1!9944 lt!345612))) (currentByte!9809 (_1!9944 lt!345612)) (currentBit!9804 (_1!9944 lt!345612)))))))

(declare-fun lt!345614 () Unit!15523)

(declare-fun lt!345609 () BitStream!8434)

(declare-fun readBitPrefixLemma!0 (BitStream!8434 BitStream!8434) Unit!15523)

(assert (=> b!218007 (= lt!345614 (readBitPrefixLemma!0 lt!345609 (_2!9941 lt!345605)))))

(assert (=> b!218007 (= lt!345612 (readBitPure!0 (BitStream!8435 (buf!5210 (_2!9941 lt!345605)) (currentByte!9809 thiss!1204) (currentBit!9804 thiss!1204))))))

(assert (=> b!218007 (= lt!345604 (readBitPure!0 lt!345609))))

(assert (=> b!218007 e!148154))

(declare-fun res!183457 () Bool)

(assert (=> b!218007 (=> (not res!183457) (not e!148154))))

(assert (=> b!218007 (= res!183457 (invariant!0 (currentBit!9804 thiss!1204) (currentByte!9809 thiss!1204) (size!4663 (buf!5210 (_2!9941 lt!345611)))))))

(assert (=> b!218007 (= lt!345609 (BitStream!8435 (buf!5210 (_2!9941 lt!345611)) (currentByte!9809 thiss!1204) (currentBit!9804 thiss!1204)))))

(declare-fun b!218008 () Bool)

(declare-fun lt!345603 () (_ BitVec 64))

(assert (=> b!218008 (= e!148150 (= (bitIndex!0 (size!4663 (buf!5210 (_1!9944 lt!345607))) (currentByte!9809 (_1!9944 lt!345607)) (currentBit!9804 (_1!9944 lt!345607))) lt!345603))))

(declare-fun b!218009 () Bool)

(declare-fun res!183463 () Bool)

(assert (=> b!218009 (=> (not res!183463) (not e!148155))))

(assert (=> b!218009 (= res!183463 (= (_1!9943 lt!345622) (withMovedBitIndex!0 (_2!9943 lt!345622) (bvsub lt!345600 lt!345615))))))

(declare-fun res!183458 () Bool)

(declare-fun e!148151 () Bool)

(assert (=> start!45258 (=> (not res!183458) (not e!148151))))

(assert (=> start!45258 (= res!183458 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45258 e!148151))

(assert (=> start!45258 true))

(declare-fun inv!12 (BitStream!8434) Bool)

(assert (=> start!45258 (and (inv!12 thiss!1204) e!148161)))

(declare-fun b!218010 () Bool)

(assert (=> b!218010 (= e!148151 e!148163)))

(declare-fun res!183465 () Bool)

(assert (=> b!218010 (=> (not res!183465) (not e!148163))))

(assert (=> b!218010 (= res!183465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4663 (buf!5210 thiss!1204))) ((_ sign_extend 32) (currentByte!9809 thiss!1204)) ((_ sign_extend 32) (currentBit!9804 thiss!1204)) lt!345625))))

(assert (=> b!218010 (= lt!345625 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!218011 () Bool)

(declare-fun res!183464 () Bool)

(assert (=> b!218011 (=> (not res!183464) (not e!148163))))

(assert (=> b!218011 (= res!183464 (invariant!0 (currentBit!9804 thiss!1204) (currentByte!9809 thiss!1204) (size!4663 (buf!5210 thiss!1204))))))

(declare-fun b!218012 () Bool)

(declare-fun res!183446 () Bool)

(assert (=> b!218012 (=> res!183446 e!148157)))

(assert (=> b!218012 (= res!183446 (not (invariant!0 (currentBit!9804 (_2!9941 lt!345605)) (currentByte!9809 (_2!9941 lt!345605)) (size!4663 (buf!5210 (_2!9941 lt!345605))))))))

(declare-fun b!218013 () Bool)

(assert (=> b!218013 (= e!148159 e!148158)))

(declare-fun res!183466 () Bool)

(assert (=> b!218013 (=> (not res!183466) (not e!148158))))

(declare-fun lt!345608 () (_ BitVec 64))

(assert (=> b!218013 (= res!183466 (= lt!345603 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!345608)))))

(assert (=> b!218013 (= lt!345603 (bitIndex!0 (size!4663 (buf!5210 (_2!9941 lt!345611))) (currentByte!9809 (_2!9941 lt!345611)) (currentBit!9804 (_2!9941 lt!345611))))))

(assert (=> b!218013 (= lt!345608 (bitIndex!0 (size!4663 (buf!5210 thiss!1204)) (currentByte!9809 thiss!1204) (currentBit!9804 thiss!1204)))))

(declare-fun b!218014 () Bool)

(declare-fun res!183460 () Bool)

(assert (=> b!218014 (=> res!183460 e!148157)))

(assert (=> b!218014 (= res!183460 (not (isPrefixOf!0 thiss!1204 (_2!9941 lt!345611))))))

(declare-fun b!218015 () Bool)

(declare-fun res!183453 () Bool)

(assert (=> b!218015 (=> res!183453 e!148157)))

(assert (=> b!218015 (= res!183453 (not (isPrefixOf!0 (_2!9941 lt!345611) (_2!9941 lt!345605))))))

(declare-fun b!218016 () Bool)

(assert (=> b!218016 (= e!148162 (= (_1!9942 lt!345599) (_2!9943 lt!345622)))))

(assert (= (and start!45258 res!183458) b!218010))

(assert (= (and b!218010 res!183465) b!218011))

(assert (= (and b!218011 res!183464) b!218003))

(assert (= (and b!218003 res!183444) b!217997))

(assert (= (and b!217997 res!183447) b!218013))

(assert (= (and b!218013 res!183466) b!217992))

(assert (= (and b!217992 res!183461) b!217999))

(assert (= (and b!217999 res!183459) b!218008))

(assert (= (and b!217997 (not res!183452)) b!218005))

(assert (= (and b!218005 (not res!183448)) b!218012))

(assert (= (and b!218012 (not res!183446)) b!217996))

(assert (= (and b!217996 (not res!183456)) b!218015))

(assert (= (and b!218015 (not res!183453)) b!218014))

(assert (= (and b!218014 (not res!183460)) b!218007))

(assert (= (and b!218007 res!183457) b!217994))

(assert (= (and b!218007 res!183467) b!217995))

(assert (= (and b!218007 (not res!183451)) b!218001))

(assert (= (and b!218001 res!183462) b!218009))

(assert (= (and b!218009 res!183463) b!218000))

(assert (= (and b!218000 res!183450) b!217993))

(assert (= (and b!218001 (not res!183445)) b!218004))

(assert (= (and b!218004 (not res!183454)) b!217998))

(assert (= (and b!217998 res!183455) b!218002))

(assert (= (and b!218002 res!183449) b!218016))

(assert (= start!45258 b!218006))

(declare-fun m!336435 () Bool)

(assert (=> b!218012 m!336435))

(declare-fun m!336437 () Bool)

(assert (=> b!218007 m!336437))

(declare-fun m!336439 () Bool)

(assert (=> b!218007 m!336439))

(declare-fun m!336441 () Bool)

(assert (=> b!218007 m!336441))

(declare-fun m!336443 () Bool)

(assert (=> b!218007 m!336443))

(declare-fun m!336445 () Bool)

(assert (=> b!218007 m!336445))

(declare-fun m!336447 () Bool)

(assert (=> b!218007 m!336447))

(declare-fun m!336449 () Bool)

(assert (=> b!218007 m!336449))

(declare-fun m!336451 () Bool)

(assert (=> b!218007 m!336451))

(declare-fun m!336453 () Bool)

(assert (=> b!218007 m!336453))

(declare-fun m!336455 () Bool)

(assert (=> b!218007 m!336455))

(declare-fun m!336457 () Bool)

(assert (=> b!218007 m!336457))

(declare-fun m!336459 () Bool)

(assert (=> b!218007 m!336459))

(declare-fun m!336461 () Bool)

(assert (=> b!218007 m!336461))

(declare-fun m!336463 () Bool)

(assert (=> b!218007 m!336463))

(declare-fun m!336465 () Bool)

(assert (=> b!218007 m!336465))

(declare-fun m!336467 () Bool)

(assert (=> b!218007 m!336467))

(declare-fun m!336469 () Bool)

(assert (=> start!45258 m!336469))

(declare-fun m!336471 () Bool)

(assert (=> b!218006 m!336471))

(declare-fun m!336473 () Bool)

(assert (=> b!218000 m!336473))

(declare-fun m!336475 () Bool)

(assert (=> b!218015 m!336475))

(declare-fun m!336477 () Bool)

(assert (=> b!218009 m!336477))

(declare-fun m!336479 () Bool)

(assert (=> b!218004 m!336479))

(declare-fun m!336481 () Bool)

(assert (=> b!218004 m!336481))

(declare-fun m!336483 () Bool)

(assert (=> b!217994 m!336483))

(declare-fun m!336485 () Bool)

(assert (=> b!218013 m!336485))

(declare-fun m!336487 () Bool)

(assert (=> b!218013 m!336487))

(declare-fun m!336489 () Bool)

(assert (=> b!217999 m!336489))

(assert (=> b!217999 m!336489))

(declare-fun m!336491 () Bool)

(assert (=> b!217999 m!336491))

(declare-fun m!336493 () Bool)

(assert (=> b!218005 m!336493))

(declare-fun m!336495 () Bool)

(assert (=> b!218005 m!336495))

(declare-fun m!336497 () Bool)

(assert (=> b!218005 m!336497))

(declare-fun m!336499 () Bool)

(assert (=> b!218005 m!336499))

(declare-fun m!336501 () Bool)

(assert (=> b!218001 m!336501))

(declare-fun m!336503 () Bool)

(assert (=> b!218001 m!336503))

(declare-fun m!336505 () Bool)

(assert (=> b!218001 m!336505))

(declare-fun m!336507 () Bool)

(assert (=> b!218002 m!336507))

(declare-fun m!336509 () Bool)

(assert (=> b!218008 m!336509))

(declare-fun m!336511 () Bool)

(assert (=> b!217992 m!336511))

(declare-fun m!336513 () Bool)

(assert (=> b!218010 m!336513))

(assert (=> b!217997 m!336485))

(assert (=> b!217997 m!336487))

(declare-fun m!336515 () Bool)

(assert (=> b!217997 m!336515))

(declare-fun m!336517 () Bool)

(assert (=> b!218011 m!336517))

(assert (=> b!218014 m!336511))

(push 1)

(assert (not b!218004))

(assert (not b!218013))

(assert (not b!218008))

(assert (not b!218007))

(assert (not b!218014))

(assert (not b!217997))

(assert (not b!217994))

(assert (not b!218000))

(assert (not b!217999))

(assert (not b!218009))

(assert (not b!218005))

(assert (not b!218011))

(assert (not start!45258))

(assert (not b!218010))

(assert (not b!218006))

(assert (not b!218015))

(assert (not b!218012))

(assert (not b!218001))

(assert (not b!217992))

(assert (not b!218002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

