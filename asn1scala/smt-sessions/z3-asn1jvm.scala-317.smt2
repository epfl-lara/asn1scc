; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6898 () Bool)

(assert start!6898)

(declare-fun b!32794 () Bool)

(declare-fun res!28052 () Bool)

(declare-fun e!21702 () Bool)

(assert (=> b!32794 (=> res!28052 e!21702)))

(declare-datatypes ((array!1834 0))(
  ( (array!1835 (arr!1284 (Array (_ BitVec 32) (_ BitVec 8))) (size!809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1410 0))(
  ( (BitStream!1411 (buf!1137 array!1834) (currentByte!2504 (_ BitVec 32)) (currentBit!2499 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2473 0))(
  ( (Unit!2474) )
))
(declare-datatypes ((tuple2!3350 0))(
  ( (tuple2!3351 (_1!1762 Unit!2473) (_2!1762 BitStream!1410)) )
))
(declare-fun lt!48466 () tuple2!3350)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32794 (= res!28052 (not (invariant!0 (currentBit!2499 (_2!1762 lt!48466)) (currentByte!2504 (_2!1762 lt!48466)) (size!809 (buf!1137 (_2!1762 lt!48466))))))))

(declare-fun b!32795 () Bool)

(declare-fun e!21704 () Bool)

(assert (=> b!32795 (= e!21704 true)))

(declare-datatypes ((List!406 0))(
  ( (Nil!403) (Cons!402 (h!521 Bool) (t!1156 List!406)) )
))
(declare-fun lt!48467 () List!406)

(declare-fun lt!48476 () List!406)

(declare-fun tail!123 (List!406) List!406)

(assert (=> b!32795 (= lt!48467 (tail!123 lt!48476))))

(declare-datatypes ((tuple2!3352 0))(
  ( (tuple2!3353 (_1!1763 BitStream!1410) (_2!1763 BitStream!1410)) )
))
(declare-fun lt!48465 () tuple2!3352)

(declare-fun lt!48475 () Unit!2473)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!48472 () tuple2!3352)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1410 BitStream!1410 BitStream!1410 BitStream!1410 (_ BitVec 64) List!406) Unit!2473)

(assert (=> b!32795 (= lt!48475 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1762 lt!48466) (_2!1762 lt!48466) (_1!1763 lt!48465) (_1!1763 lt!48472) (bvsub to!314 i!635) lt!48476))))

(declare-fun b!32796 () Bool)

(declare-fun res!28046 () Bool)

(assert (=> b!32796 (=> res!28046 e!21702)))

(declare-fun thiss!1379 () BitStream!1410)

(assert (=> b!32796 (= res!28046 (not (= (size!809 (buf!1137 thiss!1379)) (size!809 (buf!1137 (_2!1762 lt!48466))))))))

(declare-fun lt!48474 () tuple2!3350)

(declare-fun lt!48468 () (_ BitVec 64))

(declare-fun b!32797 () Bool)

