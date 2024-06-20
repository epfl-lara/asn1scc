; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6926 () Bool)

(assert start!6926)

(declare-fun b!33466 () Bool)

(declare-fun res!28681 () Bool)

(declare-fun e!22204 () Bool)

(assert (=> b!33466 (=> (not res!28681) (not e!22204))))

(declare-datatypes ((array!1862 0))(
  ( (array!1863 (arr!1298 (Array (_ BitVec 32) (_ BitVec 8))) (size!823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1438 0))(
  ( (BitStream!1439 (buf!1151 array!1862) (currentByte!2518 (_ BitVec 32)) (currentBit!2513 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1438)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33466 (= res!28681 (validate_offset_bits!1 ((_ sign_extend 32) (size!823 (buf!1151 thiss!1379))) ((_ sign_extend 32) (currentByte!2518 thiss!1379)) ((_ sign_extend 32) (currentBit!2513 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33467 () Bool)

(declare-fun e!22210 () Bool)

(declare-fun e!22208 () Bool)

(assert (=> b!33467 (= e!22210 e!22208)))

(declare-fun res!28676 () Bool)

(assert (=> b!33467 (=> res!28676 e!22208)))

(declare-datatypes ((Unit!2501 0))(
  ( (Unit!2502) )
))
(declare-datatypes ((tuple2!3406 0))(
  ( (tuple2!3407 (_1!1790 Unit!2501) (_2!1790 BitStream!1438)) )
))
(declare-fun lt!49195 () tuple2!3406)

(declare-fun isPrefixOf!0 (BitStream!1438 BitStream!1438) Bool)

(assert (=> b!33467 (= res!28676 (not (isPrefixOf!0 thiss!1379 (_2!1790 lt!49195))))))

(declare-fun lt!49185 () (_ BitVec 64))

(assert (=> b!33467 (validate_offset_bits!1 ((_ sign_extend 32) (size!823 (buf!1151 (_2!1790 lt!49195)))) ((_ sign_extend 32) (currentByte!2518 (_2!1790 lt!49195))) ((_ sign_extend 32) (currentBit!2513 (_2!1790 lt!49195))) lt!49185)))

(assert (=> b!33467 (= lt!49185 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49191 () Unit!2501)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1438 BitStream!1438 (_ BitVec 64) (_ BitVec 64)) Unit!2501)

(assert (=> b!33467 (= lt!49191 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1790 lt!49195) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1862)

(declare-fun appendBitFromByte!0 (BitStream!1438 (_ BitVec 8) (_ BitVec 32)) tuple2!3406)

(assert (=> b!33467 (= lt!49195 (appendBitFromByte!0 thiss!1379 (select (arr!1298 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33468 () Bool)

(declare-fun res!28677 () Bool)

(declare-fun e!22212 () Bool)

(assert (=> b!33468 (=> res!28677 e!22212)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33468 (= res!28677 (not (invariant!0 (currentBit!2513 (_2!1790 lt!49195)) (currentByte!2518 (_2!1790 lt!49195)) (size!823 (buf!1151 (_2!1790 lt!49195))))))))

(declare-fun b!33469 () Bool)

(declare-fun e!22209 () Bool)

(assert (=> b!33469 (= e!22209 e!22212)))

(declare-fun res!28671 () Bool)

(assert (=> b!33469 (=> res!28671 e!22212)))

(declare-fun lt!49184 () tuple2!3406)

(assert (=> b!33469 (= res!28671 (not (= (size!823 (buf!1151 (_2!1790 lt!49195))) (size!823 (buf!1151 (_2!1790 lt!49184))))))))

(declare-fun e!22207 () Bool)

(assert (=> b!33469 e!22207))

(declare-fun res!28682 () Bool)

(assert (=> b!33469 (=> (not res!28682) (not e!22207))))

(assert (=> b!33469 (= res!28682 (= (size!823 (buf!1151 (_2!1790 lt!49184))) (size!823 (buf!1151 thiss!1379))))))

(declare-fun b!33470 () Bool)

(declare-fun res!28680 () Bool)

(assert (=> b!33470 (=> res!28680 e!22209)))

(assert (=> b!33470 (= res!28680 (not (= (size!823 (buf!1151 thiss!1379)) (size!823 (buf!1151 (_2!1790 lt!49184))))))))

(declare-fun b!33471 () Bool)

(declare-fun lt!49190 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33471 (= e!22207 (= lt!49190 (bvsub (bvsub (bvadd (bitIndex!0 (size!823 (buf!1151 (_2!1790 lt!49195))) (currentByte!2518 (_2!1790 lt!49195)) (currentBit!2513 (_2!1790 lt!49195))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33472 () Bool)

(declare-fun res!28679 () Bool)

(assert (=> b!33472 (=> res!28679 e!22212)))

(assert (=> b!33472 (= res!28679 (not (invariant!0 (currentBit!2513 (_2!1790 lt!49195)) (currentByte!2518 (_2!1790 lt!49195)) (size!823 (buf!1151 (_2!1790 lt!49184))))))))

(declare-fun b!33473 () Bool)

(declare-fun e!22206 () Bool)

(assert (=> b!33473 (= e!22206 e!22209)))

(declare-fun res!28674 () Bool)

(assert (=> b!33473 (=> res!28674 e!22209)))

(declare-fun lt!49188 () (_ BitVec 64))

(assert (=> b!33473 (= res!28674 (not (= lt!49190 (bvsub (bvadd lt!49188 to!314) i!635))))))

(assert (=> b!33473 (= lt!49190 (bitIndex!0 (size!823 (buf!1151 (_2!1790 lt!49184))) (currentByte!2518 (_2!1790 lt!49184)) (currentBit!2513 (_2!1790 lt!49184))))))

(declare-fun res!28670 () Bool)

(assert (=> start!6926 (=> (not res!28670) (not e!22204))))

(assert (=> start!6926 (= res!28670 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!823 srcBuffer!2))))))))

(assert (=> start!6926 e!22204))

(assert (=> start!6926 true))

(declare-fun array_inv!772 (array!1862) Bool)

(assert (=> start!6926 (array_inv!772 srcBuffer!2)))

(declare-fun e!22202 () Bool)

(declare-fun inv!12 (BitStream!1438) Bool)

(assert (=> start!6926 (and (inv!12 thiss!1379) e!22202)))

(declare-fun b!33474 () Bool)

(declare-fun res!28678 () Bool)

(assert (=> b!33474 (=> res!28678 e!22209)))

(assert (=> b!33474 (= res!28678 (not (invariant!0 (currentBit!2513 (_2!1790 lt!49184)) (currentByte!2518 (_2!1790 lt!49184)) (size!823 (buf!1151 (_2!1790 lt!49184))))))))

(declare-fun b!33475 () Bool)

(assert (=> b!33475 (= e!22204 (not e!22210))))

(declare-fun res!28675 () Bool)

(assert (=> b!33475 (=> res!28675 e!22210)))

(assert (=> b!33475 (= res!28675 (bvsge i!635 to!314))))

(assert (=> b!33475 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49183 () Unit!2501)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1438) Unit!2501)

(assert (=> b!33475 (= lt!49183 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33475 (= lt!49188 (bitIndex!0 (size!823 (buf!1151 thiss!1379)) (currentByte!2518 thiss!1379) (currentBit!2513 thiss!1379)))))

(declare-fun b!33476 () Bool)

(assert (=> b!33476 (= e!22202 (array_inv!772 (buf!1151 thiss!1379)))))

(declare-fun b!33477 () Bool)

(declare-fun e!22213 () Bool)

(assert (=> b!33477 (= e!22213 true)))

(declare-datatypes ((List!420 0))(
  ( (Nil!417) (Cons!416 (h!535 Bool) (t!1170 List!420)) )
))
(declare-fun lt!49182 () List!420)

(declare-fun lt!49187 () List!420)

(declare-fun tail!137 (List!420) List!420)

(assert (=> b!33477 (= lt!49182 (tail!137 lt!49187))))

(declare-datatypes ((tuple2!3408 0))(
  ( (tuple2!3409 (_1!1791 BitStream!1438) (_2!1791 BitStream!1438)) )
))
(declare-fun lt!49179 () tuple2!3408)

(declare-fun lt!49186 () tuple2!3408)

(declare-fun lt!49181 () Unit!2501)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1438 BitStream!1438 BitStream!1438 BitStream!1438 (_ BitVec 64) List!420) Unit!2501)

(assert (=> b!33477 (= lt!49181 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1790 lt!49184) (_2!1790 lt!49184) (_1!1791 lt!49186) (_1!1791 lt!49179) (bvsub to!314 i!635) lt!49187))))

(declare-fun b!33478 () Bool)

(assert (=> b!33478 (= e!22208 e!22206)))

(declare-fun res!28669 () Bool)

(assert (=> b!33478 (=> res!28669 e!22206)))

(assert (=> b!33478 (= res!28669 (not (isPrefixOf!0 (_2!1790 lt!49195) (_2!1790 lt!49184))))))

(assert (=> b!33478 (isPrefixOf!0 thiss!1379 (_2!1790 lt!49184))))

(declare-fun lt!49192 () Unit!2501)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1438 BitStream!1438 BitStream!1438) Unit!2501)

(assert (=> b!33478 (= lt!49192 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1790 lt!49195) (_2!1790 lt!49184)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1438 array!1862 (_ BitVec 64) (_ BitVec 64)) tuple2!3406)

(assert (=> b!33478 (= lt!49184 (appendBitsMSBFirstLoop!0 (_2!1790 lt!49195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22205 () Bool)

(assert (=> b!33478 e!22205))

(declare-fun res!28672 () Bool)

(assert (=> b!33478 (=> (not res!28672) (not e!22205))))

(assert (=> b!33478 (= res!28672 (validate_offset_bits!1 ((_ sign_extend 32) (size!823 (buf!1151 (_2!1790 lt!49195)))) ((_ sign_extend 32) (currentByte!2518 thiss!1379)) ((_ sign_extend 32) (currentBit!2513 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49189 () Unit!2501)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1438 array!1862 (_ BitVec 64)) Unit!2501)

(assert (=> b!33478 (= lt!49189 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1151 (_2!1790 lt!49195)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49180 () tuple2!3408)

(declare-fun reader!0 (BitStream!1438 BitStream!1438) tuple2!3408)

(assert (=> b!33478 (= lt!49180 (reader!0 thiss!1379 (_2!1790 lt!49195)))))

(declare-fun b!33479 () Bool)

(assert (=> b!33479 (= e!22212 e!22213)))

(declare-fun res!28673 () Bool)

(assert (=> b!33479 (=> res!28673 e!22213)))

(assert (=> b!33479 (= res!28673 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1438 BitStream!1438 (_ BitVec 64)) List!420)

(assert (=> b!33479 (= lt!49182 (bitStreamReadBitsIntoList!0 (_2!1790 lt!49184) (_1!1791 lt!49179) lt!49185))))

(assert (=> b!33479 (= lt!49187 (bitStreamReadBitsIntoList!0 (_2!1790 lt!49184) (_1!1791 lt!49186) (bvsub to!314 i!635)))))

(assert (=> b!33479 (validate_offset_bits!1 ((_ sign_extend 32) (size!823 (buf!1151 (_2!1790 lt!49184)))) ((_ sign_extend 32) (currentByte!2518 (_2!1790 lt!49195))) ((_ sign_extend 32) (currentBit!2513 (_2!1790 lt!49195))) lt!49185)))

(declare-fun lt!49194 () Unit!2501)

(assert (=> b!33479 (= lt!49194 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1790 lt!49195) (buf!1151 (_2!1790 lt!49184)) lt!49185))))

(assert (=> b!33479 (= lt!49179 (reader!0 (_2!1790 lt!49195) (_2!1790 lt!49184)))))

(assert (=> b!33479 (validate_offset_bits!1 ((_ sign_extend 32) (size!823 (buf!1151 (_2!1790 lt!49184)))) ((_ sign_extend 32) (currentByte!2518 thiss!1379)) ((_ sign_extend 32) (currentBit!2513 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49193 () Unit!2501)

(assert (=> b!33479 (= lt!49193 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1151 (_2!1790 lt!49184)) (bvsub to!314 i!635)))))

(assert (=> b!33479 (= lt!49186 (reader!0 thiss!1379 (_2!1790 lt!49184)))))

(declare-fun b!33480 () Bool)

(declare-fun head!257 (List!420) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1438 array!1862 (_ BitVec 64) (_ BitVec 64)) List!420)

(assert (=> b!33480 (= e!22205 (= (head!257 (byteArrayBitContentToList!0 (_2!1790 lt!49195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!257 (bitStreamReadBitsIntoList!0 (_2!1790 lt!49195) (_1!1791 lt!49180) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33481 () Bool)

(declare-fun res!28683 () Bool)

(assert (=> b!33481 (=> res!28683 e!22213)))

(declare-fun length!146 (List!420) Int)

(assert (=> b!33481 (= res!28683 (<= (length!146 lt!49187) 0))))

(assert (= (and start!6926 res!28670) b!33466))

(assert (= (and b!33466 res!28681) b!33475))

(assert (= (and b!33475 (not res!28675)) b!33467))

(assert (= (and b!33467 (not res!28676)) b!33478))

(assert (= (and b!33478 res!28672) b!33480))

(assert (= (and b!33478 (not res!28669)) b!33473))

(assert (= (and b!33473 (not res!28674)) b!33474))

(assert (= (and b!33474 (not res!28678)) b!33470))

(assert (= (and b!33470 (not res!28680)) b!33469))

(assert (= (and b!33469 res!28682) b!33471))

(assert (= (and b!33469 (not res!28671)) b!33468))

(assert (= (and b!33468 (not res!28677)) b!33472))

(assert (= (and b!33472 (not res!28679)) b!33479))

(assert (= (and b!33479 (not res!28673)) b!33481))

(assert (= (and b!33481 (not res!28683)) b!33477))

(assert (= start!6926 b!33476))

(declare-fun m!49641 () Bool)

(assert (=> b!33473 m!49641))

(declare-fun m!49643 () Bool)

(assert (=> b!33471 m!49643))

(declare-fun m!49645 () Bool)

(assert (=> b!33479 m!49645))

(declare-fun m!49647 () Bool)

(assert (=> b!33479 m!49647))

(declare-fun m!49649 () Bool)

(assert (=> b!33479 m!49649))

(declare-fun m!49651 () Bool)

(assert (=> b!33479 m!49651))

(declare-fun m!49653 () Bool)

(assert (=> b!33479 m!49653))

(declare-fun m!49655 () Bool)

(assert (=> b!33479 m!49655))

(declare-fun m!49657 () Bool)

(assert (=> b!33479 m!49657))

(declare-fun m!49659 () Bool)

(assert (=> b!33479 m!49659))

(declare-fun m!49661 () Bool)

(assert (=> b!33481 m!49661))

(declare-fun m!49663 () Bool)

(assert (=> b!33480 m!49663))

(assert (=> b!33480 m!49663))

(declare-fun m!49665 () Bool)

(assert (=> b!33480 m!49665))

(declare-fun m!49667 () Bool)

(assert (=> b!33480 m!49667))

(assert (=> b!33480 m!49667))

(declare-fun m!49669 () Bool)

(assert (=> b!33480 m!49669))

(declare-fun m!49671 () Bool)

(assert (=> b!33476 m!49671))

(declare-fun m!49673 () Bool)

(assert (=> b!33467 m!49673))

(declare-fun m!49675 () Bool)

(assert (=> b!33467 m!49675))

(declare-fun m!49677 () Bool)

(assert (=> b!33467 m!49677))

(declare-fun m!49679 () Bool)

(assert (=> b!33467 m!49679))

(assert (=> b!33467 m!49675))

(declare-fun m!49681 () Bool)

(assert (=> b!33467 m!49681))

(declare-fun m!49683 () Bool)

(assert (=> b!33475 m!49683))

(declare-fun m!49685 () Bool)

(assert (=> b!33475 m!49685))

(declare-fun m!49687 () Bool)

(assert (=> b!33475 m!49687))

(declare-fun m!49689 () Bool)

(assert (=> b!33478 m!49689))

(declare-fun m!49691 () Bool)

(assert (=> b!33478 m!49691))

(declare-fun m!49693 () Bool)

(assert (=> b!33478 m!49693))

(declare-fun m!49695 () Bool)

(assert (=> b!33478 m!49695))

(declare-fun m!49697 () Bool)

(assert (=> b!33478 m!49697))

(declare-fun m!49699 () Bool)

(assert (=> b!33478 m!49699))

(declare-fun m!49701 () Bool)

(assert (=> b!33478 m!49701))

(declare-fun m!49703 () Bool)

(assert (=> b!33468 m!49703))

(declare-fun m!49705 () Bool)

(assert (=> b!33472 m!49705))

(declare-fun m!49707 () Bool)

(assert (=> b!33477 m!49707))

(declare-fun m!49709 () Bool)

(assert (=> b!33477 m!49709))

(declare-fun m!49711 () Bool)

(assert (=> b!33474 m!49711))

(declare-fun m!49713 () Bool)

(assert (=> start!6926 m!49713))

(declare-fun m!49715 () Bool)

(assert (=> start!6926 m!49715))

(declare-fun m!49717 () Bool)

(assert (=> b!33466 m!49717))

(push 1)

(assert (not b!33466))

(assert (not b!33471))

(assert (not b!33474))

(assert (not b!33478))

(assert (not b!33480))

(assert (not b!33479))

(assert (not start!6926))

(assert (not b!33481))

(assert (not b!33476))

(assert (not b!33477))

(assert (not b!33468))

(assert (not b!33472))

(assert (not b!33475))

(assert (not b!33467))

(assert (not b!33473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

