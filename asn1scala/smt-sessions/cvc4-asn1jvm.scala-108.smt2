; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2694 () Bool)

(assert start!2694)

(declare-fun b!13021 () Bool)

(declare-fun e!7899 () Bool)

(declare-datatypes ((array!709 0))(
  ( (array!710 (arr!738 (Array (_ BitVec 32) (_ BitVec 8))) (size!309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!578 0))(
  ( (BitStream!579 (buf!660 array!709) (currentByte!1744 (_ BitVec 32)) (currentBit!1739 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!578)

(declare-fun array_inv!298 (array!709) Bool)

(assert (=> b!13021 (= e!7899 (array_inv!298 (buf!660 thiss!1486)))))

(declare-fun res!12391 () Bool)

(declare-fun e!7901 () Bool)

(assert (=> start!2694 (=> (not res!12391) (not e!7901))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!709)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2694 (= res!12391 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!309 srcBuffer!6))))))))

(assert (=> start!2694 e!7901))

(assert (=> start!2694 true))

(assert (=> start!2694 (array_inv!298 srcBuffer!6)))

(declare-fun inv!12 (BitStream!578) Bool)

(assert (=> start!2694 (and (inv!12 thiss!1486) e!7899)))

(declare-fun b!13022 () Bool)

(declare-fun res!12388 () Bool)

(assert (=> b!13022 (=> (not res!12388) (not e!7901))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13022 (= res!12388 (validate_offset_bits!1 ((_ sign_extend 32) (size!309 (buf!660 thiss!1486))) ((_ sign_extend 32) (currentByte!1744 thiss!1486)) ((_ sign_extend 32) (currentBit!1739 thiss!1486)) nBits!460))))

(declare-fun b!13023 () Bool)

(declare-fun res!12390 () Bool)

(declare-fun e!7898 () Bool)

(assert (=> b!13023 (=> res!12390 e!7898)))

(declare-datatypes ((List!185 0))(
  ( (Nil!182) (Cons!181 (h!300 Bool) (t!935 List!185)) )
))
(declare-fun lt!20779 () List!185)

(declare-datatypes ((Unit!1101 0))(
  ( (Unit!1102) )
))
(declare-datatypes ((tuple2!1540 0))(
  ( (tuple2!1541 (_1!825 Unit!1101) (_2!825 BitStream!578)) )
))
(declare-fun lt!20776 () tuple2!1540)

(declare-fun byteArrayBitContentToList!0 (BitStream!578 array!709 (_ BitVec 64) (_ BitVec 64)) List!185)

(assert (=> b!13023 (= res!12390 (not (= lt!20779 (byteArrayBitContentToList!0 (_2!825 lt!20776) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!13024 () Bool)

(declare-fun e!7897 () Bool)

(assert (=> b!13024 (= e!7897 (not e!7898))))

(declare-fun res!12385 () Bool)

(assert (=> b!13024 (=> res!12385 e!7898)))

(declare-datatypes ((tuple2!1542 0))(
  ( (tuple2!1543 (_1!826 array!709) (_2!826 BitStream!578)) )
))
(declare-fun lt!20777 () tuple2!1542)

(assert (=> b!13024 (= res!12385 (not (= (byteArrayBitContentToList!0 (_2!825 lt!20776) (_1!826 lt!20777) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20779)))))

(declare-datatypes ((tuple2!1544 0))(
  ( (tuple2!1545 (_1!827 BitStream!578) (_2!827 BitStream!578)) )
))
(declare-fun lt!20780 () tuple2!1544)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!578 BitStream!578 (_ BitVec 64)) List!185)

(assert (=> b!13024 (= lt!20779 (bitStreamReadBitsIntoList!0 (_2!825 lt!20776) (_1!827 lt!20780) nBits!460))))

(declare-fun readBits!0 (BitStream!578 (_ BitVec 64)) tuple2!1542)

(assert (=> b!13024 (= lt!20777 (readBits!0 (_1!827 lt!20780) nBits!460))))

(assert (=> b!13024 (validate_offset_bits!1 ((_ sign_extend 32) (size!309 (buf!660 (_2!825 lt!20776)))) ((_ sign_extend 32) (currentByte!1744 thiss!1486)) ((_ sign_extend 32) (currentBit!1739 thiss!1486)) nBits!460)))

(declare-fun lt!20778 () Unit!1101)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!578 array!709 (_ BitVec 64)) Unit!1101)

(assert (=> b!13024 (= lt!20778 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!660 (_2!825 lt!20776)) nBits!460))))