(declare-fun e!21700 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32797 (= e!21700 (= lt!48468 (bvsub (bvsub (bvadd (bitIndex!0 (size!809 (buf!1137 (_2!1762 lt!48474))) (currentByte!2504 (_2!1762 lt!48474)) (currentBit!2499 (_2!1762 lt!48474))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32798 () Bool)

(declare-fun res!28039 () Bool)

(declare-fun e!21705 () Bool)

(assert (=> b!32798 (=> res!28039 e!21705)))

(assert (=> b!32798 (= res!28039 (not (invariant!0 (currentBit!2499 (_2!1762 lt!48474)) (currentByte!2504 (_2!1762 lt!48474)) (size!809 (buf!1137 (_2!1762 lt!48474))))))))

(declare-fun b!32799 () Bool)

(declare-fun e!21709 () Bool)

(declare-fun array_inv!758 (array!1834) Bool)

(assert (=> b!32799 (= e!21709 (array_inv!758 (buf!1137 thiss!1379)))))

(declare-fun b!32801 () Bool)

(declare-fun e!21707 () Bool)

(assert (=> b!32801 (= e!21707 e!21702)))

(declare-fun res!28051 () Bool)

(assert (=> b!32801 (=> res!28051 e!21702)))

(declare-fun lt!48481 () (_ BitVec 64))

(assert (=> b!32801 (= res!28051 (not (= lt!48468 (bvsub (bvadd lt!48481 to!314) i!635))))))

(assert (=> b!32801 (= lt!48468 (bitIndex!0 (size!809 (buf!1137 (_2!1762 lt!48466))) (currentByte!2504 (_2!1762 lt!48466)) (currentBit!2499 (_2!1762 lt!48466))))))

(declare-fun b!32802 () Bool)

(assert (=> b!32802 (= e!21705 e!21704)))

(declare-fun res!28041 () Bool)

(assert (=> b!32802 (=> res!28041 e!21704)))

(assert (=> b!32802 (= res!28041 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48477 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1410 BitStream!1410 (_ BitVec 64)) List!406)

(assert (=> b!32802 (= lt!48467 (bitStreamReadBitsIntoList!0 (_2!1762 lt!48466) (_1!1763 lt!48472) lt!48477))))

(assert (=> b!32802 (= lt!48476 (bitStreamReadBitsIntoList!0 (_2!1762 lt!48466) (_1!1763 lt!48465) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32802 (validate_offset_bits!1 ((_ sign_extend 32) (size!809 (buf!1137 (_2!1762 lt!48466)))) ((_ sign_extend 32) (currentByte!2504 (_2!1762 lt!48474))) ((_ sign_extend 32) (currentBit!2499 (_2!1762 lt!48474))) lt!48477)))

(declare-fun lt!48478 () Unit!2473)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1410 array!1834 (_ BitVec 64)) Unit!2473)

(assert (=> b!32802 (= lt!48478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1762 lt!48474) (buf!1137 (_2!1762 lt!48466)) lt!48477))))

(declare-fun reader!0 (BitStream!1410 BitStream!1410) tuple2!3352)

(assert (=> b!32802 (= lt!48472 (reader!0 (_2!1762 lt!48474) (_2!1762 lt!48466)))))

(assert (=> b!32802 (validate_offset_bits!1 ((_ sign_extend 32) (size!809 (buf!1137 (_2!1762 lt!48466)))) ((_ sign_extend 32) (currentByte!2504 thiss!1379)) ((_ sign_extend 32) (currentBit!2499 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48473 () Unit!2473)

(assert (=> b!32802 (= lt!48473 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1137 (_2!1762 lt!48466)) (bvsub to!314 i!635)))))

(assert (=> b!32802 (= lt!48465 (reader!0 thiss!1379 (_2!1762 lt!48466)))))

(declare-fun b!32803 () Bool)

(declare-fun e!21699 () Bool)

(declare-fun e!21708 () Bool)

(assert (=> b!32803 (= e!21699 e!21708)))

(declare-fun res!28050 () Bool)

(assert (=> b!32803 (=> res!28050 e!21708)))

(declare-fun isPrefixOf!0 (BitStream!1410 BitStream!1410) Bool)

(assert (=> b!32803 (= res!28050 (not (isPrefixOf!0 thiss!1379 (_2!1762 lt!48474))))))

(assert (=> b!32803 (validate_offset_bits!1 ((_ sign_extend 32) (size!809 (buf!1137 (_2!1762 lt!48474)))) ((_ sign_extend 32) (currentByte!2504 (_2!1762 lt!48474))) ((_ sign_extend 32) (currentBit!2499 (_2!1762 lt!48474))) lt!48477)))

(assert (=> b!32803 (= lt!48477 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48470 () Unit!2473)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1410 BitStream!1410 (_ BitVec 64) (_ BitVec 64)) Unit!2473)

(assert (=> b!32803 (= lt!48470 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1762 lt!48474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1834)

(declare-fun appendBitFromByte!0 (BitStream!1410 (_ BitVec 8) (_ BitVec 32)) tuple2!3350)

(assert (=> b!32803 (= lt!48474 (appendBitFromByte!0 thiss!1379 (select (arr!1284 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32804 () Bool)

(assert (=> b!32804 (= e!21702 e!21705)))

(declare-fun res!28053 () Bool)

(assert (=> b!32804 (=> res!28053 e!21705)))

(assert (=> b!32804 (= res!28053 (not (= (size!809 (buf!1137 (_2!1762 lt!48474))) (size!809 (buf!1137 (_2!1762 lt!48466))))))))

(assert (=> b!32804 e!21700))

(declare-fun res!28044 () Bool)

(assert (=> b!32804 (=> (not res!28044) (not e!21700))))

(assert (=> b!32804 (= res!28044 (= (size!809 (buf!1137 (_2!1762 lt!48466))) (size!809 (buf!1137 thiss!1379))))))

(declare-fun b!32805 () Bool)

(declare-fun res!28047 () Bool)

(assert (=> b!32805 (=> res!28047 e!21704)))

(declare-fun length!132 (List!406) Int)

(assert (=> b!32805 (= res!28047 (<= (length!132 lt!48476) 0))))

(declare-fun b!32806 () Bool)

(declare-fun e!21703 () Bool)

(declare-fun lt!48480 () tuple2!3352)

(declare-fun head!243 (List!406) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1410 array!1834 (_ BitVec 64) (_ BitVec 64)) List!406)

(assert (=> b!32806 (= e!21703 (= (head!243 (byteArrayBitContentToList!0 (_2!1762 lt!48474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!243 (bitStreamReadBitsIntoList!0 (_2!1762 lt!48474) (_1!1763 lt!48480) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32807 () Bool)

(declare-fun e!21698 () Bool)

(assert (=> b!32807 (= e!21698 (not e!21699))))

(declare-fun res!28048 () Bool)

(assert (=> b!32807 (=> res!28048 e!21699)))

(assert (=> b!32807 (= res!28048 (bvsge i!635 to!314))))

(assert (=> b!32807 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48469 () Unit!2473)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1410) Unit!2473)

(assert (=> b!32807 (= lt!48469 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!32807 (= lt!48481 (bitIndex!0 (size!809 (buf!1137 thiss!1379)) (currentByte!2504 thiss!1379) (currentBit!2499 thiss!1379)))))

(declare-fun b!32800 () Bool)

(assert (=> b!32800 (= e!21708 e!21707)))

(declare-fun res!28042 () Bool)

(assert (=> b!32800 (=> res!28042 e!21707)))

(assert (=> b!32800 (= res!28042 (not (isPrefixOf!0 (_2!1762 lt!48474) (_2!1762 lt!48466))))))

(assert (=> b!32800 (isPrefixOf!0 thiss!1379 (_2!1762 lt!48466))))

(declare-fun lt!48479 () Unit!2473)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1410 BitStream!1410 BitStream!1410) Unit!2473)

(assert (=> b!32800 (= lt!48479 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1762 lt!48474) (_2!1762 lt!48466)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1410 array!1834 (_ BitVec 64) (_ BitVec 64)) tuple2!3350)

(assert (=> b!32800 (= lt!48466 (appendBitsMSBFirstLoop!0 (_2!1762 lt!48474) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32800 e!21703))

(declare-fun res!28040 () Bool)

(assert (=> b!32800 (=> (not res!28040) (not e!21703))))

(assert (=> b!32800 (= res!28040 (validate_offset_bits!1 ((_ sign_extend 32) (size!809 (buf!1137 (_2!1762 lt!48474)))) ((_ sign_extend 32) (currentByte!2504 thiss!1379)) ((_ sign_extend 32) (currentBit!2499 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48471 () Unit!2473)

(assert (=> b!32800 (= lt!48471 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1137 (_2!1762 lt!48474)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32800 (= lt!48480 (reader!0 thiss!1379 (_2!1762 lt!48474)))))

(declare-fun res!28049 () Bool)

(assert (=> start!6898 (=> (not res!28049) (not e!21698))))

(assert (=> start!6898 (= res!28049 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!809 srcBuffer!2))))))))

(assert (=> start!6898 e!21698))

(assert (=> start!6898 true))

(assert (=> start!6898 (array_inv!758 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1410) Bool)

(assert (=> start!6898 (and (inv!12 thiss!1379) e!21709)))

(declare-fun b!32808 () Bool)

(declare-fun res!28043 () Bool)

(assert (=> b!32808 (=> res!28043 e!21705)))

(assert (=> b!32808 (= res!28043 (not (invariant!0 (currentBit!2499 (_2!1762 lt!48474)) (currentByte!2504 (_2!1762 lt!48474)) (size!809 (buf!1137 (_2!1762 lt!48466))))))))

(declare-fun b!32809 () Bool)

(declare-fun res!28045 () Bool)

(assert (=> b!32809 (=> (not res!28045) (not e!21698))))

(assert (=> b!32809 (= res!28045 (validate_offset_bits!1 ((_ sign_extend 32) (size!809 (buf!1137 thiss!1379))) ((_ sign_extend 32) (currentByte!2504 thiss!1379)) ((_ sign_extend 32) (currentBit!2499 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!6898 res!28049) b!32809))

(assert (= (and b!32809 res!28045) b!32807))

(assert (= (and b!32807 (not res!28048)) b!32803))

(assert (= (and b!32803 (not res!28050)) b!32800))

(assert (= (and b!32800 res!28040) b!32806))

(assert (= (and b!32800 (not res!28042)) b!32801))

(assert (= (and b!32801 (not res!28051)) b!32794))

(assert (= (and b!32794 (not res!28052)) b!32796))

(assert (= (and b!32796 (not res!28046)) b!32804))

(assert (= (and b!32804 res!28044) b!32797))

(assert (= (and b!32804 (not res!28053)) b!32798))

(assert (= (and b!32798 (not res!28039)) b!32808))

(assert (= (and b!32808 (not res!28043)) b!32802))

(assert (= (and b!32802 (not res!28041)) b!32805))

(assert (= (and b!32805 (not res!28047)) b!32795))

(assert (= start!6898 b!32799))

(declare-fun m!48549 () Bool)

(assert (=> b!32809 m!48549))

(declare-fun m!48551 () Bool)

(assert (=> b!32794 m!48551))

(declare-fun m!48553 () Bool)

(assert (=> b!32797 m!48553))

(declare-fun m!48555 () Bool)

(assert (=> b!32798 m!48555))

(declare-fun m!48557 () Bool)

(assert (=> start!6898 m!48557))

(declare-fun m!48559 () Bool)

(assert (=> start!6898 m!48559))

(declare-fun m!48561 () Bool)

(assert (=> b!32807 m!48561))

(declare-fun m!48563 () Bool)

(assert (=> b!32807 m!48563))

(declare-fun m!48565 () Bool)

(assert (=> b!32807 m!48565))

(declare-fun m!48567 () Bool)

(assert (=> b!32799 m!48567))

(declare-fun m!48569 () Bool)

(assert (=> b!32803 m!48569))

(declare-fun m!48571 () Bool)

(assert (=> b!32803 m!48571))

(declare-fun m!48573 () Bool)

(assert (=> b!32803 m!48573))

(declare-fun m!48575 () Bool)

(assert (=> b!32803 m!48575))

(assert (=> b!32803 m!48571))

(declare-fun m!48577 () Bool)

(assert (=> b!32803 m!48577))

(declare-fun m!48579 () Bool)

(assert (=> b!32800 m!48579))

(declare-fun m!48581 () Bool)

(assert (=> b!32800 m!48581))

(declare-fun m!48583 () Bool)

(assert (=> b!32800 m!48583))

(declare-fun m!48585 () Bool)

(assert (=> b!32800 m!48585))

(declare-fun m!48587 () Bool)

(assert (=> b!32800 m!48587))

(declare-fun m!48589 () Bool)

(assert (=> b!32800 m!48589))

(declare-fun m!48591 () Bool)

(assert (=> b!32800 m!48591))

(declare-fun m!48593 () Bool)

(assert (=> b!32795 m!48593))

(declare-fun m!48595 () Bool)

(assert (=> b!32795 m!48595))

(declare-fun m!48597 () Bool)

(assert (=> b!32805 m!48597))

(declare-fun m!48599 () Bool)

(assert (=> b!32802 m!48599))

(declare-fun m!48601 () Bool)

(assert (=> b!32802 m!48601))

(declare-fun m!48603 () Bool)

(assert (=> b!32802 m!48603))

(declare-fun m!48605 () Bool)

(assert (=> b!32802 m!48605))

(declare-fun m!48607 () Bool)

(assert (=> b!32802 m!48607))

(declare-fun m!48609 () Bool)

(assert (=> b!32802 m!48609))

(declare-fun m!48611 () Bool)

(assert (=> b!32802 m!48611))

(declare-fun m!48613 () Bool)

(assert (=> b!32802 m!48613))

(declare-fun m!48615 () Bool)

(assert (=> b!32801 m!48615))

(declare-fun m!48617 () Bool)

(assert (=> b!32806 m!48617))

(assert (=> b!32806 m!48617))

(declare-fun m!48619 () Bool)

(assert (=> b!32806 m!48619))

(declare-fun m!48621 () Bool)

(assert (=> b!32806 m!48621))

(assert (=> b!32806 m!48621))

(declare-fun m!48623 () Bool)

(assert (=> b!32806 m!48623))

(declare-fun m!48625 () Bool)

(assert (=> b!32808 m!48625))

(check-sat (not b!32795) (not b!32801) (not b!32799) (not b!32805) (not b!32808) (not b!32798) (not b!32807) (not start!6898) (not b!32794) (not b!32809) (not b!32806) (not b!32802) (not b!32797) (not b!32800) (not b!32803))
