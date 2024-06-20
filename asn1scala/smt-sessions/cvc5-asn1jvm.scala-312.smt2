; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6626 () Bool)

(assert start!6626)

(declare-fun b!31072 () Bool)

(declare-fun res!26642 () Bool)

(declare-fun e!20635 () Bool)

(assert (=> b!31072 (=> res!26642 e!20635)))

(declare-datatypes ((array!1796 0))(
  ( (array!1797 (arr!1256 (Array (_ BitVec 32) (_ BitVec 8))) (size!787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1378 0))(
  ( (BitStream!1379 (buf!1115 array!1796) (currentByte!2470 (_ BitVec 32)) (currentBit!2465 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2381 0))(
  ( (Unit!2382) )
))
(declare-datatypes ((tuple2!3238 0))(
  ( (tuple2!3239 (_1!1706 Unit!2381) (_2!1706 BitStream!1378)) )
))
(declare-fun lt!45582 () tuple2!3238)

(declare-fun lt!45567 () tuple2!3238)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31072 (= res!26642 (not (invariant!0 (currentBit!2465 (_2!1706 lt!45582)) (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45567))))))))

(declare-fun b!31074 () Bool)

(declare-fun res!26650 () Bool)

(assert (=> b!31074 (=> res!26650 e!20635)))

(assert (=> b!31074 (= res!26650 (not (invariant!0 (currentBit!2465 (_2!1706 lt!45582)) (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45582))))))))

(declare-fun b!31075 () Bool)

(declare-fun res!26647 () Bool)

(declare-fun e!20637 () Bool)

(assert (=> b!31075 (=> res!26647 e!20637)))

(declare-fun thiss!1379 () BitStream!1378)

(assert (=> b!31075 (= res!26647 (not (= (size!787 (buf!1115 thiss!1379)) (size!787 (buf!1115 (_2!1706 lt!45567))))))))

(declare-fun srcBuffer!2 () array!1796)

(declare-fun b!31076 () Bool)

(declare-datatypes ((tuple2!3240 0))(
  ( (tuple2!3241 (_1!1707 BitStream!1378) (_2!1707 BitStream!1378)) )
))
(declare-fun lt!45568 () tuple2!3240)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!20640 () Bool)

(declare-datatypes ((List!390 0))(
  ( (Nil!387) (Cons!386 (h!505 Bool) (t!1140 List!390)) )
))
(declare-fun head!227 (List!390) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1378 array!1796 (_ BitVec 64) (_ BitVec 64)) List!390)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1378 BitStream!1378 (_ BitVec 64)) List!390)

(assert (=> b!31076 (= e!20640 (= (head!227 (byteArrayBitContentToList!0 (_2!1706 lt!45582) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!227 (bitStreamReadBitsIntoList!0 (_2!1706 lt!45582) (_1!1707 lt!45568) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31077 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!20628 () Bool)

(assert (=> b!31077 (= e!20628 (not (= (byteArrayBitContentToList!0 (_2!1706 lt!45567) srcBuffer!2 i!635 (bvsub to!314 i!635)) Nil!387)))))

(declare-fun b!31078 () Bool)

(declare-fun e!20638 () Bool)

(declare-fun e!20631 () Bool)

(assert (=> b!31078 (= e!20638 e!20631)))

(declare-fun res!26645 () Bool)

(assert (=> b!31078 (=> res!26645 e!20631)))

(declare-fun isPrefixOf!0 (BitStream!1378 BitStream!1378) Bool)

(assert (=> b!31078 (= res!26645 (not (isPrefixOf!0 thiss!1379 (_2!1706 lt!45582))))))

(declare-fun lt!45570 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31078 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!45570)))

(assert (=> b!31078 (= lt!45570 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45575 () Unit!2381)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1378 BitStream!1378 (_ BitVec 64) (_ BitVec 64)) Unit!2381)

(assert (=> b!31078 (= lt!45575 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1706 lt!45582) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1378 (_ BitVec 8) (_ BitVec 32)) tuple2!3238)

(assert (=> b!31078 (= lt!45582 (appendBitFromByte!0 thiss!1379 (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!31079 () Bool)

(declare-fun e!20634 () Bool)

(assert (=> b!31079 (= e!20634 (not e!20638))))

(declare-fun res!26644 () Bool)

(assert (=> b!31079 (=> res!26644 e!20638)))

(assert (=> b!31079 (= res!26644 (bvsge i!635 to!314))))

(assert (=> b!31079 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45571 () Unit!2381)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1378) Unit!2381)

(assert (=> b!31079 (= lt!45571 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!45583 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31079 (= lt!45583 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(declare-fun b!31080 () Bool)

(declare-fun e!20630 () Bool)

(declare-fun array_inv!742 (array!1796) Bool)

(assert (=> b!31080 (= e!20630 (array_inv!742 (buf!1115 thiss!1379)))))

(declare-fun b!31081 () Bool)

(declare-fun e!20632 () Bool)

(declare-fun lt!45579 () (_ BitVec 64))

(assert (=> b!31081 (= e!20632 (= lt!45579 (bvsub (bvsub (bvadd (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31082 () Bool)

(declare-fun e!20639 () Bool)

(assert (=> b!31082 (= e!20639 e!20628)))

(declare-fun res!26638 () Bool)

(assert (=> b!31082 (=> res!26638 e!20628)))

(declare-fun lt!45580 () tuple2!3240)

(declare-fun lt!45578 () Bool)

(declare-fun bitAt!0 (array!1796 (_ BitVec 64)) Bool)

(assert (=> b!31082 (= res!26638 (not (= lt!45578 (bitAt!0 (buf!1115 (_1!1707 lt!45580)) lt!45583))))))

(declare-fun lt!45565 () tuple2!3240)

(assert (=> b!31082 (= lt!45578 (bitAt!0 (buf!1115 (_1!1707 lt!45565)) lt!45583))))

(declare-fun b!31083 () Bool)

(declare-fun res!26651 () Bool)

(assert (=> b!31083 (=> (not res!26651) (not e!20634))))

(assert (=> b!31083 (= res!26651 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31084 () Bool)

(declare-fun res!26648 () Bool)

(assert (=> b!31084 (=> res!26648 e!20628)))

(declare-fun lt!45576 () List!390)

(assert (=> b!31084 (= res!26648 (not (= (head!227 lt!45576) lt!45578)))))

(declare-fun b!31085 () Bool)

(declare-fun e!20629 () Bool)

(assert (=> b!31085 (= e!20629 e!20639)))

(declare-fun res!26646 () Bool)

(assert (=> b!31085 (=> res!26646 e!20639)))

(declare-fun lt!45574 () List!390)

(declare-fun lt!45577 () List!390)

(assert (=> b!31085 (= res!26646 (not (= lt!45574 lt!45577)))))

(assert (=> b!31085 (= lt!45577 lt!45574)))

(declare-fun tail!107 (List!390) List!390)

(assert (=> b!31085 (= lt!45574 (tail!107 lt!45576))))

(declare-fun lt!45581 () Unit!2381)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1378 BitStream!1378 BitStream!1378 BitStream!1378 (_ BitVec 64) List!390) Unit!2381)

(assert (=> b!31085 (= lt!45581 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1706 lt!45567) (_2!1706 lt!45567) (_1!1707 lt!45565) (_1!1707 lt!45580) (bvsub to!314 i!635) lt!45576))))

(declare-fun b!31073 () Bool)

(declare-fun e!20636 () Bool)

(assert (=> b!31073 (= e!20636 e!20637)))

(declare-fun res!26637 () Bool)

(assert (=> b!31073 (=> res!26637 e!20637)))

(assert (=> b!31073 (= res!26637 (not (= lt!45579 (bvsub (bvadd lt!45583 to!314) i!635))))))

(assert (=> b!31073 (= lt!45579 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567))))))

(declare-fun res!26641 () Bool)

(assert (=> start!6626 (=> (not res!26641) (not e!20634))))

(assert (=> start!6626 (= res!26641 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!787 srcBuffer!2))))))))

(assert (=> start!6626 e!20634))

(assert (=> start!6626 true))

(assert (=> start!6626 (array_inv!742 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1378) Bool)

(assert (=> start!6626 (and (inv!12 thiss!1379) e!20630)))

(declare-fun b!31086 () Bool)

(declare-fun res!26639 () Bool)

(assert (=> b!31086 (=> res!26639 e!20637)))

(assert (=> b!31086 (= res!26639 (not (invariant!0 (currentBit!2465 (_2!1706 lt!45567)) (currentByte!2470 (_2!1706 lt!45567)) (size!787 (buf!1115 (_2!1706 lt!45567))))))))

(declare-fun b!31087 () Bool)

(assert (=> b!31087 (= e!20637 e!20635)))

(declare-fun res!26636 () Bool)

(assert (=> b!31087 (=> res!26636 e!20635)))

(assert (=> b!31087 (= res!26636 (not (= (size!787 (buf!1115 (_2!1706 lt!45582))) (size!787 (buf!1115 (_2!1706 lt!45567))))))))

(assert (=> b!31087 e!20632))

(declare-fun res!26643 () Bool)

(assert (=> b!31087 (=> (not res!26643) (not e!20632))))

(assert (=> b!31087 (= res!26643 (= (size!787 (buf!1115 (_2!1706 lt!45567))) (size!787 (buf!1115 thiss!1379))))))

(declare-fun b!31088 () Bool)

(assert (=> b!31088 (= e!20635 e!20629)))

(declare-fun res!26640 () Bool)

(assert (=> b!31088 (=> res!26640 e!20629)))

(assert (=> b!31088 (= res!26640 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!31088 (= lt!45577 (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_1!1707 lt!45580) lt!45570))))

(assert (=> b!31088 (= lt!45576 (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_1!1707 lt!45565) (bvsub to!314 i!635)))))

(assert (=> b!31088 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!45570)))

(declare-fun lt!45573 () Unit!2381)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1378 array!1796 (_ BitVec 64)) Unit!2381)

(assert (=> b!31088 (= lt!45573 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!45567)) lt!45570))))

(declare-fun reader!0 (BitStream!1378 BitStream!1378) tuple2!3240)

(assert (=> b!31088 (= lt!45580 (reader!0 (_2!1706 lt!45582) (_2!1706 lt!45567)))))

(assert (=> b!31088 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!45572 () Unit!2381)

(assert (=> b!31088 (= lt!45572 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1115 (_2!1706 lt!45567)) (bvsub to!314 i!635)))))

(assert (=> b!31088 (= lt!45565 (reader!0 thiss!1379 (_2!1706 lt!45567)))))

(declare-fun b!31089 () Bool)

(assert (=> b!31089 (= e!20631 e!20636)))

(declare-fun res!26652 () Bool)

(assert (=> b!31089 (=> res!26652 e!20636)))

(assert (=> b!31089 (= res!26652 (not (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45567))))))

(assert (=> b!31089 (isPrefixOf!0 thiss!1379 (_2!1706 lt!45567))))

(declare-fun lt!45566 () Unit!2381)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1378 BitStream!1378 BitStream!1378) Unit!2381)

(assert (=> b!31089 (= lt!45566 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1706 lt!45582) (_2!1706 lt!45567)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1378 array!1796 (_ BitVec 64) (_ BitVec 64)) tuple2!3238)