(declare-fun reader!0 (BitStream!578 BitStream!578) tuple2!1544)

(assert (=> b!13024 (= lt!20780 (reader!0 thiss!1486 (_2!825 lt!20776)))))

(declare-fun b!13025 () Bool)

(declare-fun res!12386 () Bool)

(assert (=> b!13025 (=> (not res!12386) (not e!7897))))

(declare-fun isPrefixOf!0 (BitStream!578 BitStream!578) Bool)

(assert (=> b!13025 (= res!12386 (isPrefixOf!0 thiss!1486 (_2!825 lt!20776)))))

(declare-fun b!13026 () Bool)

(declare-fun res!12384 () Bool)

(assert (=> b!13026 (=> (not res!12384) (not e!7897))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13026 (= res!12384 (= (bitIndex!0 (size!309 (buf!660 (_2!825 lt!20776))) (currentByte!1744 (_2!825 lt!20776)) (currentBit!1739 (_2!825 lt!20776))) (bvadd (bitIndex!0 (size!309 (buf!660 thiss!1486)) (currentByte!1744 thiss!1486) (currentBit!1739 thiss!1486)) nBits!460)))))

(declare-fun b!13027 () Bool)

(assert (=> b!13027 (= e!7898 true)))

(declare-fun lt!20775 () Unit!1101)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!578 array!709 array!709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1101)

(assert (=> b!13027 (= lt!20775 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!825 lt!20776) srcBuffer!6 (_1!826 lt!20777) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!13028 () Bool)

(declare-fun res!12387 () Bool)

(assert (=> b!13028 (=> (not res!12387) (not e!7897))))

(assert (=> b!13028 (= res!12387 (= (size!309 (buf!660 thiss!1486)) (size!309 (buf!660 (_2!825 lt!20776)))))))

(declare-fun b!13029 () Bool)

(assert (=> b!13029 (= e!7901 e!7897)))

(declare-fun res!12389 () Bool)

(assert (=> b!13029 (=> (not res!12389) (not e!7897))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13029 (= res!12389 (invariant!0 (currentBit!1739 (_2!825 lt!20776)) (currentByte!1744 (_2!825 lt!20776)) (size!309 (buf!660 (_2!825 lt!20776)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!578 array!709 (_ BitVec 64) (_ BitVec 64)) tuple2!1540)

(assert (=> b!13029 (= lt!20776 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2694 res!12391) b!13022))

(assert (= (and b!13022 res!12388) b!13029))

(assert (= (and b!13029 res!12389) b!13028))

(assert (= (and b!13028 res!12387) b!13026))

(assert (= (and b!13026 res!12384) b!13025))

(assert (= (and b!13025 res!12386) b!13024))

(assert (= (and b!13024 (not res!12385)) b!13023))

(assert (= (and b!13023 (not res!12390)) b!13027))

(assert (= start!2694 b!13021))

(declare-fun m!19627 () Bool)

(assert (=> b!13023 m!19627))

(declare-fun m!19629 () Bool)

(assert (=> b!13026 m!19629))

(declare-fun m!19631 () Bool)

(assert (=> b!13026 m!19631))

(declare-fun m!19633 () Bool)

(assert (=> b!13025 m!19633))

(declare-fun m!19635 () Bool)

(assert (=> b!13029 m!19635))

(declare-fun m!19637 () Bool)

(assert (=> b!13029 m!19637))

(declare-fun m!19639 () Bool)

(assert (=> start!2694 m!19639))

(declare-fun m!19641 () Bool)

(assert (=> start!2694 m!19641))

(declare-fun m!19643 () Bool)

(assert (=> b!13021 m!19643))

(declare-fun m!19645 () Bool)

(assert (=> b!13027 m!19645))

(declare-fun m!19647 () Bool)

(assert (=> b!13022 m!19647))

(declare-fun m!19649 () Bool)

(assert (=> b!13024 m!19649))

(declare-fun m!19651 () Bool)

(assert (=> b!13024 m!19651))

(declare-fun m!19653 () Bool)

(assert (=> b!13024 m!19653))

(declare-fun m!19655 () Bool)

(assert (=> b!13024 m!19655))

(declare-fun m!19657 () Bool)

(assert (=> b!13024 m!19657))

(declare-fun m!19659 () Bool)

(assert (=> b!13024 m!19659))

(push 1)

(assert (not b!13029))

(assert (not start!2694))

(assert (not b!13025))

(assert (not b!13022))

(assert (not b!13026))

(assert (not b!13027))

(assert (not b!13023))

(assert (not b!13024))

(assert (not b!13021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

