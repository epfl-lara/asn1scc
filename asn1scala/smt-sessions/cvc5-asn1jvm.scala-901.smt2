; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25480 () Bool)

(assert start!25480)

(declare-fun b!128905 () Bool)

(declare-fun res!106714 () Bool)

(declare-fun e!85451 () Bool)

(assert (=> b!128905 (=> (not res!106714) (not e!85451))))

(declare-datatypes ((array!5965 0))(
  ( (array!5966 (arr!3315 (Array (_ BitVec 32) (_ BitVec 8))) (size!2698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4660 0))(
  ( (BitStream!4661 (buf!3056 array!5965) (currentByte!5817 (_ BitVec 32)) (currentBit!5812 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4660)

(declare-datatypes ((Unit!8001 0))(
  ( (Unit!8002) )
))
(declare-datatypes ((tuple2!10954 0))(
  ( (tuple2!10955 (_1!5774 Unit!8001) (_2!5774 BitStream!4660)) )
))
(declare-fun lt!199640 () tuple2!10954)

(declare-fun isPrefixOf!0 (BitStream!4660 BitStream!4660) Bool)

(assert (=> b!128905 (= res!106714 (isPrefixOf!0 thiss!1634 (_2!5774 lt!199640)))))

(declare-fun arr!237 () array!5965)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!10956 0))(
  ( (tuple2!10957 (_1!5775 BitStream!4660) (_2!5775 (_ BitVec 8))) )
))
(declare-fun lt!199638 () tuple2!10956)

(declare-datatypes ((tuple2!10958 0))(
  ( (tuple2!10959 (_1!5776 BitStream!4660) (_2!5776 BitStream!4660)) )
))
(declare-fun lt!199639 () tuple2!10958)

(declare-fun b!128906 () Bool)

(assert (=> b!128906 (= e!85451 (and (= (_2!5775 lt!199638) (select (arr!3315 arr!237) from!447)) (= (_1!5775 lt!199638) (_2!5776 lt!199639))))))

(declare-fun readBytePure!0 (BitStream!4660) tuple2!10956)

(assert (=> b!128906 (= lt!199638 (readBytePure!0 (_1!5776 lt!199639)))))

(declare-fun reader!0 (BitStream!4660 BitStream!4660) tuple2!10958)

(assert (=> b!128906 (= lt!199639 (reader!0 thiss!1634 (_2!5774 lt!199640)))))

(declare-fun b!128907 () Bool)

(declare-fun res!106712 () Bool)

(declare-fun e!85450 () Bool)

(assert (=> b!128907 (=> (not res!106712) (not e!85450))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128907 (= res!106712 (invariant!0 (currentBit!5812 thiss!1634) (currentByte!5817 thiss!1634) (size!2698 (buf!3056 thiss!1634))))))

(declare-fun b!128908 () Bool)

(declare-fun e!85449 () Bool)

(declare-fun array_inv!2487 (array!5965) Bool)

(assert (=> b!128908 (= e!85449 (array_inv!2487 (buf!3056 thiss!1634)))))

(declare-fun b!128909 () Bool)

(declare-fun res!106710 () Bool)

(assert (=> b!128909 (=> (not res!106710) (not e!85450))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128909 (= res!106710 (bvslt from!447 to!404))))

(declare-fun b!128910 () Bool)

(assert (=> b!128910 (= e!85450 (not true))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128910 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2698 (buf!3056 (_2!5774 lt!199640)))) ((_ sign_extend 32) (currentByte!5817 (_2!5774 lt!199640))) ((_ sign_extend 32) (currentBit!5812 (_2!5774 lt!199640))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199637 () Unit!8001)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4660 BitStream!4660 (_ BitVec 64) (_ BitVec 32)) Unit!8001)

(assert (=> b!128910 (= lt!199637 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5774 lt!199640) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!128910 e!85451))

(declare-fun res!106711 () Bool)

(assert (=> b!128910 (=> (not res!106711) (not e!85451))))

(assert (=> b!128910 (= res!106711 (= (size!2698 (buf!3056 thiss!1634)) (size!2698 (buf!3056 (_2!5774 lt!199640)))))))

(declare-fun appendByte!0 (BitStream!4660 (_ BitVec 8)) tuple2!10954)

(assert (=> b!128910 (= lt!199640 (appendByte!0 thiss!1634 (select (arr!3315 arr!237) from!447)))))

(declare-fun res!106708 () Bool)

(assert (=> start!25480 (=> (not res!106708) (not e!85450))))

(assert (=> start!25480 (= res!106708 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2698 arr!237))))))

(assert (=> start!25480 e!85450))

(assert (=> start!25480 true))

(assert (=> start!25480 (array_inv!2487 arr!237)))

(declare-fun inv!12 (BitStream!4660) Bool)

(assert (=> start!25480 (and (inv!12 thiss!1634) e!85449)))

(declare-fun b!128911 () Bool)

(declare-fun res!106713 () Bool)

(assert (=> b!128911 (=> (not res!106713) (not e!85451))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128911 (= res!106713 (= (bitIndex!0 (size!2698 (buf!3056 (_2!5774 lt!199640))) (currentByte!5817 (_2!5774 lt!199640)) (currentBit!5812 (_2!5774 lt!199640))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2698 (buf!3056 thiss!1634)) (currentByte!5817 thiss!1634) (currentBit!5812 thiss!1634)))))))

(declare-fun b!128912 () Bool)

(declare-fun res!106709 () Bool)

(assert (=> b!128912 (=> (not res!106709) (not e!85450))))

(assert (=> b!128912 (= res!106709 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2698 (buf!3056 thiss!1634))) ((_ sign_extend 32) (currentByte!5817 thiss!1634)) ((_ sign_extend 32) (currentBit!5812 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25480 res!106708) b!128912))

(assert (= (and b!128912 res!106709) b!128909))

(assert (= (and b!128909 res!106710) b!128907))

(assert (= (and b!128907 res!106712) b!128910))

(assert (= (and b!128910 res!106711) b!128911))

(assert (= (and b!128911 res!106713) b!128905))

(assert (= (and b!128905 res!106714) b!128906))

(assert (= start!25480 b!128908))

(declare-fun m!194653 () Bool)

(assert (=> b!128911 m!194653))

(declare-fun m!194655 () Bool)

(assert (=> b!128911 m!194655))

(declare-fun m!194657 () Bool)

(assert (=> start!25480 m!194657))

(declare-fun m!194659 () Bool)

(assert (=> start!25480 m!194659))

(declare-fun m!194661 () Bool)

(assert (=> b!128910 m!194661))

(declare-fun m!194663 () Bool)

(assert (=> b!128910 m!194663))

(declare-fun m!194665 () Bool)

(assert (=> b!128910 m!194665))

(assert (=> b!128910 m!194665))

(declare-fun m!194667 () Bool)

(assert (=> b!128910 m!194667))

(declare-fun m!194669 () Bool)

(assert (=> b!128907 m!194669))

(declare-fun m!194671 () Bool)

(assert (=> b!128912 m!194671))

(declare-fun m!194673 () Bool)

(assert (=> b!128908 m!194673))

(declare-fun m!194675 () Bool)

(assert (=> b!128905 m!194675))

(assert (=> b!128906 m!194665))

(declare-fun m!194677 () Bool)

(assert (=> b!128906 m!194677))

(declare-fun m!194679 () Bool)

(assert (=> b!128906 m!194679))

(push 1)

(assert (not b!128906))

(assert (not b!128907))

(assert (not b!128910))

(assert (not b!128912))

(assert (not b!128905))

(assert (not start!25480))

(assert (not b!128908))

(assert (not b!128911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