(assert (=> b!31089 (= lt!45567 (appendBitsMSBFirstLoop!0 (_2!1706 lt!45582) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31089 e!20640))

(declare-fun res!26635 () Bool)

(assert (=> b!31089 (=> (not res!26635) (not e!20640))))

(assert (=> b!31089 (= res!26635 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45569 () Unit!2381)

(assert (=> b!31089 (= lt!45569 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1115 (_2!1706 lt!45582)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!31089 (= lt!45568 (reader!0 thiss!1379 (_2!1706 lt!45582)))))

(declare-fun b!31090 () Bool)

(declare-fun res!26649 () Bool)

(assert (=> b!31090 (=> res!26649 e!20629)))

(declare-fun length!116 (List!390) Int)

(assert (=> b!31090 (= res!26649 (<= (length!116 lt!45576) 0))))

(assert (= (and start!6626 res!26641) b!31083))

(assert (= (and b!31083 res!26651) b!31079))

(assert (= (and b!31079 (not res!26644)) b!31078))

(assert (= (and b!31078 (not res!26645)) b!31089))

(assert (= (and b!31089 res!26635) b!31076))

(assert (= (and b!31089 (not res!26652)) b!31073))

(assert (= (and b!31073 (not res!26637)) b!31086))

(assert (= (and b!31086 (not res!26639)) b!31075))

(assert (= (and b!31075 (not res!26647)) b!31087))

(assert (= (and b!31087 res!26643) b!31081))

(assert (= (and b!31087 (not res!26636)) b!31074))

(assert (= (and b!31074 (not res!26650)) b!31072))

(assert (= (and b!31072 (not res!26642)) b!31088))

(assert (= (and b!31088 (not res!26640)) b!31090))

(assert (= (and b!31090 (not res!26649)) b!31085))

(assert (= (and b!31085 (not res!26646)) b!31082))

(assert (= (and b!31082 (not res!26638)) b!31084))

(assert (= (and b!31084 (not res!26648)) b!31077))

(assert (= start!6626 b!31080))

(declare-fun m!45603 () Bool)

(assert (=> b!31077 m!45603))

(declare-fun m!45605 () Bool)

(assert (=> b!31076 m!45605))

(assert (=> b!31076 m!45605))

(declare-fun m!45607 () Bool)

(assert (=> b!31076 m!45607))

(declare-fun m!45609 () Bool)

(assert (=> b!31076 m!45609))

(assert (=> b!31076 m!45609))

(declare-fun m!45611 () Bool)

(assert (=> b!31076 m!45611))

(declare-fun m!45613 () Bool)

(assert (=> b!31088 m!45613))

(declare-fun m!45615 () Bool)

(assert (=> b!31088 m!45615))

(declare-fun m!45617 () Bool)

(assert (=> b!31088 m!45617))

(declare-fun m!45619 () Bool)

(assert (=> b!31088 m!45619))

(declare-fun m!45621 () Bool)

(assert (=> b!31088 m!45621))

(declare-fun m!45623 () Bool)

(assert (=> b!31088 m!45623))

(declare-fun m!45625 () Bool)

(assert (=> b!31088 m!45625))

(declare-fun m!45627 () Bool)

(assert (=> b!31088 m!45627))

(declare-fun m!45629 () Bool)

(assert (=> b!31072 m!45629))

(declare-fun m!45631 () Bool)

(assert (=> b!31080 m!45631))

(declare-fun m!45633 () Bool)

(assert (=> b!31084 m!45633))

(declare-fun m!45635 () Bool)

(assert (=> b!31081 m!45635))

(declare-fun m!45637 () Bool)

(assert (=> start!6626 m!45637))

(declare-fun m!45639 () Bool)

(assert (=> start!6626 m!45639))

(declare-fun m!45641 () Bool)

(assert (=> b!31079 m!45641))

(declare-fun m!45643 () Bool)

(assert (=> b!31079 m!45643))

(declare-fun m!45645 () Bool)

(assert (=> b!31079 m!45645))

(declare-fun m!45647 () Bool)

(assert (=> b!31090 m!45647))

(declare-fun m!45649 () Bool)

(assert (=> b!31078 m!45649))

(declare-fun m!45651 () Bool)

(assert (=> b!31078 m!45651))

(declare-fun m!45653 () Bool)

(assert (=> b!31078 m!45653))

(declare-fun m!45655 () Bool)

(assert (=> b!31078 m!45655))

(declare-fun m!45657 () Bool)

(assert (=> b!31078 m!45657))

(assert (=> b!31078 m!45651))

(declare-fun m!45659 () Bool)

(assert (=> b!31074 m!45659))

(declare-fun m!45661 () Bool)

(assert (=> b!31085 m!45661))

(declare-fun m!45663 () Bool)

(assert (=> b!31085 m!45663))

(declare-fun m!45665 () Bool)

(assert (=> b!31073 m!45665))

(declare-fun m!45667 () Bool)

(assert (=> b!31089 m!45667))

(declare-fun m!45669 () Bool)

(assert (=> b!31089 m!45669))

(declare-fun m!45671 () Bool)

(assert (=> b!31089 m!45671))

(declare-fun m!45673 () Bool)

(assert (=> b!31089 m!45673))

(declare-fun m!45675 () Bool)

(assert (=> b!31089 m!45675))

(declare-fun m!45677 () Bool)

(assert (=> b!31089 m!45677))

(declare-fun m!45679 () Bool)

(assert (=> b!31089 m!45679))

(declare-fun m!45681 () Bool)

(assert (=> b!31082 m!45681))

(declare-fun m!45683 () Bool)

(assert (=> b!31082 m!45683))

(declare-fun m!45685 () Bool)

(assert (=> b!31086 m!45685))

(declare-fun m!45687 () Bool)

(assert (=> b!31083 m!45687))

(push 1)

(assert (not b!31080))

(assert (not b!31081))

(assert (not b!31077))

(assert (not b!31076))

(assert (not b!31086))

(assert (not b!31084))

(assert (not b!31085))

(assert (not b!31083))

(assert (not b!31074))

(assert (not b!31078))

(assert (not b!31088))

(assert (not b!31072))

(assert (not start!6626))

(assert (not b!31090))

(assert (not b!31089))

(assert (not b!31082))

(assert (not b!31073))

(assert (not b!31079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9076 () Bool)

(assert (=> d!9076 (= (head!227 lt!45576) (h!505 lt!45576))))

(assert (=> b!31084 d!9076))

(declare-fun d!9078 () Bool)

(declare-fun e!20743 () Bool)

(assert (=> d!9078 e!20743))

(declare-fun res!26775 () Bool)

(assert (=> d!9078 (=> (not res!26775) (not e!20743))))

(declare-fun lt!45724 () (_ BitVec 64))

(declare-fun lt!45722 () (_ BitVec 64))

(declare-fun lt!45727 () (_ BitVec 64))

(assert (=> d!9078 (= res!26775 (= lt!45727 (bvsub lt!45724 lt!45722)))))

(assert (=> d!9078 (or (= (bvand lt!45724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45724 lt!45722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9078 (= lt!45722 (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45567))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45567)))))))

(declare-fun lt!45726 () (_ BitVec 64))

(declare-fun lt!45725 () (_ BitVec 64))

(assert (=> d!9078 (= lt!45724 (bvmul lt!45726 lt!45725))))

(assert (=> d!9078 (or (= lt!45726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45725 (bvsdiv (bvmul lt!45726 lt!45725) lt!45726)))))

(assert (=> d!9078 (= lt!45725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9078 (= lt!45726 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))))))

(assert (=> d!9078 (= lt!45727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45567))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45567)))))))

(assert (=> d!9078 (invariant!0 (currentBit!2465 (_2!1706 lt!45567)) (currentByte!2470 (_2!1706 lt!45567)) (size!787 (buf!1115 (_2!1706 lt!45567))))))

(assert (=> d!9078 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567))) lt!45727)))

(declare-fun b!31236 () Bool)

(declare-fun res!26774 () Bool)

(assert (=> b!31236 (=> (not res!26774) (not e!20743))))

(assert (=> b!31236 (= res!26774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45727))))

(declare-fun b!31237 () Bool)

(declare-fun lt!45723 () (_ BitVec 64))

(assert (=> b!31237 (= e!20743 (bvsle lt!45727 (bvmul lt!45723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31237 (or (= lt!45723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45723)))))

(assert (=> b!31237 (= lt!45723 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))))))

(assert (= (and d!9078 res!26775) b!31236))

(assert (= (and b!31236 res!26774) b!31237))

(declare-fun m!45879 () Bool)

(assert (=> d!9078 m!45879))

(assert (=> d!9078 m!45685))

(assert (=> b!31073 d!9078))

(declare-fun d!9080 () Bool)

(assert (=> d!9080 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2512 () Bool)

(assert (= bs!2512 d!9080))

(declare-fun m!45881 () Bool)

(assert (=> bs!2512 m!45881))

(assert (=> b!31083 d!9080))

(declare-fun d!9082 () Bool)

(assert (=> d!9082 (= (invariant!0 (currentBit!2465 (_2!1706 lt!45582)) (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45567)))) (and (bvsge (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (bvslt (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000001000) (bvsge (currentByte!2470 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45567)))) (and (= (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (= (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45567))))))))))

(assert (=> b!31072 d!9082))

(declare-fun d!9084 () Bool)

(assert (=> d!9084 (= (array_inv!742 srcBuffer!2) (bvsge (size!787 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6626 d!9084))

(declare-fun d!9086 () Bool)

(assert (=> d!9086 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2465 thiss!1379) (currentByte!2470 thiss!1379) (size!787 (buf!1115 thiss!1379))))))

(declare-fun bs!2513 () Bool)

(assert (= bs!2513 d!9086))

(declare-fun m!45883 () Bool)

(assert (=> bs!2513 m!45883))

(assert (=> start!6626 d!9086))

(declare-fun d!9088 () Bool)

(assert (=> d!9088 (= (bitAt!0 (buf!1115 (_1!1707 lt!45580)) lt!45583) (not (= (bvand ((_ sign_extend 24) (select (arr!1256 (buf!1115 (_1!1707 lt!45580))) ((_ extract 31 0) (bvsdiv lt!45583 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45583 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2514 () Bool)

(assert (= bs!2514 d!9088))

(declare-fun m!45885 () Bool)

(assert (=> bs!2514 m!45885))

(declare-fun m!45887 () Bool)

(assert (=> bs!2514 m!45887))

(assert (=> b!31082 d!9088))

(declare-fun d!9090 () Bool)

(assert (=> d!9090 (= (bitAt!0 (buf!1115 (_1!1707 lt!45565)) lt!45583) (not (= (bvand ((_ sign_extend 24) (select (arr!1256 (buf!1115 (_1!1707 lt!45565))) ((_ extract 31 0) (bvsdiv lt!45583 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45583 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2515 () Bool)

(assert (= bs!2515 d!9090))

(declare-fun m!45889 () Bool)

(assert (=> bs!2515 m!45889))

(assert (=> bs!2515 m!45887))

(assert (=> b!31082 d!9090))

(declare-fun d!9092 () Bool)

(declare-fun e!20744 () Bool)

(assert (=> d!9092 e!20744))

(declare-fun res!26777 () Bool)

(assert (=> d!9092 (=> (not res!26777) (not e!20744))))

(declare-fun lt!45728 () (_ BitVec 64))

(declare-fun lt!45733 () (_ BitVec 64))

(declare-fun lt!45730 () (_ BitVec 64))

(assert (=> d!9092 (= res!26777 (= lt!45733 (bvsub lt!45730 lt!45728)))))

(assert (=> d!9092 (or (= (bvand lt!45730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45730 lt!45728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9092 (= lt!45728 (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582)))))))

(declare-fun lt!45732 () (_ BitVec 64))

(declare-fun lt!45731 () (_ BitVec 64))

(assert (=> d!9092 (= lt!45730 (bvmul lt!45732 lt!45731))))

(assert (=> d!9092 (or (= lt!45732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45731 (bvsdiv (bvmul lt!45732 lt!45731) lt!45732)))))

(assert (=> d!9092 (= lt!45731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9092 (= lt!45732 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))))))

(assert (=> d!9092 (= lt!45733 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582)))))))

(assert (=> d!9092 (invariant!0 (currentBit!2465 (_2!1706 lt!45582)) (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45582))))))

(assert (=> d!9092 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))) lt!45733)))

(declare-fun b!31238 () Bool)

(declare-fun res!26776 () Bool)

(assert (=> b!31238 (=> (not res!26776) (not e!20744))))

(assert (=> b!31238 (= res!26776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45733))))

(declare-fun b!31239 () Bool)

(declare-fun lt!45729 () (_ BitVec 64))

(assert (=> b!31239 (= e!20744 (bvsle lt!45733 (bvmul lt!45729 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31239 (or (= lt!45729 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45729 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45729)))))

(assert (=> b!31239 (= lt!45729 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))))))

(assert (= (and d!9092 res!26777) b!31238))

(assert (= (and b!31238 res!26776) b!31239))

(declare-fun m!45891 () Bool)

(assert (=> d!9092 m!45891))

(assert (=> d!9092 m!45659))

(assert (=> b!31081 d!9092))

(declare-fun d!9094 () Bool)

(assert (=> d!9094 (= (array_inv!742 (buf!1115 thiss!1379)) (bvsge (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31080 d!9094))

(declare-fun d!9096 () Bool)

(declare-fun size!792 (List!390) Int)

(assert (=> d!9096 (= (length!116 lt!45576) (size!792 lt!45576))))

(declare-fun bs!2516 () Bool)

(assert (= bs!2516 d!9096))

(declare-fun m!45893 () Bool)

(assert (=> bs!2516 m!45893))

(assert (=> b!31090 d!9096))

(declare-fun d!9098 () Bool)

(declare-fun res!26786 () Bool)

(declare-fun e!20749 () Bool)

(assert (=> d!9098 (=> (not res!26786) (not e!20749))))

(assert (=> d!9098 (= res!26786 (= (size!787 (buf!1115 thiss!1379)) (size!787 (buf!1115 thiss!1379))))))

(assert (=> d!9098 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20749)))

(declare-fun b!31246 () Bool)

(declare-fun res!26784 () Bool)

(assert (=> b!31246 (=> (not res!26784) (not e!20749))))

(assert (=> b!31246 (= res!26784 (bvsle (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)) (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(declare-fun b!31247 () Bool)

(declare-fun e!20750 () Bool)

(assert (=> b!31247 (= e!20749 e!20750)))

(declare-fun res!26785 () Bool)

(assert (=> b!31247 (=> res!26785 e!20750)))

(assert (=> b!31247 (= res!26785 (= (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31248 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1796 array!1796 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31248 (= e!20750 (arrayBitRangesEq!0 (buf!1115 thiss!1379) (buf!1115 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(assert (= (and d!9098 res!26786) b!31246))

(assert (= (and b!31246 res!26784) b!31247))

(assert (= (and b!31247 (not res!26785)) b!31248))

(assert (=> b!31246 m!45645))

(assert (=> b!31246 m!45645))

(assert (=> b!31248 m!45645))

(assert (=> b!31248 m!45645))

(declare-fun m!45897 () Bool)

(assert (=> b!31248 m!45897))

(assert (=> b!31079 d!9098))

(declare-fun d!9112 () Bool)

(assert (=> d!9112 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45736 () Unit!2381)

(declare-fun choose!11 (BitStream!1378) Unit!2381)

(assert (=> d!9112 (= lt!45736 (choose!11 thiss!1379))))

(assert (=> d!9112 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!45736)))

(declare-fun bs!2519 () Bool)

(assert (= bs!2519 d!9112))

(assert (=> bs!2519 m!45641))

(declare-fun m!45899 () Bool)

(assert (=> bs!2519 m!45899))

(assert (=> b!31079 d!9112))

(declare-fun d!9114 () Bool)

(declare-fun e!20751 () Bool)

(assert (=> d!9114 e!20751))

(declare-fun res!26788 () Bool)

(assert (=> d!9114 (=> (not res!26788) (not e!20751))))

(declare-fun lt!45737 () (_ BitVec 64))

(declare-fun lt!45742 () (_ BitVec 64))

(declare-fun lt!45739 () (_ BitVec 64))

(assert (=> d!9114 (= res!26788 (= lt!45742 (bvsub lt!45739 lt!45737)))))

(assert (=> d!9114 (or (= (bvand lt!45739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45739 lt!45737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9114 (= lt!45737 (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379))))))

(declare-fun lt!45741 () (_ BitVec 64))

(declare-fun lt!45740 () (_ BitVec 64))

(assert (=> d!9114 (= lt!45739 (bvmul lt!45741 lt!45740))))

(assert (=> d!9114 (or (= lt!45741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45740 (bvsdiv (bvmul lt!45741 lt!45740) lt!45741)))))

(assert (=> d!9114 (= lt!45740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9114 (= lt!45741 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))))))

(assert (=> d!9114 (= lt!45742 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2470 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2465 thiss!1379))))))

(assert (=> d!9114 (invariant!0 (currentBit!2465 thiss!1379) (currentByte!2470 thiss!1379) (size!787 (buf!1115 thiss!1379)))))

(assert (=> d!9114 (= (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)) lt!45742)))

(declare-fun b!31249 () Bool)

(declare-fun res!26787 () Bool)

(assert (=> b!31249 (=> (not res!26787) (not e!20751))))

(assert (=> b!31249 (= res!26787 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45742))))

(declare-fun b!31250 () Bool)

(declare-fun lt!45738 () (_ BitVec 64))

(assert (=> b!31250 (= e!20751 (bvsle lt!45742 (bvmul lt!45738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31250 (or (= lt!45738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45738)))))

(assert (=> b!31250 (= lt!45738 ((_ sign_extend 32) (size!787 (buf!1115 thiss!1379))))))

(assert (= (and d!9114 res!26788) b!31249))

(assert (= (and b!31249 res!26787) b!31250))

(assert (=> d!9114 m!45881))

(assert (=> d!9114 m!45883))

(assert (=> b!31079 d!9114))

(declare-fun d!9116 () Bool)

(declare-fun res!26791 () Bool)

(declare-fun e!20752 () Bool)

(assert (=> d!9116 (=> (not res!26791) (not e!20752))))

(assert (=> d!9116 (= res!26791 (= (size!787 (buf!1115 thiss!1379)) (size!787 (buf!1115 (_2!1706 lt!45567)))))))

(assert (=> d!9116 (= (isPrefixOf!0 thiss!1379 (_2!1706 lt!45567)) e!20752)))

(declare-fun b!31251 () Bool)

(declare-fun res!26789 () Bool)

(assert (=> b!31251 (=> (not res!26789) (not e!20752))))

(assert (=> b!31251 (= res!26789 (bvsle (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)) (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567)))))))

(declare-fun b!31252 () Bool)

(declare-fun e!20753 () Bool)

(assert (=> b!31252 (= e!20752 e!20753)))

(declare-fun res!26790 () Bool)

(assert (=> b!31252 (=> res!26790 e!20753)))

(assert (=> b!31252 (= res!26790 (= (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31253 () Bool)

(assert (=> b!31253 (= e!20753 (arrayBitRangesEq!0 (buf!1115 thiss!1379) (buf!1115 (_2!1706 lt!45567)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(assert (= (and d!9116 res!26791) b!31251))

(assert (= (and b!31251 res!26789) b!31252))

(assert (= (and b!31252 (not res!26790)) b!31253))

(assert (=> b!31251 m!45645))

(assert (=> b!31251 m!45665))

(assert (=> b!31253 m!45645))

(assert (=> b!31253 m!45645))

(declare-fun m!45901 () Bool)

(assert (=> b!31253 m!45901))

(assert (=> b!31089 d!9116))

(declare-fun d!9118 () Bool)

(assert (=> d!9118 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45763 () Unit!2381)

(declare-fun choose!9 (BitStream!1378 array!1796 (_ BitVec 64) BitStream!1378) Unit!2381)

(assert (=> d!9118 (= lt!45763 (choose!9 thiss!1379 (buf!1115 (_2!1706 lt!45582)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1379 (buf!1115 (_2!1706 lt!45582)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(assert (=> d!9118 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1115 (_2!1706 lt!45582)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45763)))

(declare-fun bs!2520 () Bool)

(assert (= bs!2520 d!9118))

(assert (=> bs!2520 m!45673))

(declare-fun m!45907 () Bool)

(assert (=> bs!2520 m!45907))

(assert (=> b!31089 d!9118))

(declare-fun b!31455 () Bool)

(declare-fun res!26942 () Bool)

(declare-fun e!20852 () Bool)

(assert (=> b!31455 (=> (not res!26942) (not e!20852))))

(declare-fun lt!46423 () tuple2!3238)

(assert (=> b!31455 (= res!26942 (invariant!0 (currentBit!2465 (_2!1706 lt!46423)) (currentByte!2470 (_2!1706 lt!46423)) (size!787 (buf!1115 (_2!1706 lt!46423)))))))

(declare-fun b!31456 () Bool)

(declare-fun e!20850 () tuple2!3238)

(declare-fun Unit!2405 () Unit!2381)

(assert (=> b!31456 (= e!20850 (tuple2!3239 Unit!2405 (_2!1706 lt!45582)))))

(assert (=> b!31456 (= (size!787 (buf!1115 (_2!1706 lt!45582))) (size!787 (buf!1115 (_2!1706 lt!45582))))))

(declare-fun lt!46414 () Unit!2381)

(declare-fun Unit!2406 () Unit!2381)

(assert (=> b!31456 (= lt!46414 Unit!2406)))

(declare-fun call!409 () tuple2!3240)

(declare-fun checkByteArrayBitContent!0 (BitStream!1378 array!1796 array!1796 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3260 0))(
  ( (tuple2!3261 (_1!1717 array!1796) (_2!1717 BitStream!1378)) )
))
(declare-fun readBits!0 (BitStream!1378 (_ BitVec 64)) tuple2!3260)

(assert (=> b!31456 (checkByteArrayBitContent!0 (_2!1706 lt!45582) srcBuffer!2 (_1!1717 (readBits!0 (_1!1707 call!409) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!31458 () Bool)

(declare-fun lt!46447 () tuple2!3238)

(declare-fun Unit!2407 () Unit!2381)

(assert (=> b!31458 (= e!20850 (tuple2!3239 Unit!2407 (_2!1706 lt!46447)))))

(declare-fun lt!46411 () tuple2!3238)

(assert (=> b!31458 (= lt!46411 (appendBitFromByte!0 (_2!1706 lt!45582) (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!46410 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46410 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46424 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46424 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46437 () Unit!2381)

(assert (=> b!31458 (= lt!46437 (validateOffsetBitsIneqLemma!0 (_2!1706 lt!45582) (_2!1706 lt!46411) lt!46410 lt!46424))))

(assert (=> b!31458 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!46411)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!46411))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!46411))) (bvsub lt!46410 lt!46424))))

(declare-fun lt!46445 () Unit!2381)

(assert (=> b!31458 (= lt!46445 lt!46437)))

(declare-fun lt!46449 () tuple2!3240)

(assert (=> b!31458 (= lt!46449 (reader!0 (_2!1706 lt!45582) (_2!1706 lt!46411)))))

(declare-fun lt!46441 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46441 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46409 () Unit!2381)

(assert (=> b!31458 (= lt!46409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!46411)) lt!46441))))

(assert (=> b!31458 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!46411)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!46441)))

(declare-fun lt!46450 () Unit!2381)

(assert (=> b!31458 (= lt!46450 lt!46409)))

(assert (=> b!31458 (= (head!227 (byteArrayBitContentToList!0 (_2!1706 lt!46411) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!227 (bitStreamReadBitsIntoList!0 (_2!1706 lt!46411) (_1!1707 lt!46449) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46416 () Unit!2381)

(declare-fun Unit!2408 () Unit!2381)

(assert (=> b!31458 (= lt!46416 Unit!2408)))

(assert (=> b!31458 (= lt!46447 (appendBitsMSBFirstLoop!0 (_2!1706 lt!46411) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!46415 () Unit!2381)

(assert (=> b!31458 (= lt!46415 (lemmaIsPrefixTransitive!0 (_2!1706 lt!45582) (_2!1706 lt!46411) (_2!1706 lt!46447)))))

(assert (=> b!31458 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!46447))))

(declare-fun lt!46425 () Unit!2381)

(assert (=> b!31458 (= lt!46425 lt!46415)))

(assert (=> b!31458 (= (size!787 (buf!1115 (_2!1706 lt!46447))) (size!787 (buf!1115 (_2!1706 lt!45582))))))

(declare-fun lt!46427 () Unit!2381)

(declare-fun Unit!2409 () Unit!2381)

(assert (=> b!31458 (= lt!46427 Unit!2409)))

(assert (=> b!31458 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46447))) (currentByte!2470 (_2!1706 lt!46447)) (currentBit!2465 (_2!1706 lt!46447))) (bvsub (bvadd (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46420 () Unit!2381)

(declare-fun Unit!2410 () Unit!2381)

(assert (=> b!31458 (= lt!46420 Unit!2410)))

(assert (=> b!31458 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46447))) (currentByte!2470 (_2!1706 lt!46447)) (currentBit!2465 (_2!1706 lt!46447))) (bvsub (bvsub (bvadd (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46411))) (currentByte!2470 (_2!1706 lt!46411)) (currentBit!2465 (_2!1706 lt!46411))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46434 () Unit!2381)

(declare-fun Unit!2411 () Unit!2381)

(assert (=> b!31458 (= lt!46434 Unit!2411)))

(declare-fun lt!46426 () tuple2!3240)

(assert (=> b!31458 (= lt!46426 (reader!0 (_2!1706 lt!45582) (_2!1706 lt!46447)))))

(declare-fun lt!46429 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46429 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46433 () Unit!2381)

(assert (=> b!31458 (= lt!46433 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!46447)) lt!46429))))

(assert (=> b!31458 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!46447)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!46429)))

(declare-fun lt!46422 () Unit!2381)

(assert (=> b!31458 (= lt!46422 lt!46433)))

(declare-fun lt!46417 () tuple2!3240)

(assert (=> b!31458 (= lt!46417 call!409)))

(declare-fun lt!46421 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46421 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46412 () Unit!2381)

(assert (=> b!31458 (= lt!46412 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!46411) (buf!1115 (_2!1706 lt!46447)) lt!46421))))

(assert (=> b!31458 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!46447)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!46411))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!46411))) lt!46421)))

(declare-fun lt!46446 () Unit!2381)

(assert (=> b!31458 (= lt!46446 lt!46412)))

(declare-fun lt!46408 () List!390)

(assert (=> b!31458 (= lt!46408 (byteArrayBitContentToList!0 (_2!1706 lt!46447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!46439 () List!390)

(assert (=> b!31458 (= lt!46439 (byteArrayBitContentToList!0 (_2!1706 lt!46447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46430 () List!390)

(assert (=> b!31458 (= lt!46430 (bitStreamReadBitsIntoList!0 (_2!1706 lt!46447) (_1!1707 lt!46426) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!46443 () List!390)

(assert (=> b!31458 (= lt!46443 (bitStreamReadBitsIntoList!0 (_2!1706 lt!46447) (_1!1707 lt!46417) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46413 () (_ BitVec 64))

(assert (=> b!31458 (= lt!46413 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46431 () Unit!2381)

(assert (=> b!31458 (= lt!46431 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1706 lt!46447) (_2!1706 lt!46447) (_1!1707 lt!46426) (_1!1707 lt!46417) lt!46413 lt!46430))))

(assert (=> b!31458 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!46447) (_1!1707 lt!46417) (bvsub lt!46413 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!107 lt!46430))))

(declare-fun lt!46440 () Unit!2381)

(assert (=> b!31458 (= lt!46440 lt!46431)))

(declare-fun lt!46442 () (_ BitVec 64))

(declare-fun lt!46435 () Unit!2381)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1796 array!1796 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2381)

(assert (=> b!31458 (= lt!46435 (arrayBitRangesEqImpliesEq!0 (buf!1115 (_2!1706 lt!46411)) (buf!1115 (_2!1706 lt!46447)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!46442 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46411))) (currentByte!2470 (_2!1706 lt!46411)) (currentBit!2465 (_2!1706 lt!46411)))))))

(assert (=> b!31458 (= (bitAt!0 (buf!1115 (_2!1706 lt!46411)) lt!46442) (bitAt!0 (buf!1115 (_2!1706 lt!46447)) lt!46442))))

(declare-fun lt!46438 () Unit!2381)

(assert (=> b!31458 (= lt!46438 lt!46435)))

(declare-fun b!31459 () Bool)

(declare-fun res!26944 () Bool)

(assert (=> b!31459 (=> (not res!26944) (not e!20852))))

(assert (=> b!31459 (= res!26944 (= (size!787 (buf!1115 (_2!1706 lt!46423))) (size!787 (buf!1115 (_2!1706 lt!45582)))))))

(declare-fun b!31460 () Bool)

(declare-fun res!26945 () Bool)

(assert (=> b!31460 (=> (not res!26945) (not e!20852))))

(assert (=> b!31460 (= res!26945 (= (size!787 (buf!1115 (_2!1706 lt!45582))) (size!787 (buf!1115 (_2!1706 lt!46423)))))))

(declare-fun b!31461 () Bool)

(declare-fun res!26946 () Bool)

(assert (=> b!31461 (=> (not res!26946) (not e!20852))))

(assert (=> b!31461 (= res!26946 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!46423)))))

(declare-fun c!2126 () Bool)

(declare-fun bm!406 () Bool)

(assert (=> bm!406 (= call!409 (reader!0 (ite c!2126 (_2!1706 lt!46411) (_2!1706 lt!45582)) (ite c!2126 (_2!1706 lt!46447) (_2!1706 lt!45582))))))

(declare-fun b!31462 () Bool)

(declare-fun lt!46432 () tuple2!3240)

(assert (=> b!31462 (= e!20852 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!46423) (_1!1707 lt!46432) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1706 lt!46423) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!31462 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31462 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!46451 () Unit!2381)

(declare-fun lt!46448 () Unit!2381)

(assert (=> b!31462 (= lt!46451 lt!46448)))

(declare-fun lt!46436 () (_ BitVec 64))

(assert (=> b!31462 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!46423)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!46436)))

(assert (=> b!31462 (= lt!46448 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!46423)) lt!46436))))

(declare-fun e!20851 () Bool)

(assert (=> b!31462 e!20851))

(declare-fun res!26943 () Bool)

(assert (=> b!31462 (=> (not res!26943) (not e!20851))))

(assert (=> b!31462 (= res!26943 (and (= (size!787 (buf!1115 (_2!1706 lt!45582))) (size!787 (buf!1115 (_2!1706 lt!46423)))) (bvsge lt!46436 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31462 (= lt!46436 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!31462 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31462 (= lt!46432 (reader!0 (_2!1706 lt!45582) (_2!1706 lt!46423)))))

(declare-fun b!31457 () Bool)

(assert (=> b!31457 (= e!20851 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!46436))))

(declare-fun d!9124 () Bool)

(assert (=> d!9124 e!20852))

(declare-fun res!26947 () Bool)

(assert (=> d!9124 (=> (not res!26947) (not e!20852))))

(declare-fun lt!46419 () (_ BitVec 64))

(assert (=> d!9124 (= res!26947 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46423))) (currentByte!2470 (_2!1706 lt!46423)) (currentBit!2465 (_2!1706 lt!46423))) (bvsub lt!46419 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9124 (or (= (bvand lt!46419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46419 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!46428 () (_ BitVec 64))

(assert (=> d!9124 (= lt!46419 (bvadd lt!46428 to!314))))

(assert (=> d!9124 (or (not (= (bvand lt!46428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!46428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!46428 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9124 (= lt!46428 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (=> d!9124 (= lt!46423 e!20850)))

(assert (=> d!9124 (= c!2126 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!46444 () Unit!2381)

(declare-fun lt!46418 () Unit!2381)

(assert (=> d!9124 (= lt!46444 lt!46418)))

(assert (=> d!9124 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45582))))

(assert (=> d!9124 (= lt!46418 (lemmaIsPrefixRefl!0 (_2!1706 lt!45582)))))

(assert (=> d!9124 (= lt!46442 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (=> d!9124 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9124 (= (appendBitsMSBFirstLoop!0 (_2!1706 lt!45582) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!46423)))

(assert (= (and d!9124 c!2126) b!31458))

(assert (= (and d!9124 (not c!2126)) b!31456))

(assert (= (or b!31458 b!31456) bm!406))

(assert (= (and d!9124 res!26947) b!31455))

(assert (= (and b!31455 res!26942) b!31460))

(assert (= (and b!31460 res!26945) b!31461))

(assert (= (and b!31461 res!26946) b!31459))

(assert (= (and b!31459 res!26944) b!31462))

(assert (= (and b!31462 res!26943) b!31457))

(declare-fun m!46331 () Bool)

(assert (=> b!31461 m!46331))

(declare-fun m!46333 () Bool)

(assert (=> bm!406 m!46333))

(declare-fun m!46335 () Bool)

(assert (=> b!31455 m!46335))

(declare-fun m!46337 () Bool)

(assert (=> b!31457 m!46337))

(declare-fun m!46339 () Bool)

(assert (=> d!9124 m!46339))

(assert (=> d!9124 m!45635))

(declare-fun m!46341 () Bool)

(assert (=> d!9124 m!46341))

(declare-fun m!46343 () Bool)

(assert (=> d!9124 m!46343))

(declare-fun m!46345 () Bool)

(assert (=> b!31462 m!46345))

(declare-fun m!46347 () Bool)

(assert (=> b!31462 m!46347))

(declare-fun m!46349 () Bool)

(assert (=> b!31462 m!46349))

(declare-fun m!46351 () Bool)

(assert (=> b!31462 m!46351))

(declare-fun m!46353 () Bool)

(assert (=> b!31462 m!46353))

(declare-fun m!46355 () Bool)

(assert (=> b!31458 m!46355))

(declare-fun m!46357 () Bool)

(assert (=> b!31458 m!46357))

(declare-fun m!46359 () Bool)

(assert (=> b!31458 m!46359))

(declare-fun m!46361 () Bool)

(assert (=> b!31458 m!46361))

(declare-fun m!46363 () Bool)

(assert (=> b!31458 m!46363))

(declare-fun m!46365 () Bool)

(assert (=> b!31458 m!46365))

(declare-fun m!46367 () Bool)

(assert (=> b!31458 m!46367))

(declare-fun m!46369 () Bool)

(assert (=> b!31458 m!46369))

(declare-fun m!46371 () Bool)

(assert (=> b!31458 m!46371))

(declare-fun m!46373 () Bool)

(assert (=> b!31458 m!46373))

(declare-fun m!46383 () Bool)

(assert (=> b!31458 m!46383))

(declare-fun m!46385 () Bool)

(assert (=> b!31458 m!46385))

(assert (=> b!31458 m!46361))

(declare-fun m!46387 () Bool)

(assert (=> b!31458 m!46387))

(assert (=> b!31458 m!46383))

(declare-fun m!46389 () Bool)

(assert (=> b!31458 m!46389))

(declare-fun m!46391 () Bool)

(assert (=> b!31458 m!46391))

(declare-fun m!46393 () Bool)

(assert (=> b!31458 m!46393))

(declare-fun m!46395 () Bool)

(assert (=> b!31458 m!46395))

(declare-fun m!46397 () Bool)

(assert (=> b!31458 m!46397))

(declare-fun m!46399 () Bool)

(assert (=> b!31458 m!46399))

(declare-fun m!46401 () Bool)

(assert (=> b!31458 m!46401))

(declare-fun m!46403 () Bool)

(assert (=> b!31458 m!46403))

(declare-fun m!46405 () Bool)

(assert (=> b!31458 m!46405))

(declare-fun m!46407 () Bool)

(assert (=> b!31458 m!46407))

(assert (=> b!31458 m!46367))

(declare-fun m!46409 () Bool)

(assert (=> b!31458 m!46409))

(declare-fun m!46411 () Bool)

(assert (=> b!31458 m!46411))

(declare-fun m!46413 () Bool)

(assert (=> b!31458 m!46413))

(declare-fun m!46415 () Bool)

(assert (=> b!31458 m!46415))

(declare-fun m!46417 () Bool)

(assert (=> b!31458 m!46417))

(assert (=> b!31458 m!45635))

(declare-fun m!46419 () Bool)

(assert (=> b!31458 m!46419))

(assert (=> b!31458 m!46389))

(declare-fun m!46423 () Bool)

(assert (=> b!31458 m!46423))

(declare-fun m!46425 () Bool)

(assert (=> b!31458 m!46425))

(declare-fun m!46429 () Bool)

(assert (=> b!31456 m!46429))

(declare-fun m!46437 () Bool)

(assert (=> b!31456 m!46437))

(assert (=> b!31089 d!9124))

(declare-fun b!31506 () Bool)

(declare-fun e!20876 () Unit!2381)

(declare-fun Unit!2414 () Unit!2381)

(assert (=> b!31506 (= e!20876 Unit!2414)))

(declare-fun b!31507 () Bool)

(declare-fun lt!46543 () Unit!2381)

(assert (=> b!31507 (= e!20876 lt!46543)))

(declare-fun lt!46548 () (_ BitVec 64))

(assert (=> b!31507 (= lt!46548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46544 () (_ BitVec 64))

(assert (=> b!31507 (= lt!46544 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1796 array!1796 (_ BitVec 64) (_ BitVec 64)) Unit!2381)

(assert (=> b!31507 (= lt!46543 (arrayBitRangesEqSymmetric!0 (buf!1115 thiss!1379) (buf!1115 (_2!1706 lt!45582)) lt!46548 lt!46544))))

(assert (=> b!31507 (arrayBitRangesEq!0 (buf!1115 (_2!1706 lt!45582)) (buf!1115 thiss!1379) lt!46548 lt!46544)))

(declare-fun b!31508 () Bool)

(declare-fun res!26965 () Bool)

(declare-fun e!20875 () Bool)

(assert (=> b!31508 (=> (not res!26965) (not e!20875))))

(declare-fun lt!46547 () tuple2!3240)

(assert (=> b!31508 (= res!26965 (isPrefixOf!0 (_1!1707 lt!46547) thiss!1379))))

(declare-fun d!9234 () Bool)

(assert (=> d!9234 e!20875))

(declare-fun res!26963 () Bool)

(assert (=> d!9234 (=> (not res!26963) (not e!20875))))

(assert (=> d!9234 (= res!26963 (isPrefixOf!0 (_1!1707 lt!46547) (_2!1707 lt!46547)))))

(declare-fun lt!46536 () BitStream!1378)

(assert (=> d!9234 (= lt!46547 (tuple2!3241 lt!46536 (_2!1706 lt!45582)))))

(declare-fun lt!46538 () Unit!2381)

(declare-fun lt!46533 () Unit!2381)

(assert (=> d!9234 (= lt!46538 lt!46533)))

(assert (=> d!9234 (isPrefixOf!0 lt!46536 (_2!1706 lt!45582))))

(assert (=> d!9234 (= lt!46533 (lemmaIsPrefixTransitive!0 lt!46536 (_2!1706 lt!45582) (_2!1706 lt!45582)))))

(declare-fun lt!46530 () Unit!2381)

(declare-fun lt!46546 () Unit!2381)

(assert (=> d!9234 (= lt!46530 lt!46546)))

(assert (=> d!9234 (isPrefixOf!0 lt!46536 (_2!1706 lt!45582))))

(assert (=> d!9234 (= lt!46546 (lemmaIsPrefixTransitive!0 lt!46536 thiss!1379 (_2!1706 lt!45582)))))

(declare-fun lt!46532 () Unit!2381)

(assert (=> d!9234 (= lt!46532 e!20876)))

(declare-fun c!2141 () Bool)

(assert (=> d!9234 (= c!2141 (not (= (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!46531 () Unit!2381)

(declare-fun lt!46534 () Unit!2381)

(assert (=> d!9234 (= lt!46531 lt!46534)))

(assert (=> d!9234 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45582))))

(assert (=> d!9234 (= lt!46534 (lemmaIsPrefixRefl!0 (_2!1706 lt!45582)))))

(declare-fun lt!46549 () Unit!2381)

(declare-fun lt!46540 () Unit!2381)

(assert (=> d!9234 (= lt!46549 lt!46540)))

(assert (=> d!9234 (= lt!46540 (lemmaIsPrefixRefl!0 (_2!1706 lt!45582)))))

(declare-fun lt!46537 () Unit!2381)

(declare-fun lt!46542 () Unit!2381)

(assert (=> d!9234 (= lt!46537 lt!46542)))

(assert (=> d!9234 (isPrefixOf!0 lt!46536 lt!46536)))

(assert (=> d!9234 (= lt!46542 (lemmaIsPrefixRefl!0 lt!46536))))

(declare-fun lt!46539 () Unit!2381)

(declare-fun lt!46535 () Unit!2381)

(assert (=> d!9234 (= lt!46539 lt!46535)))

(assert (=> d!9234 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9234 (= lt!46535 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9234 (= lt!46536 (BitStream!1379 (buf!1115 (_2!1706 lt!45582)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(assert (=> d!9234 (isPrefixOf!0 thiss!1379 (_2!1706 lt!45582))))

(assert (=> d!9234 (= (reader!0 thiss!1379 (_2!1706 lt!45582)) lt!46547)))

(declare-fun b!31509 () Bool)

(declare-fun res!26964 () Bool)

(assert (=> b!31509 (=> (not res!26964) (not e!20875))))

(assert (=> b!31509 (= res!26964 (isPrefixOf!0 (_2!1707 lt!46547) (_2!1706 lt!45582)))))

(declare-fun lt!46545 () (_ BitVec 64))

(declare-fun lt!46541 () (_ BitVec 64))

(declare-fun b!31510 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1378 (_ BitVec 64)) BitStream!1378)

(assert (=> b!31510 (= e!20875 (= (_1!1707 lt!46547) (withMovedBitIndex!0 (_2!1707 lt!46547) (bvsub lt!46545 lt!46541))))))

(assert (=> b!31510 (or (= (bvand lt!46545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46545 lt!46541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31510 (= lt!46541 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (=> b!31510 (= lt!46545 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(assert (= (and d!9234 c!2141) b!31507))

(assert (= (and d!9234 (not c!2141)) b!31506))

(assert (= (and d!9234 res!26963) b!31508))

(assert (= (and b!31508 res!26965) b!31509))

(assert (= (and b!31509 res!26964) b!31510))

(declare-fun m!46477 () Bool)

(assert (=> b!31509 m!46477))

(declare-fun m!46479 () Bool)

(assert (=> b!31510 m!46479))

(assert (=> b!31510 m!45635))

(assert (=> b!31510 m!45645))

(assert (=> b!31507 m!45645))

(declare-fun m!46481 () Bool)

(assert (=> b!31507 m!46481))

(declare-fun m!46483 () Bool)

(assert (=> b!31507 m!46483))

(declare-fun m!46485 () Bool)

(assert (=> b!31508 m!46485))

(assert (=> d!9234 m!45649))

(assert (=> d!9234 m!46343))

(assert (=> d!9234 m!46341))

(declare-fun m!46487 () Bool)

(assert (=> d!9234 m!46487))

(declare-fun m!46489 () Bool)

(assert (=> d!9234 m!46489))

(declare-fun m!46491 () Bool)

(assert (=> d!9234 m!46491))

(declare-fun m!46493 () Bool)

(assert (=> d!9234 m!46493))

(assert (=> d!9234 m!45641))

(declare-fun m!46495 () Bool)

(assert (=> d!9234 m!46495))

(assert (=> d!9234 m!45643))

(declare-fun m!46497 () Bool)

(assert (=> d!9234 m!46497))

(assert (=> b!31089 d!9234))

(declare-fun d!9254 () Bool)

(declare-fun res!26968 () Bool)

(declare-fun e!20877 () Bool)

(assert (=> d!9254 (=> (not res!26968) (not e!20877))))

(assert (=> d!9254 (= res!26968 (= (size!787 (buf!1115 (_2!1706 lt!45582))) (size!787 (buf!1115 (_2!1706 lt!45567)))))))

(assert (=> d!9254 (= (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45567)) e!20877)))

(declare-fun b!31511 () Bool)

(declare-fun res!26966 () Bool)

(assert (=> b!31511 (=> (not res!26966) (not e!20877))))

(assert (=> b!31511 (= res!26966 (bvsle (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))) (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567)))))))

(declare-fun b!31512 () Bool)

(declare-fun e!20878 () Bool)

(assert (=> b!31512 (= e!20877 e!20878)))

(declare-fun res!26967 () Bool)

(assert (=> b!31512 (=> res!26967 e!20878)))

(assert (=> b!31512 (= res!26967 (= (size!787 (buf!1115 (_2!1706 lt!45582))) #b00000000000000000000000000000000))))

(declare-fun b!31513 () Bool)

(assert (=> b!31513 (= e!20878 (arrayBitRangesEq!0 (buf!1115 (_2!1706 lt!45582)) (buf!1115 (_2!1706 lt!45567)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582)))))))

(assert (= (and d!9254 res!26968) b!31511))

(assert (= (and b!31511 res!26966) b!31512))

(assert (= (and b!31512 (not res!26967)) b!31513))

(assert (=> b!31511 m!45635))

(assert (=> b!31511 m!45665))

(assert (=> b!31513 m!45635))

(assert (=> b!31513 m!45635))

(declare-fun m!46499 () Bool)

(assert (=> b!31513 m!46499))

(assert (=> b!31089 d!9254))

(declare-fun d!9256 () Bool)

(assert (=> d!9256 (isPrefixOf!0 thiss!1379 (_2!1706 lt!45567))))

(declare-fun lt!46552 () Unit!2381)

(declare-fun choose!30 (BitStream!1378 BitStream!1378 BitStream!1378) Unit!2381)

(assert (=> d!9256 (= lt!46552 (choose!30 thiss!1379 (_2!1706 lt!45582) (_2!1706 lt!45567)))))

(assert (=> d!9256 (isPrefixOf!0 thiss!1379 (_2!1706 lt!45582))))

(assert (=> d!9256 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1706 lt!45582) (_2!1706 lt!45567)) lt!46552)))

(declare-fun bs!2548 () Bool)

(assert (= bs!2548 d!9256))

(assert (=> bs!2548 m!45667))

(declare-fun m!46501 () Bool)

(assert (=> bs!2548 m!46501))

(assert (=> bs!2548 m!45649))

(assert (=> b!31089 d!9256))

(declare-fun d!9258 () Bool)

(assert (=> d!9258 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2549 () Bool)

(assert (= bs!2549 d!9258))

(declare-fun m!46503 () Bool)

(assert (=> bs!2549 m!46503))

(assert (=> b!31089 d!9258))

(declare-fun d!9260 () Bool)

(declare-fun res!26971 () Bool)

(declare-fun e!20879 () Bool)

(assert (=> d!9260 (=> (not res!26971) (not e!20879))))

(assert (=> d!9260 (= res!26971 (= (size!787 (buf!1115 thiss!1379)) (size!787 (buf!1115 (_2!1706 lt!45582)))))))

(assert (=> d!9260 (= (isPrefixOf!0 thiss!1379 (_2!1706 lt!45582)) e!20879)))

(declare-fun b!31514 () Bool)

(declare-fun res!26969 () Bool)

(assert (=> b!31514 (=> (not res!26969) (not e!20879))))

(assert (=> b!31514 (= res!26969 (bvsle (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)) (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582)))))))

(declare-fun b!31515 () Bool)

(declare-fun e!20880 () Bool)

(assert (=> b!31515 (= e!20879 e!20880)))

(declare-fun res!26970 () Bool)

(assert (=> b!31515 (=> res!26970 e!20880)))

(assert (=> b!31515 (= res!26970 (= (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31516 () Bool)

(assert (=> b!31516 (= e!20880 (arrayBitRangesEq!0 (buf!1115 thiss!1379) (buf!1115 (_2!1706 lt!45582)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(assert (= (and d!9260 res!26971) b!31514))

(assert (= (and b!31514 res!26969) b!31515))

(assert (= (and b!31515 (not res!26970)) b!31516))

(assert (=> b!31514 m!45645))

(assert (=> b!31514 m!45635))

(assert (=> b!31516 m!45645))

(assert (=> b!31516 m!45645))

(declare-fun m!46505 () Bool)

(assert (=> b!31516 m!46505))

(assert (=> b!31078 d!9260))

(declare-fun d!9262 () Bool)

(assert (=> d!9262 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!45570) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582)))) lt!45570))))

(declare-fun bs!2550 () Bool)

(assert (= bs!2550 d!9262))

(assert (=> bs!2550 m!45891))

(assert (=> b!31078 d!9262))

(declare-fun d!9264 () Bool)

(declare-fun e!20883 () Bool)

(assert (=> d!9264 e!20883))

(declare-fun res!26974 () Bool)

(assert (=> d!9264 (=> (not res!26974) (not e!20883))))

(assert (=> d!9264 (= res!26974 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46555 () Unit!2381)

(declare-fun choose!27 (BitStream!1378 BitStream!1378 (_ BitVec 64) (_ BitVec 64)) Unit!2381)

(assert (=> d!9264 (= lt!46555 (choose!27 thiss!1379 (_2!1706 lt!45582) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9264 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9264 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1706 lt!45582) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!46555)))

(declare-fun b!31519 () Bool)

(assert (=> b!31519 (= e!20883 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45582)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9264 res!26974) b!31519))

(declare-fun m!46507 () Bool)

(assert (=> d!9264 m!46507))

(declare-fun m!46509 () Bool)

(assert (=> b!31519 m!46509))

(assert (=> b!31078 d!9264))

(declare-fun b!31564 () Bool)

(declare-fun e!20906 () Bool)

(declare-datatypes ((tuple2!3266 0))(
  ( (tuple2!3267 (_1!1720 BitStream!1378) (_2!1720 Bool)) )
))
(declare-fun lt!46631 () tuple2!3266)

(declare-fun lt!46623 () tuple2!3238)

(assert (=> b!31564 (= e!20906 (= (bitIndex!0 (size!787 (buf!1115 (_1!1720 lt!46631))) (currentByte!2470 (_1!1720 lt!46631)) (currentBit!2465 (_1!1720 lt!46631))) (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46623))) (currentByte!2470 (_2!1706 lt!46623)) (currentBit!2465 (_2!1706 lt!46623)))))))

(declare-fun b!31565 () Bool)

(declare-fun e!20908 () Bool)

(declare-fun e!20907 () Bool)

(assert (=> b!31565 (= e!20908 e!20907)))

(declare-fun res!27021 () Bool)

(assert (=> b!31565 (=> (not res!27021) (not e!20907))))

(declare-fun lt!46627 () tuple2!3238)

(declare-fun lt!46630 () tuple2!3266)

(declare-fun lt!46622 () Bool)

(assert (=> b!31565 (= res!27021 (and (= (_2!1720 lt!46630) lt!46622) (= (_1!1720 lt!46630) (_2!1706 lt!46627))))))

(declare-fun readBitPure!0 (BitStream!1378) tuple2!3266)

(declare-fun readerFrom!0 (BitStream!1378 (_ BitVec 32) (_ BitVec 32)) BitStream!1378)

(assert (=> b!31565 (= lt!46630 (readBitPure!0 (readerFrom!0 (_2!1706 lt!46627) (currentBit!2465 thiss!1379) (currentByte!2470 thiss!1379))))))

(declare-fun b!31566 () Bool)

(declare-fun e!20905 () Bool)

(assert (=> b!31566 (= e!20905 e!20906)))

(declare-fun res!27018 () Bool)

(assert (=> b!31566 (=> (not res!27018) (not e!20906))))

(declare-fun lt!46626 () (_ BitVec 8))

(assert (=> b!31566 (= res!27018 (and (= (_2!1720 lt!46631) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!46626)) #b00000000000000000000000000000000))) (= (_1!1720 lt!46631) (_2!1706 lt!46623))))))

(declare-fun lt!46633 () tuple2!3260)

(declare-fun lt!46632 () BitStream!1378)

(assert (=> b!31566 (= lt!46633 (readBits!0 lt!46632 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!31566 (= lt!46631 (readBitPure!0 lt!46632))))

(assert (=> b!31566 (= lt!46632 (readerFrom!0 (_2!1706 lt!46623) (currentBit!2465 thiss!1379) (currentByte!2470 thiss!1379)))))

(declare-fun b!31567 () Bool)

(declare-fun res!27022 () Bool)

(assert (=> b!31567 (=> (not res!27022) (not e!20905))))

(assert (=> b!31567 (= res!27022 (isPrefixOf!0 thiss!1379 (_2!1706 lt!46623)))))

(declare-fun b!31568 () Bool)

(declare-fun res!27017 () Bool)

(assert (=> b!31568 (=> (not res!27017) (not e!20908))))

(assert (=> b!31568 (= res!27017 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46627))) (currentByte!2470 (_2!1706 lt!46627)) (currentBit!2465 (_2!1706 lt!46627))) (bvadd (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!9266 () Bool)

(assert (=> d!9266 e!20905))

(declare-fun res!27020 () Bool)

(assert (=> d!9266 (=> (not res!27020) (not e!20905))))

(assert (=> d!9266 (= res!27020 (= (size!787 (buf!1115 (_2!1706 lt!46623))) (size!787 (buf!1115 thiss!1379))))))

(declare-fun lt!46624 () array!1796)

(assert (=> d!9266 (= lt!46626 (select (arr!1256 lt!46624) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9266 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!787 lt!46624)))))

(assert (=> d!9266 (= lt!46624 (array!1797 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!46625 () tuple2!3238)

(assert (=> d!9266 (= lt!46623 (tuple2!3239 (_1!1706 lt!46625) (_2!1706 lt!46625)))))

(assert (=> d!9266 (= lt!46625 lt!46627)))

(assert (=> d!9266 e!20908))

(declare-fun res!27024 () Bool)

(assert (=> d!9266 (=> (not res!27024) (not e!20908))))

(assert (=> d!9266 (= res!27024 (= (size!787 (buf!1115 thiss!1379)) (size!787 (buf!1115 (_2!1706 lt!46627)))))))

(declare-fun appendBit!0 (BitStream!1378 Bool) tuple2!3238)

(assert (=> d!9266 (= lt!46627 (appendBit!0 thiss!1379 lt!46622))))

(assert (=> d!9266 (= lt!46622 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9266 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9266 (= (appendBitFromByte!0 thiss!1379 (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!46623)))

(declare-fun b!31569 () Bool)

(assert (=> b!31569 (= e!20907 (= (bitIndex!0 (size!787 (buf!1115 (_1!1720 lt!46630))) (currentByte!2470 (_1!1720 lt!46630)) (currentBit!2465 (_1!1720 lt!46630))) (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46627))) (currentByte!2470 (_2!1706 lt!46627)) (currentBit!2465 (_2!1706 lt!46627)))))))

(declare-fun b!31570 () Bool)

(declare-fun res!27023 () Bool)

(assert (=> b!31570 (=> (not res!27023) (not e!20905))))

(declare-fun lt!46628 () (_ BitVec 64))

(declare-fun lt!46629 () (_ BitVec 64))

(assert (=> b!31570 (= res!27023 (= (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!46623))) (currentByte!2470 (_2!1706 lt!46623)) (currentBit!2465 (_2!1706 lt!46623))) (bvadd lt!46629 lt!46628)))))

(assert (=> b!31570 (or (not (= (bvand lt!46629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46628 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!46629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!46629 lt!46628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31570 (= lt!46628 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!31570 (= lt!46629 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(declare-fun b!31571 () Bool)

(declare-fun res!27019 () Bool)

(assert (=> b!31571 (=> (not res!27019) (not e!20908))))

(assert (=> b!31571 (= res!27019 (isPrefixOf!0 thiss!1379 (_2!1706 lt!46627)))))

(assert (= (and d!9266 res!27024) b!31568))

(assert (= (and b!31568 res!27017) b!31571))

(assert (= (and b!31571 res!27019) b!31565))

(assert (= (and b!31565 res!27021) b!31569))

(assert (= (and d!9266 res!27020) b!31570))

(assert (= (and b!31570 res!27023) b!31567))

(assert (= (and b!31567 res!27022) b!31566))

(assert (= (and b!31566 res!27018) b!31564))

(declare-fun m!46537 () Bool)

(assert (=> b!31566 m!46537))

(declare-fun m!46539 () Bool)

(assert (=> b!31566 m!46539))

(declare-fun m!46541 () Bool)

(assert (=> b!31566 m!46541))

(declare-fun m!46543 () Bool)

(assert (=> b!31569 m!46543))

(declare-fun m!46545 () Bool)

(assert (=> b!31569 m!46545))

(declare-fun m!46547 () Bool)

(assert (=> b!31567 m!46547))

(declare-fun m!46549 () Bool)

(assert (=> b!31564 m!46549))

(declare-fun m!46551 () Bool)

(assert (=> b!31564 m!46551))

(declare-fun m!46553 () Bool)

(assert (=> b!31571 m!46553))

(assert (=> b!31568 m!46545))

(assert (=> b!31568 m!45645))

(declare-fun m!46555 () Bool)

(assert (=> b!31565 m!46555))

(assert (=> b!31565 m!46555))

(declare-fun m!46557 () Bool)

(assert (=> b!31565 m!46557))

(declare-fun m!46559 () Bool)

(assert (=> d!9266 m!46559))

(declare-fun m!46561 () Bool)

(assert (=> d!9266 m!46561))

(declare-fun m!46563 () Bool)

(assert (=> d!9266 m!46563))

(assert (=> b!31570 m!46551))

(assert (=> b!31570 m!45645))

(assert (=> b!31078 d!9266))

(declare-fun b!31572 () Bool)

(declare-fun e!20910 () Unit!2381)

(declare-fun Unit!2415 () Unit!2381)

(assert (=> b!31572 (= e!20910 Unit!2415)))

(declare-fun b!31573 () Bool)

(declare-fun lt!46647 () Unit!2381)

(assert (=> b!31573 (= e!20910 lt!46647)))

(declare-fun lt!46652 () (_ BitVec 64))

(assert (=> b!31573 (= lt!46652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46648 () (_ BitVec 64))

(assert (=> b!31573 (= lt!46648 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (=> b!31573 (= lt!46647 (arrayBitRangesEqSymmetric!0 (buf!1115 (_2!1706 lt!45582)) (buf!1115 (_2!1706 lt!45567)) lt!46652 lt!46648))))

(assert (=> b!31573 (arrayBitRangesEq!0 (buf!1115 (_2!1706 lt!45567)) (buf!1115 (_2!1706 lt!45582)) lt!46652 lt!46648)))

(declare-fun b!31574 () Bool)

(declare-fun res!27027 () Bool)

(declare-fun e!20909 () Bool)

(assert (=> b!31574 (=> (not res!27027) (not e!20909))))

(declare-fun lt!46651 () tuple2!3240)

(assert (=> b!31574 (= res!27027 (isPrefixOf!0 (_1!1707 lt!46651) (_2!1706 lt!45582)))))

(declare-fun d!9272 () Bool)

(assert (=> d!9272 e!20909))

(declare-fun res!27025 () Bool)

(assert (=> d!9272 (=> (not res!27025) (not e!20909))))

(assert (=> d!9272 (= res!27025 (isPrefixOf!0 (_1!1707 lt!46651) (_2!1707 lt!46651)))))

(declare-fun lt!46640 () BitStream!1378)

(assert (=> d!9272 (= lt!46651 (tuple2!3241 lt!46640 (_2!1706 lt!45567)))))

(declare-fun lt!46642 () Unit!2381)

(declare-fun lt!46637 () Unit!2381)

(assert (=> d!9272 (= lt!46642 lt!46637)))

(assert (=> d!9272 (isPrefixOf!0 lt!46640 (_2!1706 lt!45567))))

(assert (=> d!9272 (= lt!46637 (lemmaIsPrefixTransitive!0 lt!46640 (_2!1706 lt!45567) (_2!1706 lt!45567)))))

(declare-fun lt!46634 () Unit!2381)

(declare-fun lt!46650 () Unit!2381)

(assert (=> d!9272 (= lt!46634 lt!46650)))

(assert (=> d!9272 (isPrefixOf!0 lt!46640 (_2!1706 lt!45567))))

(assert (=> d!9272 (= lt!46650 (lemmaIsPrefixTransitive!0 lt!46640 (_2!1706 lt!45582) (_2!1706 lt!45567)))))

(declare-fun lt!46636 () Unit!2381)

(assert (=> d!9272 (= lt!46636 e!20910)))

(declare-fun c!2142 () Bool)

(assert (=> d!9272 (= c!2142 (not (= (size!787 (buf!1115 (_2!1706 lt!45582))) #b00000000000000000000000000000000)))))

(declare-fun lt!46635 () Unit!2381)

(declare-fun lt!46638 () Unit!2381)

(assert (=> d!9272 (= lt!46635 lt!46638)))

(assert (=> d!9272 (isPrefixOf!0 (_2!1706 lt!45567) (_2!1706 lt!45567))))

(assert (=> d!9272 (= lt!46638 (lemmaIsPrefixRefl!0 (_2!1706 lt!45567)))))

(declare-fun lt!46653 () Unit!2381)

(declare-fun lt!46644 () Unit!2381)

(assert (=> d!9272 (= lt!46653 lt!46644)))

(assert (=> d!9272 (= lt!46644 (lemmaIsPrefixRefl!0 (_2!1706 lt!45567)))))

(declare-fun lt!46641 () Unit!2381)

(declare-fun lt!46646 () Unit!2381)

(assert (=> d!9272 (= lt!46641 lt!46646)))

(assert (=> d!9272 (isPrefixOf!0 lt!46640 lt!46640)))

(assert (=> d!9272 (= lt!46646 (lemmaIsPrefixRefl!0 lt!46640))))

(declare-fun lt!46643 () Unit!2381)

(declare-fun lt!46639 () Unit!2381)

(assert (=> d!9272 (= lt!46643 lt!46639)))

(assert (=> d!9272 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45582))))

(assert (=> d!9272 (= lt!46639 (lemmaIsPrefixRefl!0 (_2!1706 lt!45582)))))

(assert (=> d!9272 (= lt!46640 (BitStream!1379 (buf!1115 (_2!1706 lt!45567)) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (=> d!9272 (isPrefixOf!0 (_2!1706 lt!45582) (_2!1706 lt!45567))))

(assert (=> d!9272 (= (reader!0 (_2!1706 lt!45582) (_2!1706 lt!45567)) lt!46651)))

(declare-fun b!31575 () Bool)

(declare-fun res!27026 () Bool)

(assert (=> b!31575 (=> (not res!27026) (not e!20909))))

(assert (=> b!31575 (= res!27026 (isPrefixOf!0 (_2!1707 lt!46651) (_2!1706 lt!45567)))))

(declare-fun lt!46645 () (_ BitVec 64))

(declare-fun b!31576 () Bool)

(declare-fun lt!46649 () (_ BitVec 64))

(assert (=> b!31576 (= e!20909 (= (_1!1707 lt!46651) (withMovedBitIndex!0 (_2!1707 lt!46651) (bvsub lt!46649 lt!46645))))))

(assert (=> b!31576 (or (= (bvand lt!46649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46649 lt!46645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31576 (= lt!46645 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567))))))

(assert (=> b!31576 (= lt!46649 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45582))) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582))))))

(assert (= (and d!9272 c!2142) b!31573))

(assert (= (and d!9272 (not c!2142)) b!31572))

(assert (= (and d!9272 res!27025) b!31574))

(assert (= (and b!31574 res!27027) b!31575))

(assert (= (and b!31575 res!27026) b!31576))

(declare-fun m!46565 () Bool)

(assert (=> b!31575 m!46565))

(declare-fun m!46567 () Bool)

(assert (=> b!31576 m!46567))

(assert (=> b!31576 m!45665))

(assert (=> b!31576 m!45635))

(assert (=> b!31573 m!45635))

(declare-fun m!46569 () Bool)

(assert (=> b!31573 m!46569))

(declare-fun m!46571 () Bool)

(assert (=> b!31573 m!46571))

(declare-fun m!46573 () Bool)

(assert (=> b!31574 m!46573))

(assert (=> d!9272 m!45677))

(declare-fun m!46575 () Bool)

(assert (=> d!9272 m!46575))

(declare-fun m!46577 () Bool)

(assert (=> d!9272 m!46577))

(declare-fun m!46579 () Bool)

(assert (=> d!9272 m!46579))

(declare-fun m!46581 () Bool)

(assert (=> d!9272 m!46581))

(declare-fun m!46583 () Bool)

(assert (=> d!9272 m!46583))

(declare-fun m!46585 () Bool)

(assert (=> d!9272 m!46585))

(assert (=> d!9272 m!46341))

(declare-fun m!46587 () Bool)

(assert (=> d!9272 m!46587))

(assert (=> d!9272 m!46343))

(declare-fun m!46589 () Bool)

(assert (=> d!9272 m!46589))

(assert (=> b!31088 d!9272))

(declare-datatypes ((tuple2!3270 0))(
  ( (tuple2!3271 (_1!1722 Bool) (_2!1722 BitStream!1378)) )
))
(declare-fun lt!46662 () tuple2!3270)

(declare-fun b!31586 () Bool)

(declare-fun lt!46660 () (_ BitVec 64))

(declare-datatypes ((tuple2!3272 0))(
  ( (tuple2!3273 (_1!1723 List!390) (_2!1723 BitStream!1378)) )
))
(declare-fun e!20916 () tuple2!3272)

(assert (=> b!31586 (= e!20916 (tuple2!3273 (Cons!386 (_1!1722 lt!46662) (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_2!1722 lt!46662) (bvsub (bvsub to!314 i!635) lt!46660))) (_2!1722 lt!46662)))))

(declare-fun readBit!0 (BitStream!1378) tuple2!3270)

(assert (=> b!31586 (= lt!46662 (readBit!0 (_1!1707 lt!45565)))))

(assert (=> b!31586 (= lt!46660 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31585 () Bool)

(assert (=> b!31585 (= e!20916 (tuple2!3273 Nil!387 (_1!1707 lt!45565)))))

(declare-fun d!9274 () Bool)

(declare-fun e!20915 () Bool)

(assert (=> d!9274 e!20915))

(declare-fun c!2147 () Bool)

(assert (=> d!9274 (= c!2147 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!46661 () List!390)

(assert (=> d!9274 (= lt!46661 (_1!1723 e!20916))))

(declare-fun c!2148 () Bool)

(assert (=> d!9274 (= c!2148 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9274 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9274 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_1!1707 lt!45565) (bvsub to!314 i!635)) lt!46661)))

(declare-fun b!31588 () Bool)

(assert (=> b!31588 (= e!20915 (> (length!116 lt!46661) 0))))

(declare-fun b!31587 () Bool)

(declare-fun isEmpty!86 (List!390) Bool)

(assert (=> b!31587 (= e!20915 (isEmpty!86 lt!46661))))

(assert (= (and d!9274 c!2148) b!31585))

(assert (= (and d!9274 (not c!2148)) b!31586))

(assert (= (and d!9274 c!2147) b!31587))

(assert (= (and d!9274 (not c!2147)) b!31588))

(declare-fun m!46591 () Bool)

(assert (=> b!31586 m!46591))

(declare-fun m!46593 () Bool)

(assert (=> b!31586 m!46593))

(declare-fun m!46595 () Bool)

(assert (=> b!31588 m!46595))

(declare-fun m!46597 () Bool)

(assert (=> b!31587 m!46597))

(assert (=> b!31088 d!9274))

(declare-fun d!9276 () Bool)

(assert (=> d!9276 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!45570)))

(declare-fun lt!46663 () Unit!2381)

(assert (=> d!9276 (= lt!46663 (choose!9 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!45567)) lt!45570 (BitStream!1379 (buf!1115 (_2!1706 lt!45567)) (currentByte!2470 (_2!1706 lt!45582)) (currentBit!2465 (_2!1706 lt!45582)))))))

(assert (=> d!9276 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1706 lt!45582) (buf!1115 (_2!1706 lt!45567)) lt!45570) lt!46663)))

(declare-fun bs!2551 () Bool)

(assert (= bs!2551 d!9276))

(assert (=> bs!2551 m!45627))

(declare-fun m!46599 () Bool)

(assert (=> bs!2551 m!46599))

(assert (=> b!31088 d!9276))

(declare-fun d!9278 () Bool)

(assert (=> d!9278 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2552 () Bool)

(assert (= bs!2552 d!9278))

(declare-fun m!46601 () Bool)

(assert (=> bs!2552 m!46601))

(assert (=> b!31088 d!9278))

(declare-fun d!9280 () Bool)

(assert (=> d!9280 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582))) lt!45570) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 (_2!1706 lt!45582))) ((_ sign_extend 32) (currentBit!2465 (_2!1706 lt!45582)))) lt!45570))))

(declare-fun bs!2553 () Bool)

(assert (= bs!2553 d!9280))

(declare-fun m!46603 () Bool)

(assert (=> bs!2553 m!46603))

(assert (=> b!31088 d!9280))

(declare-fun b!31590 () Bool)

(declare-fun lt!46664 () (_ BitVec 64))

(declare-fun e!20918 () tuple2!3272)

(declare-fun lt!46666 () tuple2!3270)

(assert (=> b!31590 (= e!20918 (tuple2!3273 (Cons!386 (_1!1722 lt!46666) (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_2!1722 lt!46666) (bvsub lt!45570 lt!46664))) (_2!1722 lt!46666)))))

(assert (=> b!31590 (= lt!46666 (readBit!0 (_1!1707 lt!45580)))))

(assert (=> b!31590 (= lt!46664 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31589 () Bool)

(assert (=> b!31589 (= e!20918 (tuple2!3273 Nil!387 (_1!1707 lt!45580)))))

(declare-fun d!9282 () Bool)

(declare-fun e!20917 () Bool)

(assert (=> d!9282 e!20917))

(declare-fun c!2149 () Bool)

(assert (=> d!9282 (= c!2149 (= lt!45570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!46665 () List!390)

(assert (=> d!9282 (= lt!46665 (_1!1723 e!20918))))

(declare-fun c!2150 () Bool)

(assert (=> d!9282 (= c!2150 (= lt!45570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9282 (bvsge lt!45570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9282 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_1!1707 lt!45580) lt!45570) lt!46665)))

(declare-fun b!31592 () Bool)

(assert (=> b!31592 (= e!20917 (> (length!116 lt!46665) 0))))

(declare-fun b!31591 () Bool)

(assert (=> b!31591 (= e!20917 (isEmpty!86 lt!46665))))

(assert (= (and d!9282 c!2150) b!31589))

(assert (= (and d!9282 (not c!2150)) b!31590))

(assert (= (and d!9282 c!2149) b!31591))

(assert (= (and d!9282 (not c!2149)) b!31592))

(declare-fun m!46605 () Bool)

(assert (=> b!31590 m!46605))

(declare-fun m!46607 () Bool)

(assert (=> b!31590 m!46607))

(declare-fun m!46609 () Bool)

(assert (=> b!31592 m!46609))

(declare-fun m!46611 () Bool)

(assert (=> b!31591 m!46611))

(assert (=> b!31088 d!9282))

(declare-fun b!31593 () Bool)

(declare-fun e!20920 () Unit!2381)

(declare-fun Unit!2416 () Unit!2381)

(assert (=> b!31593 (= e!20920 Unit!2416)))

(declare-fun b!31594 () Bool)

(declare-fun lt!46680 () Unit!2381)

(assert (=> b!31594 (= e!20920 lt!46680)))

(declare-fun lt!46685 () (_ BitVec 64))

(assert (=> b!31594 (= lt!46685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46681 () (_ BitVec 64))

(assert (=> b!31594 (= lt!46681 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(assert (=> b!31594 (= lt!46680 (arrayBitRangesEqSymmetric!0 (buf!1115 thiss!1379) (buf!1115 (_2!1706 lt!45567)) lt!46685 lt!46681))))

(assert (=> b!31594 (arrayBitRangesEq!0 (buf!1115 (_2!1706 lt!45567)) (buf!1115 thiss!1379) lt!46685 lt!46681)))

(declare-fun b!31595 () Bool)

(declare-fun res!27030 () Bool)

(declare-fun e!20919 () Bool)

(assert (=> b!31595 (=> (not res!27030) (not e!20919))))

(declare-fun lt!46684 () tuple2!3240)

(assert (=> b!31595 (= res!27030 (isPrefixOf!0 (_1!1707 lt!46684) thiss!1379))))

(declare-fun d!9284 () Bool)

(assert (=> d!9284 e!20919))

(declare-fun res!27028 () Bool)

(assert (=> d!9284 (=> (not res!27028) (not e!20919))))

(assert (=> d!9284 (= res!27028 (isPrefixOf!0 (_1!1707 lt!46684) (_2!1707 lt!46684)))))

(declare-fun lt!46673 () BitStream!1378)

(assert (=> d!9284 (= lt!46684 (tuple2!3241 lt!46673 (_2!1706 lt!45567)))))

(declare-fun lt!46675 () Unit!2381)

(declare-fun lt!46670 () Unit!2381)

(assert (=> d!9284 (= lt!46675 lt!46670)))

(assert (=> d!9284 (isPrefixOf!0 lt!46673 (_2!1706 lt!45567))))

(assert (=> d!9284 (= lt!46670 (lemmaIsPrefixTransitive!0 lt!46673 (_2!1706 lt!45567) (_2!1706 lt!45567)))))

(declare-fun lt!46667 () Unit!2381)

(declare-fun lt!46683 () Unit!2381)

(assert (=> d!9284 (= lt!46667 lt!46683)))

(assert (=> d!9284 (isPrefixOf!0 lt!46673 (_2!1706 lt!45567))))

(assert (=> d!9284 (= lt!46683 (lemmaIsPrefixTransitive!0 lt!46673 thiss!1379 (_2!1706 lt!45567)))))

(declare-fun lt!46669 () Unit!2381)

(assert (=> d!9284 (= lt!46669 e!20920)))

(declare-fun c!2151 () Bool)

(assert (=> d!9284 (= c!2151 (not (= (size!787 (buf!1115 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!46668 () Unit!2381)

(declare-fun lt!46671 () Unit!2381)

(assert (=> d!9284 (= lt!46668 lt!46671)))

(assert (=> d!9284 (isPrefixOf!0 (_2!1706 lt!45567) (_2!1706 lt!45567))))

(assert (=> d!9284 (= lt!46671 (lemmaIsPrefixRefl!0 (_2!1706 lt!45567)))))

(declare-fun lt!46686 () Unit!2381)

(declare-fun lt!46677 () Unit!2381)

(assert (=> d!9284 (= lt!46686 lt!46677)))

(assert (=> d!9284 (= lt!46677 (lemmaIsPrefixRefl!0 (_2!1706 lt!45567)))))

(declare-fun lt!46674 () Unit!2381)

(declare-fun lt!46679 () Unit!2381)

(assert (=> d!9284 (= lt!46674 lt!46679)))

(assert (=> d!9284 (isPrefixOf!0 lt!46673 lt!46673)))

(assert (=> d!9284 (= lt!46679 (lemmaIsPrefixRefl!0 lt!46673))))

(declare-fun lt!46676 () Unit!2381)

(declare-fun lt!46672 () Unit!2381)

(assert (=> d!9284 (= lt!46676 lt!46672)))

(assert (=> d!9284 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9284 (= lt!46672 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9284 (= lt!46673 (BitStream!1379 (buf!1115 (_2!1706 lt!45567)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(assert (=> d!9284 (isPrefixOf!0 thiss!1379 (_2!1706 lt!45567))))

(assert (=> d!9284 (= (reader!0 thiss!1379 (_2!1706 lt!45567)) lt!46684)))

(declare-fun b!31596 () Bool)

(declare-fun res!27029 () Bool)

(assert (=> b!31596 (=> (not res!27029) (not e!20919))))

(assert (=> b!31596 (= res!27029 (isPrefixOf!0 (_2!1707 lt!46684) (_2!1706 lt!45567)))))

(declare-fun lt!46678 () (_ BitVec 64))

(declare-fun b!31597 () Bool)

(declare-fun lt!46682 () (_ BitVec 64))

(assert (=> b!31597 (= e!20919 (= (_1!1707 lt!46684) (withMovedBitIndex!0 (_2!1707 lt!46684) (bvsub lt!46682 lt!46678))))))

(assert (=> b!31597 (or (= (bvand lt!46682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46682 lt!46678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31597 (= lt!46678 (bitIndex!0 (size!787 (buf!1115 (_2!1706 lt!45567))) (currentByte!2470 (_2!1706 lt!45567)) (currentBit!2465 (_2!1706 lt!45567))))))

(assert (=> b!31597 (= lt!46682 (bitIndex!0 (size!787 (buf!1115 thiss!1379)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379)))))

(assert (= (and d!9284 c!2151) b!31594))

(assert (= (and d!9284 (not c!2151)) b!31593))

(assert (= (and d!9284 res!27028) b!31595))

(assert (= (and b!31595 res!27030) b!31596))

(assert (= (and b!31596 res!27029) b!31597))

(declare-fun m!46613 () Bool)

(assert (=> b!31596 m!46613))

(declare-fun m!46615 () Bool)

(assert (=> b!31597 m!46615))

(assert (=> b!31597 m!45665))

(assert (=> b!31597 m!45645))

(assert (=> b!31594 m!45645))

(declare-fun m!46617 () Bool)

(assert (=> b!31594 m!46617))

(declare-fun m!46619 () Bool)

(assert (=> b!31594 m!46619))

(declare-fun m!46621 () Bool)

(assert (=> b!31595 m!46621))

(assert (=> d!9284 m!45667))

(assert (=> d!9284 m!46575))

(assert (=> d!9284 m!46577))

(declare-fun m!46623 () Bool)

(assert (=> d!9284 m!46623))

(declare-fun m!46625 () Bool)

(assert (=> d!9284 m!46625))

(declare-fun m!46627 () Bool)

(assert (=> d!9284 m!46627))

(declare-fun m!46629 () Bool)

(assert (=> d!9284 m!46629))

(assert (=> d!9284 m!45641))

(declare-fun m!46631 () Bool)

(assert (=> d!9284 m!46631))

(assert (=> d!9284 m!45643))

(declare-fun m!46633 () Bool)

(assert (=> d!9284 m!46633))

(assert (=> b!31088 d!9284))

(declare-fun d!9286 () Bool)

(assert (=> d!9286 (validate_offset_bits!1 ((_ sign_extend 32) (size!787 (buf!1115 (_2!1706 lt!45567)))) ((_ sign_extend 32) (currentByte!2470 thiss!1379)) ((_ sign_extend 32) (currentBit!2465 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46687 () Unit!2381)

(assert (=> d!9286 (= lt!46687 (choose!9 thiss!1379 (buf!1115 (_2!1706 lt!45567)) (bvsub to!314 i!635) (BitStream!1379 (buf!1115 (_2!1706 lt!45567)) (currentByte!2470 thiss!1379) (currentBit!2465 thiss!1379))))))

(assert (=> d!9286 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1115 (_2!1706 lt!45567)) (bvsub to!314 i!635)) lt!46687)))

(declare-fun bs!2554 () Bool)

(assert (= bs!2554 d!9286))

(assert (=> bs!2554 m!45621))

(declare-fun m!46635 () Bool)

(assert (=> bs!2554 m!46635))

(assert (=> b!31088 d!9286))

(declare-fun d!9288 () Bool)

(declare-fun c!2154 () Bool)

(assert (=> d!9288 (= c!2154 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20923 () List!390)

(assert (=> d!9288 (= (byteArrayBitContentToList!0 (_2!1706 lt!45567) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!20923)))

(declare-fun b!31602 () Bool)

(assert (=> b!31602 (= e!20923 Nil!387)))

(declare-fun b!31603 () Bool)

(assert (=> b!31603 (= e!20923 (Cons!386 (not (= (bvand ((_ sign_extend 24) (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1706 lt!45567) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9288 c!2154) b!31602))

(assert (= (and d!9288 (not c!2154)) b!31603))

(assert (=> b!31603 m!45651))

(assert (=> b!31603 m!46563))

(declare-fun m!46637 () Bool)

(assert (=> b!31603 m!46637))

(assert (=> b!31077 d!9288))

(declare-fun d!9290 () Bool)

(assert (=> d!9290 (= (head!227 (byteArrayBitContentToList!0 (_2!1706 lt!45582) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!505 (byteArrayBitContentToList!0 (_2!1706 lt!45582) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31076 d!9290))

(declare-fun d!9292 () Bool)

(declare-fun c!2155 () Bool)

(assert (=> d!9292 (= c!2155 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20924 () List!390)

(assert (=> d!9292 (= (byteArrayBitContentToList!0 (_2!1706 lt!45582) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20924)))

(declare-fun b!31604 () Bool)

(assert (=> b!31604 (= e!20924 Nil!387)))

(declare-fun b!31605 () Bool)

(assert (=> b!31605 (= e!20924 (Cons!386 (not (= (bvand ((_ sign_extend 24) (select (arr!1256 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1706 lt!45582) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9292 c!2155) b!31604))

(assert (= (and d!9292 (not c!2155)) b!31605))

(assert (=> b!31605 m!45651))

(assert (=> b!31605 m!46563))

(declare-fun m!46639 () Bool)

(assert (=> b!31605 m!46639))

(assert (=> b!31076 d!9292))

(declare-fun d!9294 () Bool)

(assert (=> d!9294 (= (head!227 (bitStreamReadBitsIntoList!0 (_2!1706 lt!45582) (_1!1707 lt!45568) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!505 (bitStreamReadBitsIntoList!0 (_2!1706 lt!45582) (_1!1707 lt!45568) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31076 d!9294))

(declare-fun lt!46690 () tuple2!3270)

(declare-fun b!31607 () Bool)

(declare-fun lt!46688 () (_ BitVec 64))

(declare-fun e!20926 () tuple2!3272)

(assert (=> b!31607 (= e!20926 (tuple2!3273 (Cons!386 (_1!1722 lt!46690) (bitStreamReadBitsIntoList!0 (_2!1706 lt!45582) (_2!1722 lt!46690) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!46688))) (_2!1722 lt!46690)))))

(assert (=> b!31607 (= lt!46690 (readBit!0 (_1!1707 lt!45568)))))

(assert (=> b!31607 (= lt!46688 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31606 () Bool)

(assert (=> b!31606 (= e!20926 (tuple2!3273 Nil!387 (_1!1707 lt!45568)))))

(declare-fun d!9296 () Bool)

(declare-fun e!20925 () Bool)

(assert (=> d!9296 e!20925))

(declare-fun c!2156 () Bool)

(assert (=> d!9296 (= c!2156 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!46689 () List!390)

(assert (=> d!9296 (= lt!46689 (_1!1723 e!20926))))

(declare-fun c!2157 () Bool)

(assert (=> d!9296 (= c!2157 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9296 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9296 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!45582) (_1!1707 lt!45568) #b0000000000000000000000000000000000000000000000000000000000000001) lt!46689)))

(declare-fun b!31609 () Bool)

(assert (=> b!31609 (= e!20925 (> (length!116 lt!46689) 0))))

(declare-fun b!31608 () Bool)

(assert (=> b!31608 (= e!20925 (isEmpty!86 lt!46689))))

(assert (= (and d!9296 c!2157) b!31606))

(assert (= (and d!9296 (not c!2157)) b!31607))

(assert (= (and d!9296 c!2156) b!31608))

(assert (= (and d!9296 (not c!2156)) b!31609))

(declare-fun m!46641 () Bool)

(assert (=> b!31607 m!46641))

(declare-fun m!46643 () Bool)

(assert (=> b!31607 m!46643))

(declare-fun m!46645 () Bool)

(assert (=> b!31609 m!46645))

(declare-fun m!46647 () Bool)

(assert (=> b!31608 m!46647))

(assert (=> b!31076 d!9296))

(declare-fun d!9298 () Bool)

(assert (=> d!9298 (= (invariant!0 (currentBit!2465 (_2!1706 lt!45567)) (currentByte!2470 (_2!1706 lt!45567)) (size!787 (buf!1115 (_2!1706 lt!45567)))) (and (bvsge (currentBit!2465 (_2!1706 lt!45567)) #b00000000000000000000000000000000) (bvslt (currentBit!2465 (_2!1706 lt!45567)) #b00000000000000000000000000001000) (bvsge (currentByte!2470 (_2!1706 lt!45567)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2470 (_2!1706 lt!45567)) (size!787 (buf!1115 (_2!1706 lt!45567)))) (and (= (currentBit!2465 (_2!1706 lt!45567)) #b00000000000000000000000000000000) (= (currentByte!2470 (_2!1706 lt!45567)) (size!787 (buf!1115 (_2!1706 lt!45567))))))))))

(assert (=> b!31086 d!9298))

(declare-fun d!9300 () Bool)

(assert (=> d!9300 (= (tail!107 lt!45576) (t!1140 lt!45576))))

(assert (=> b!31085 d!9300))

(declare-fun d!9302 () Bool)

(declare-fun e!20929 () Bool)

(assert (=> d!9302 e!20929))

(declare-fun res!27033 () Bool)

(assert (=> d!9302 (=> (not res!27033) (not e!20929))))

(declare-fun lt!46696 () (_ BitVec 64))

(assert (=> d!9302 (= res!27033 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!46696) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9302 (= lt!46696 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46695 () Unit!2381)

(declare-fun choose!42 (BitStream!1378 BitStream!1378 BitStream!1378 BitStream!1378 (_ BitVec 64) List!390) Unit!2381)

(assert (=> d!9302 (= lt!46695 (choose!42 (_2!1706 lt!45567) (_2!1706 lt!45567) (_1!1707 lt!45565) (_1!1707 lt!45580) (bvsub to!314 i!635) lt!45576))))

(assert (=> d!9302 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9302 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1706 lt!45567) (_2!1706 lt!45567) (_1!1707 lt!45565) (_1!1707 lt!45580) (bvsub to!314 i!635) lt!45576) lt!46695)))

(declare-fun b!31612 () Bool)

(assert (=> b!31612 (= e!20929 (= (bitStreamReadBitsIntoList!0 (_2!1706 lt!45567) (_1!1707 lt!45580) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!107 lt!45576)))))

(assert (= (and d!9302 res!27033) b!31612))

(declare-fun m!46649 () Bool)

(assert (=> d!9302 m!46649))

(declare-fun m!46651 () Bool)

(assert (=> b!31612 m!46651))

(assert (=> b!31612 m!45661))

(assert (=> b!31085 d!9302))

(declare-fun d!9304 () Bool)

(assert (=> d!9304 (= (invariant!0 (currentBit!2465 (_2!1706 lt!45582)) (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45582)))) (and (bvsge (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (bvslt (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000001000) (bvsge (currentByte!2470 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45582)))) (and (= (currentBit!2465 (_2!1706 lt!45582)) #b00000000000000000000000000000000) (= (currentByte!2470 (_2!1706 lt!45582)) (size!787 (buf!1115 (_2!1706 lt!45582))))))))))

(assert (=> b!31074 d!9304))

(push 1)

(assert (not b!31569))

(assert (not d!9272))

(assert (not d!9284))

(assert (not b!31456))

(assert (not b!31510))

(assert (not b!31605))

(assert (not b!31597))

(assert (not b!31458))

(assert (not b!31603))

(assert (not b!31511))

(assert (not b!31591))

(assert (not b!31588))

(assert (not b!31576))

(assert (not b!31251))

(assert (not d!9262))

(assert (not d!9280))

(assert (not d!9096))

(assert (not b!31595))

(assert (not b!31587))

(assert (not d!9092))

(assert (not b!31519))

(assert (not b!31570))

(assert (not b!31565))

(assert (not b!31564))

(assert (not b!31594))

(assert (not b!31568))

(assert (not b!31609))

(assert (not b!31457))

(assert (not b!31607))

(assert (not d!9114))

(assert (not b!31586))

(assert (not b!31253))

(assert (not d!9278))

(assert (not d!9302))

(assert (not b!31566))

(assert (not d!9264))

(assert (not d!9078))

(assert (not d!9234))

(assert (not b!31508))

(assert (not b!31575))

(assert (not b!31516))

(assert (not d!9266))

(assert (not b!31608))

(assert (not b!31571))

(assert (not b!31455))

(assert (not b!31246))

(assert (not b!31592))

(assert (not bm!406))

(assert (not d!9124))

(assert (not d!9256))

(assert (not b!31507))

(assert (not b!31573))

(assert (not b!31461))

(assert (not d!9086))

(assert (not d!9080))

(assert (not d!9112))

(assert (not b!31513))

(assert (not b!31590))

(assert (not d!9286))

(assert (not b!31574))

(assert (not b!31596))

(assert (not b!31248))

(assert (not d!9258))

(assert (not b!31462))

(assert (not b!31509))

(assert (not b!31514))

(assert (not d!9118))

(assert (not d!9276))

(assert (not b!31567))

(assert (not b!31612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

